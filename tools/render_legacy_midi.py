#!/usr/bin/env python3
"""Render the project's legacy MIDI sound assets to GameMaker-compatible WAV.

Modern GameMaker runtimes no longer support MIDI sound resources. This small,
dependency-free renderer preserves the original MIDI files and creates compact
mono WAV fallbacks with a basic General MIDI-style synthesizer.
"""
from __future__ import annotations

import argparse
from array import array
import json
import math
from pathlib import Path
import re
import struct
import wave

SAMPLE_RATE = 11025
TABLE_SIZE = 2048
SINE = [math.sin(2 * math.pi * i / TABLE_SIZE) for i in range(TABLE_SIZE)]


def read_varlen(data: bytes, pos: int) -> tuple[int, int]:
    value = 0
    while True:
        byte = data[pos]
        pos += 1
        value = (value << 7) | (byte & 0x7F)
        if byte < 0x80:
            return value, pos


def parse_midi(path: Path):
    data = path.read_bytes()
    if data[:4] != b"MThd":
        raise ValueError(f"{path} is not a MIDI file")
    track_count = int.from_bytes(data[10:12], "big")
    division = int.from_bytes(data[12:14], "big")
    if division & 0x8000:
        raise ValueError("SMPTE-timed MIDI is not supported")

    pos = 8 + int.from_bytes(data[4:8], "big")
    events = []
    sequence = 0
    for _ in range(track_count):
        if data[pos : pos + 4] != b"MTrk":
            raise ValueError(f"Invalid track in {path}")
        length = int.from_bytes(data[pos + 4 : pos + 8], "big")
        track = data[pos + 8 : pos + 8 + length]
        pos += 8 + length
        cursor = tick = 0
        running_status = None
        while cursor < len(track):
            delta, cursor = read_varlen(track, cursor)
            tick += delta
            status = track[cursor]
            if status < 0x80:
                if running_status is None:
                    raise ValueError("Invalid running status")
                status = running_status
            else:
                cursor += 1
                running_status = status

            if status == 0xFF:
                event_type = track[cursor]
                cursor += 1
                size, cursor = read_varlen(track, cursor)
                payload = track[cursor : cursor + size]
                cursor += size
                if event_type == 0x51 and size == 3:
                    events.append((tick, sequence, "tempo", int.from_bytes(payload, "big")))
            elif status in (0xF0, 0xF7):
                size, cursor = read_varlen(track, cursor)
                cursor += size
            else:
                kind = status & 0xF0
                channel = status & 0x0F
                first = track[cursor]
                cursor += 1
                if kind in (0xC0, 0xD0):
                    if kind == 0xC0:
                        events.append((tick, sequence, "program", channel, first))
                else:
                    second = track[cursor]
                    cursor += 1
                    if kind == 0x90 and second:
                        events.append((tick, sequence, "on", channel, first, second))
                    elif kind == 0x80 or (kind == 0x90 and second == 0):
                        events.append((tick, sequence, "off", channel, first))
            sequence += 1

    events.sort(key=lambda item: (item[0], item[1]))
    tempo_points = [(0, 500_000)]
    for event in events:
        if event[2] == "tempo":
            if tempo_points[-1][0] == event[0]:
                tempo_points[-1] = (event[0], event[3])
            else:
                tempo_points.append((event[0], event[3]))

    def tick_to_seconds(target: int) -> float:
        seconds = 0.0
        for index, (tick, micros) in enumerate(tempo_points):
            end = tempo_points[index + 1][0] if index + 1 < len(tempo_points) else target
            if target <= tick:
                break
            end = min(end, target)
            seconds += (end - tick) * micros / division / 1_000_000
            if end == target:
                break
        return seconds

    programs = [0] * 16
    active: dict[tuple[int, int], list[tuple[int, int, int]]] = {}
    notes = []
    last_tick = 0
    for event in events:
        tick, _, kind, *args = event
        last_tick = max(last_tick, tick)
        if kind == "program":
            programs[args[0]] = args[1]
        elif kind == "on":
            channel, pitch, velocity = args
            active.setdefault((channel, pitch), []).append((tick, velocity, programs[channel]))
        elif kind == "off":
            channel, pitch = args
            entries = active.get((channel, pitch))
            if entries:
                start, velocity, program = entries.pop(0)
                notes.append((tick_to_seconds(start), tick_to_seconds(tick), channel, pitch, velocity, program))
    end_seconds = tick_to_seconds(last_tick)
    for (channel, pitch), entries in active.items():
        for start, velocity, program in entries:
            notes.append((tick_to_seconds(start), end_seconds, channel, pitch, velocity, program))
    return notes, end_seconds


def oscillator(program: int, phase: float) -> float:
    index = int(phase * TABLE_SIZE) & (TABLE_SIZE - 1)
    sine = SINE[index]
    family = program // 8
    if family in (2, 3, 10):  # organs, guitars, synth leads
        return 0.7 * sine + 0.3 * (1.0 if phase % 1.0 < 0.5 else -1.0)
    if family in (4, 5, 6, 7, 11):  # bass, strings, brass, pads
        saw = 2.0 * (phase % 1.0) - 1.0
        return 0.65 * sine + 0.35 * saw
    if family == 1:  # chromatic percussion
        return 0.75 * sine + 0.25 * SINE[(index * 2) & (TABLE_SIZE - 1)]
    return 0.8 * sine + 0.2 * SINE[(index * 2) & (TABLE_SIZE - 1)]


def render(notes, duration: float, output: Path) -> None:
    release = 0.08
    sample_count = int((duration + release + 0.05) * SAMPLE_RATE)
    mix = array("f", [0.0]) * sample_count
    for start, end, channel, pitch, velocity, program in notes:
        first = max(0, int(start * SAMPLE_RATE))
        last = min(sample_count, int((end + release) * SAMPLE_RATE))
        frequency = 440.0 * 2 ** ((pitch - 69) / 12)
        amplitude = (velocity / 127.0) * (0.09 if channel != 9 else 0.07)
        attack = 0.008
        for sample in range(first, last):
            elapsed = sample / SAMPLE_RATE - start
            remaining = end - sample / SAMPLE_RATE
            if elapsed < attack:
                envelope = elapsed / attack
            elif remaining < 0:
                envelope = max(0.0, 1.0 + remaining / release)
            else:
                envelope = 1.0
            if channel == 9:
                # Deterministic short noise burst for General MIDI percussion.
                noise = (((sample * 1103515245 + pitch * 12345) >> 8) & 65535) / 32767.5 - 1.0
                decay = math.exp(-elapsed * (12.0 if pitch > 45 else 7.0))
                value = noise * decay
            else:
                value = oscillator(program, elapsed * frequency)
            mix[sample] += value * amplitude * envelope

    peak = max((abs(value) for value in mix), default=1.0)
    scale = 0.92 / peak if peak > 0.92 else 1.0
    pcm = array("h", (max(-32768, min(32767, int(value * scale * 32767))) for value in mix))
    output.parent.mkdir(parents=True, exist_ok=True)
    with wave.open(str(output), "wb") as wav:
        wav.setnchannels(1)
        wav.setsampwidth(2)
        wav.setframerate(SAMPLE_RATE)
        wav.writeframes(pcm.tobytes())


def update_sound_resource(resource: Path, wav_name: str, duration: float) -> None:
    text = resource.read_text(encoding="utf-8")
    text = re.sub(r'"soundFile":"[^"]*"', f'"soundFile":"{wav_name}"', text)
    text = re.sub(r'"duration":[0-9.]+', f'"duration":{duration:.6f}', text)
    resource.write_text(text, encoding="utf-8")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("root", nargs="?", type=Path, default=Path(__file__).resolve().parents[1])
    args = parser.parse_args()
    for resource in sorted((args.root / "sounds").glob("*/*.yy")):
        raw = json.loads(re.sub(r",\s*([}\]])", r"\1", resource.read_text(encoding="utf-8")))
        source = resource.parent / raw["soundFile"]
        if source.suffix.lower() in {".wav", ".ogg", ".mp3"}:
            continue
        midi = source.with_suffix(".mid")
        if source.exists():
            source.rename(midi)
        elif not midi.exists():
            raise FileNotFoundError(source)
        output = source.with_suffix(".wav")
        notes, duration = parse_midi(midi)
        print(f"Rendering {midi.name}: {len(notes)} notes, {duration:.1f}s")
        render(notes, duration, output)
        update_sound_resource(resource, output.name, duration)


if __name__ == "__main__":
    main()
