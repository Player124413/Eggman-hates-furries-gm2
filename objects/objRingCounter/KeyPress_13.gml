// Non-blocking pause. The old GM7 implementation used sleep() inside a while
// loop, but sleep() was removed and blocking the runner is unsafe in GMS2.
if (paused)
{
    instance_activate_all();
    paused = false;
    audio_resume_all();
    soundplay(global.sndType);
    exit;
}

var can_pause = !instance_exists(presentation)
    && !instance_exists(objMenu)
    && !instance_exists(objMenuCreds);

if (can_pause)
{
    paused = true;
    audio_pause_all();
    instance_deactivate_all(true); // keep objRingCounter active for input/draw
    soundplay(global.sndPause);
}
