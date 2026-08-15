global.air  =0.0001;
global.meter=24;

global.time=0.5;
room_speed=60;
global.grav=10;


defineEmeralds();
if(SS_IsHandleValid(global.handle))
    {
    SS_StopSound(global.handle);
    SS_FreeSound(global.handle);
    }
var __b__;
__b__ = action_if(!instance_exists(objRingCounter));
if __b__
{
action_create_object(objRingCounter, 0, 0);
}
objRingCounter.showRings = 1;
phase = 0;
timer = 0;
lev = global.startProg;
on = 0;
action_set_alarm(1, 0);
outsideOn = 1;
minbgy = -1;
scrollFactor = 0.02;
fixedStars = 0;
