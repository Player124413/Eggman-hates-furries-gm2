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
var ring_counter = instance_find(objRingCounter, 0);
if (!instance_exists(ring_counter))
    ring_counter = instance_create(0, 0, objRingCounter);
ring_counter.showRings = 1;
phase = 0;
timer = 0;
lev = global.startProg;
on = 0;
action_set_alarm(1, 0);
outsideOn = 1;
minbgy = -1;
scrollFactor = 0.02;
fixedStars = 0;
