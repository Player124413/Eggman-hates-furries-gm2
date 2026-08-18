#!/usr/bin/env python3
"""Generate the bitmap atlases required by GameMaker font resources.

Usage: pip install Pillow; python tools/generate_font_atlases.py
The generated PNG and glyph metadata are committed, so Pillow is not needed to
build or run the game.
"""
from __future__ import annotations

import json
import math
from pathlib import Path
import re
import sys

try:
    from PIL import Image, ImageDraw, ImageFont
except ImportError as error:
    raise SystemExit("Install Pillow first: python -m pip install Pillow") from error

ROOT = Path(__file__).resolve().parents[1]
FONT_DIR = Path("/usr/share/fonts/truetype/dejavu")
REGULAR = FONT_DIR / "DejaVuSans.ttf"
BOLD = FONT_DIR / "DejaVuSans-Bold.ttf"
ATLAS_WIDTH = 512
PADDING = 1


def load_relaxed_json(path: Path) -> dict:
    text = re.sub(r",\s*([}\]])", r"\1", path.read_text(encoding="utf-8"))
    return json.loads(text)


def next_power_of_two(value: int) -> int:
    return 1 << max(0, value - 1).bit_length()


def render_resource(path: Path) -> None:
    data = load_relaxed_json(path)
    pixel_size = max(5, round(float(data["size"])))
    font_path = BOLD if data.get("bold") else REGULAR
    font = ImageFont.truetype(str(font_path), pixel_size)
    ascent, descent = font.getmetrics()
    line_height = ascent + descent + PADDING * 2

    characters: list[int] = []
    for item in data["ranges"]:
        characters.extend(range(int(item["lower"]), int(item["upper"]) + 1))
    characters = sorted(set(characters))

    cells = []
    x = y = PADDING
    row_height = line_height + PADDING
    for codepoint in characters:
        try:
            advance = max(1, math.ceil(font.getlength(chr(codepoint))))
        except (OSError, ValueError):
            advance = max(1, pixel_size // 2)
        width = advance + PADDING * 2
        if x + width + PADDING > ATLAS_WIDTH:
            x = PADDING
            y += row_height
        cells.append((codepoint, x, y, width, advance))
        x += width + PADDING

    atlas_height = next_power_of_two(y + row_height + PADDING)
    alpha = Image.new("L", (ATLAS_WIDTH, atlas_height), 0)
    draw = ImageDraw.Draw(alpha)
    glyphs = {}
    baseline_offset = PADDING + ascent
    for codepoint, x, y, width, advance in cells:
        character = chr(codepoint)
        # Control characters intentionally remain transparent but retain an
        # advance, matching GameMaker's generated bitmap behavior.
        if codepoint >= 32 and codepoint != 127:
            draw.text((x + PADDING, y + baseline_offset), character, font=font, fill=255, anchor="ls")
        glyphs[str(codepoint)] = {
            "x": x,
            "y": y,
            "w": width,
            "h": line_height,
            "character": codepoint,
            "shift": advance,
            "offset": 0,
        }

    rgba = Image.new("RGBA", alpha.size, (255, 255, 255, 0))
    rgba.putalpha(alpha)
    rgba.save(path.with_suffix(".png"), optimize=True)

    original = path.read_text(encoding="utf-8")
    # GameMaker's YY loader validates glyph fields in schema order; generic
    # JSON ordering (x/y first) produces the misleading "character expected"
    # project-load error. It also expects its usual trailing-comma dialect.
    glyph_lines = []
    for key, glyph in glyphs.items():
        glyph_lines.append(
            f'    "{key}":{{"character":{glyph["character"]},'
            f'"h":{glyph["h"]},"offset":{glyph["offset"]},'
            f'"shift":{glyph["shift"]},"w":{glyph["w"]},'
            f'"x":{glyph["x"]},"y":{glyph["y"]},}},'
        )
    glyph_text = "{\n" + "\n".join(glyph_lines) + "\n  }"
    original = re.sub(r'"glyphs":\{.*?\},\s*"hinting"', f'"glyphs":{glyph_text},\n  "hinting"', original, flags=re.S)
    original = re.sub(r'"ascender":-?[0-9.]+', f'"ascender":{ascent}', original)
    original = re.sub(r'"lineHeight":-?[0-9.]+', f'"lineHeight":{line_height}', original)
    original = original.replace('"regenerateBitmap":true', '"regenerateBitmap":false')
    path.write_text(original, encoding="utf-8")
    print(f"Generated {path.with_suffix('.png')} ({len(glyphs)} glyphs)")


def main() -> None:
    for path in sorted((ROOT / "fonts").glob("*/*.yy")):
        render_resource(path)


if __name__ == "__main__":
    main()
