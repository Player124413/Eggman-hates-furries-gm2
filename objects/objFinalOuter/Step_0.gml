var __b__;
__b__ = action_if(phase=1);
if __b__
{
    if (hatch==0)
        soundplay(global.sndDoorOpen);
    hatch+=global.time/30;
    if (hatch>0.5 && flamed==0)
        {
        i=instance_create(doom.x,doom.y,objDoomWave);
        i.image_angle=image_angle+10;
        i.extend-=16;
        i.image_xscale=2;
        flamed=1;
        soundplay(global.sndSurround);
        }
    if (hatch>=1)
        {
        hatch=1;
        phase=2;
        if (atk==2)
            {
            i=instance_create(x,y,objDoomGun);
            i.angle=image_angle+10;
            if (random(2)<1)
                i.image_yscale=-1;
            }
        if (atk==1)
            {
            i=instance_create(x,y,objDoomShock);
            i.angle=image_angle+10;
            }
        if (atk==0)
            {
            i=instance_create(x,y,objDoomKnife);
            i.angle=image_angle+10;
            if (random(2)<1)
                i.image_yscale=-1;
            }
            timer=0;
            flamed=0;
        }
}
__b__ = action_if(phase==2);
if __b__
{
timer+=global.time;

if (atk==0 && timer>60)
    {
    phase=3;
    timer=0;
    soundplay(global.sndDoorClose);
    }
if (atk==1 && timer>120)
    {
    phase=3;
    timer=0;
    soundplay(global.sndDoorClose);
    }
if (atk==2 && timer>120)
    {
    phase=3;
    timer=0;
    soundplay(global.sndDoorClose);
    }
}
__b__ = action_if(phase==3);
if __b__
{
hatch-=global.time/30;
if (hatch<=0)
    {
    hatch=0;
    phase=0;
    timer=0;
    }
    

}
__b__ = action_if(phase=4);
if __b__
{
if(hatch<1)
    {
    hatch+=global.time/30;
    if (hatch>=1)
        {
        hatch=1;
        timer=0;
        }
    }
else
    {
    timer+=global.time;//not sure if I'm gonna use this
    }
    
if (doom.dist>192 && doom.phase<2)
    {
    soundstop(global.sndDoorOpen);
    soundplay(global.sndDoorClose);
    phase=3;
    }
}
else
{
if (doom.dist<192)
    {
    if(abs(lengthdir_y(1,image_angle+10-point_direction(doom.x,doom.y,sonic.x,sonic.y)))<0.5)
        {
        if (phase==3)
            {
            soundstop(global.sndDoorClose);
            soundplay(global.sndDoorOpen);
            }
        phase=4;
        }
    }
}
