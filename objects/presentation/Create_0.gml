if(file_exists("dat.dat"))
    {
    load();
    set_synchronization(global.verticalSync);
    }
else
    {
    global.introHasBeenCleared=false;
    global.gameProgress=-10;
    global.gameCleared=false;
    global.hasStartedAfterClear=false;
    global.verticalSync=false;
    save();
    }

global.grav=0.2;
global.meter=1;
global.time=0.5;
global.air=0.0001;

lx=-1;
ly=0;

alpha=0;

image_speed=0;

if(global.gameCleared)
    image_index=floor(random(image_number));
else
    image_index=1+floor(random(image_number-1));
if (global.gameCleared && global.hasStartedAfterClear==0)
    {
    image_index=0;//force 69
    global.hasStartedAfterClear=1;
    save();
    }
    

__view_set( e__VW.XView, 0, 0 );
__view_set( e__VW.YView, 0, 0 );
var __b__;
__b__ = action_if(!instance_exists(objRingCounter));
if __b__
{
action_create_object(objRingCounter, 0, 0);
}
objRingCounter.showRings = 0;
timer = 0;
action_set_alarm(1, 0);
