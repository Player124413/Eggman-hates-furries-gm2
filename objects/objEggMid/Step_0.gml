x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index+=-image_speed*(1-global.time);
blink = !blink;
var __b__;
__b__ = action_if(instance_exists(doom));
if __b__
{
{
__b__ = action_if(doom.phase<=2);
if __b__
{
if (doom.invulnerable>0)
    image_single=1+blink;
else
    image_single=0;
}
}
}
__b__ = action_if(fixed==0 && phase<6);
if __b__
{
yplus+=vsp*global.time;
if (yplus>0)
    vsp-=global.time/20;
else
    vsp+=global.time/20;
}
__b__ = action_if(phase==1);
if __b__
{
timer+=global.time;

if (timer>60)
    vspeed=0;

if (timer==90)
    soundplay(global.sndFomp);
if (timer>=90 && timer<100)
    image_index=max(3,min(6,(timer-88)));
if (timer==135)
    {phase=2;
    image_index=7;
    timer=0;}
}
__b__ = action_if(phase==2);
if __b__
{
timer+=global.time;

if (timer>=120 && timer<120+40*7 && timer mod 40 == 0)
    {
    with objDoomRack
        event_user(2);
    }
    
if (timer==430)
    {
    sonic.physics=0;
    sonic.sprite_index=sawful;
    objectfg.flashlight=1;
    soundplay(global.sndGunstar1);
    phase=3;
    timer=0;
    }
}
__b__ = action_if(phase==3);
if __b__
{
timer+=global.time;
if (timer<=30)
    objectfg.flashlight=1-timer/30;
else if (timer<=90)
    objectfg.flashlight=1-(timer-30)/60;
if (timer==30)
    {
    objectfg.flashlight=1;
    soundplay(global.sndGunstar2);
    }
if (timer>=90)
    {
    doom.phase=7;
    doom.falling=1;
    doom.rotsp=2;
    with objDoomRack
        event_user(1);
    controlbg.lev=14;
    objectfg.flashlight=1;
    soundplay(global.sndGunstar3);
    phase=4;
    timer=0;
    SS_LoopSound(global.handle);
    with objOrbitEmerald
        instance_destroy();
    with (line)
        instance_destroy();
    with (doom)
        {
        nxx=x;
        nyy=y;
        view_xview-=x;
        view_yview-=y;
        with (all)
            {
            if(x<view_xview-320)
                instance_destroy();
            else
                {x-=other.nxx;
                y-=other.nyy;}
            }
        }
    with (static) 
        {
        if (sprite_index==sprBridgeGirder)
            {
            i=instance_create(x,y,line);
            i.x2=x+64;
            i.y2=y;
            }
        if (sprite_index==sprBridgeEnd)
            {
            i=instance_create(x,y,line);
            i.x2=x;
            i.y2=y-32;
            }
        }
    }

with (objOrbitEmerald)
    {
    yoff-=global.time*32/90;
    if (other.timer>30)
        width=width/1.02;
    }
}
__b__ = action_if(phase==4);
if __b__
{
timer+=global.time;
if (timer<=90)
    {
    objectfg.flashlight=1-timer/90;
    }
    
if (timer==180)
    {
    timer=0;
    phase=5;
    }

}
__b__ = action_if(phase==5);
if __b__
{
timer+=global.time;
if (timer==17)
    soundplay(global.sndRoar);
if (timer==47)
    {phase=6;
    timer=0;
    instance_create(x,y-56,objEvEgg1);
    i=instance_create(x,y,objbigexp);
    i.depth=-6;
    soundplay(global.sndExplosion);
    with doom
        instance_destroy();
    with objFinalOuter
        instance_destroy();
    with objDoomRack
        instance_destroy();
    with objFinalCrack
        instance_destroy();
    }
}
__b__ = action_if(phase==6);
if __b__
{
timer+=global.time;
if(timer mod 1 == 0)
    instance_create(x,y,objsmoke);
vspeed+=global.grav/global.meter*global.time;

if (y>view_yview+640)
    instance_destroy();
}
