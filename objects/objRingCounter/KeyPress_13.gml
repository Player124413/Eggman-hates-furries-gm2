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

var can_pause = false;
if (instance_exists(sonic) && sonic.able) can_pause = true;
if (instance_exists(objSuperSonic) && objSuperSonic.able) can_pause = true;
if (instance_exists(sonails) && sonails.able) can_pause = true;
if (instance_exists(bike) && bike.able) can_pause = true;

if (can_pause)
{
    paused = true;
    audio_pause_all();
    instance_deactivate_all(true); // keep objRingCounter active for input/draw
    soundplay(global.sndPause);
}
