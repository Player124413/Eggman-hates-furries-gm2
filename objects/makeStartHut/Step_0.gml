var __b__;
__b__ = action_if(phase==0);
if __b__
{
sonic.vspeed=0;
timer+=global.time;


if (timer==30)
    sonic.image_index=1;
if (timer==33)
    sonic.image_index=2;
if (timer==90)
    sonic.image_index=3;
    
if (timer>=180)
    {
    sonic.physics=1;
    phase=1;
    timer=0;
    sonic.able=1;
    sonic.x-=6;
    sonic.y=y+224-16;
    soundplay(global.sndLand2);
    }
    
if (objectfg.flashlight>0)
    objectfg.flashlight-=global.time/60;
}
