//speed-=global.air*speed*speed*global.time;
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index-=image_speed*(1-global.time);

img+=global.time*(vspeed/2);
while (img<0)
img+=4;
while (img>=4)
img-=4;



i1.y=y;
i1.y2=i1.y;
with i1 event_perform(ev_alarm,0);
//TOP
i2.y=y-96;
i2.y2=i2.y;
with i2 event_perform(ev_alarm,0);
//RIGHT
if (phase<2)
    {i3.y=y-96;
    i3.y2=y;
    with i3 event_perform(ev_alarm,0);
    }
//LEFT
if (phase>0)
    {i4.y=y-96;
    i4.y2=y;
    with i4 event_perform(ev_alarm,0);
    }
var __b__;
__b__ = action_if(instance_exists(sonic));
if __b__
{


if (sonic.x>x+16 && phase==0)
    {
    i4=instance_create(x,y-96,movingline);
    i4.x2=i4.x;
    i4.y2=y;
    i4.mindist=-2;
    
    phase=1;
    soundloop(global.sndNonRythmic);
    soundvolume(global.sndNonRythmic,0)
    soundplay(global.sndElevatorSetup);
    }
}
__b__ = action_if(phase==1);
if __b__
{
timer+=global.time;
if (timer<=90)
    soundvolume(global.sndNonRythmic,sqrt(timer/90));

if (timer==15)
    soundplay(global.sndElevator);
if (timer>=15 && vspeed>-29 && timer<180)
    {vspeed-=0.4*global.time;}

if (timer==240)
    {
    s=vspeed+0.2*global.time;
    s=s*s/(2*0.2);
    supergenerator.x=x+64;
    supergenerator.y=y-s;
    supergenerator.phase=1;
    }
if (timer>=180 && vspeed<0)
    {vspeed+=0.2*global.time;
    if (vspeed>=0)
        {
        vspeed=0;
        soundplay(global.sndElevatorSetup);
        phase=2;
        with i3
            instance_destroy();
        }
    }

    
i1.vspeed=vspeed;
i2.vspeed=vspeed;
if (phase==1)
    i3.vspeed=vspeed;
i4.vspeed=vspeed;


}
