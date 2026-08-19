if (paused)
{
    instance_activate_all();
    audio_resume_all();
    paused = false;
}

var __b__;
__b__ = action_if(kill==0);
if __b__
{
action_change_object(objRingCounter, 0);
}
