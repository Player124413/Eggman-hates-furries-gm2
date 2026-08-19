action_set_relative(1);
image_index += -image_speed*(1-global.time);
speed-=global.air*speed*speed*global.time;

x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
action_set_vspeed(global.grav/global.meter*global.time);
var __b__;
__b__ = action_if(phase<2);
if __b__
{

if(y<sonic.y-48)
    phase=1;

if(phase==1)
    {vspeed+=global.time*(sonic.y-48-y)/200;
    if (vspeed<sonic.vspeed-5) vspeed=sonic.vspeed-5;
    if (vspeed>sonic.vspeed+5) vspeed=sonic.vspeed+5;}
else
    vspeed=(vspeed*29+global.time*(sonic.vspeed-6))/(29+global.time);


if (point_distance(sonic.x,sonic.y,x,y+26)<14+18*global.time)
    {
    global.time=0.5;
    objcore1.phase=1;
    soundplay(global.sndLand1);
    if (sonic.hspeed>0)
        right=1;
    else
        right=0;
        
    with (sonic)
        instance_destroy();
    phase=2;
    timer=0;
    sprite_index=stailfly2;
    }
}
__b__ = action_if(phase==2);
if __b__
{
var sig,boozy;
sig=0;
if (right==1)
    sig=1;
else
    sig=-1;
image_angle+=global.time*sig*4/(timer+1);

if (timer>40)
    image_angle-=global.time*sig*(timer-39)/3/power(1+(timer-40)/5,2)

vspeed-=0.35*global.time;

timer+=global.time;

if (ffff<=0.5)
    ffff+=global.time/10;
else
    ffff=(ffff*4/global.time+1)/(4/global.time+1);
if (ffff>1)
    ffff=1;
    
if(instance_exists(objcore1))
    {boozx=objcore1.x;
    boozy=objcore1.y;
    x+=global.time*sig*8/(timer+1);
    if (timer>40)
        x-=global.time*sig*(timer-39)/6/power(1+(timer-40)/15,2);
    
    __view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*3+(x*(1-ffff)+boozx*ffff)-320+2*hspeed*global.time)/4 );
    __view_set( e__VW.YView, 0, (__view_get( e__VW.YView, 0 )*3+(y*(1-ffff)+boozy*ffff)-240+2*vspeed*global.time)/4 );
    }
else
    {//boozx=objcore2.x;
    //boozy=objcore2.y;
    if (y>objcore2.y-160)
        {
        vspeed-=0.1*global.time;
        if (y<objcore2.y-64 && y>goaly)
            {goaly=y-8;
            vspeed=vspeed/(1+global.time/10);}
        if(vspeed<0)
            {phase=3;
            timer=0;}
        vspeed+=global.time*(goaly-y)/30;
        }
    }
}
__b__ = action_if(phase==3);
if __b__
{
vspeed+=global.time*(goaly-y)/60;
timer+=global.time;
image_angle=image_angle/(1+global.time/10)

if (timer==90)
    {
    sprite_index=stailfly;
    i=instance_create(x,y+28,sonic);
    i.able=0;
    soundplay(global.sndRoll);
    }
}
__b__ = action_if(phase<3 || sprite_index==stailfly2);
if __b__
{
soundvolume(global.sndTailsFly,1/(1+abs(y-(__view_get( e__VW.YView, 0 )+240))/1024));
}
action_set_relative(0);
