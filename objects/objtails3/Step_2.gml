action_set_relative(1);
image_index += -image_speed*(1-global.time);
speed-=global.air*speed*speed*global.time;

x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
var __b__;
__b__ = action_if(phase==1);
if __b__
{

if (point_distance(sonic.x,sonic.y,x,y+26)<14+18*global.time)
    {
    timer=0;
    soundplay(global.sndLand1);
    soundvolume(global.sndTailsFly,1);
    with (sonic)
        instance_destroy();
    phase=2;
    sprite_index=stailfly2;
    }
}
__b__ = action_if(phase<2);
if __b__
{
if (phase==0)
    {
    timer+=global.time;
    if (timer<=150)
        soundvolume(global.sndTailsFly,timer/150);
    }
if (y>goaly)
    {
    vspeed-=0.15*global.time
    if (vspeed>1.5)
        vspeed=(vspeed*5+1.5)/6;}
else if (vspeed<5)
    {vspeed+=0.15*global.time}

if (vspeed<0)
    phase=1;
}
__b__ = action_if(phase==2);
if __b__
{
if (vspeed>-5)
    {vspeed-=0.1*global.time;}
if(y<ystart)
    {
    with objJaw
        instance_destroy();
    with chopper
        instance_destroy();
    }
    
__view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*3+x-320+2*hspeed*global.time)/4 );
__view_set( e__VW.YView, 0, (__view_get( e__VW.YView, 0 )*3+y+26-240+2*vspeed*global.time)/4 );

}
__b__ = action_if(phase==3 || phase==4);
if __b__
{
if (y<goaly)
    {
    timer+=global.time;
    vspeed+=0.15*global.time;
    if (vspeed<-1.5)
        vspeed=(vspeed*5-1.5)/6;}
else if (vspeed>-6)
    {vspeed-=0.15*global.time;}
if (phase<4)
    {__view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*3+x-320+2*hspeed*global.time)/4 );
    __view_set( e__VW.YView, 0, (__view_get( e__VW.YView, 0 )*3+y+26-240+2*vspeed*global.time)/4 );}

if (timer>10 && abs(vspeed)<0.2 && phase==3)
    {
    i=instance_create(x,y+26,sonic);
    i.able=0;
    i.hspeed=1;
    i.vspeed=-1.5;
    soundplay(global.sndRoll);
    sprite_index=stailfly;
    phase=4;
    timer=0;
    }
    
if (phase==4)
    {sonic_log();}
    
if (vspeed<-1.5 && phase==4)
    {
    sonic.able=1;
    soundstop(global.sndTailsFly);
    i=instance_create(x,y,objTails);
    soundplay(global.sndRoll);
    instance_destroy();
    }

}
action_set_relative(0);
