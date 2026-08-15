action_set_relative(1);
timer += global.time;
speed-=global.air*speed*speed*global.time;
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index-=image_speed*(1-global.time);
if(playing)
    {
    vol=power(abs(y2-ystart)/(objLava.y+128-ystart),1/3);
    vol=vol*(1-power(abs((__view_get( e__VW.XView, 0 )+320)-(x2+x)/2)/1024,2))
    soundvolume(global.sndLavaFall,vol);
    }
var __b__;
__b__ = action_if(timer>60 && phase==0);
if __b__
{
{
__b__ = action_if(y==y2);
if __b__
{
if(x>__view_get( e__VW.XView, 0 )-640 && x2<__view_get( e__VW.XView, 0 )+1280)
    {soundloop(global.sndLavaFall);
    playing=1;}
}
__b__ = action_if(y2<objLava.y+128);
if __b__
{
y2 += global.time*image_speed*hh/image_number;
}
else
{
{
action_set_relative(0);
phase = 1;
action_set_relative(1);
}
}
}
}
__b__ = action_if(phase>0);
if __b__
{
{
__b__ = action_if(instance_exists(sonic));
if __b__
{
if (sonic.x>x && sonic.x<x2 && sonic.y>y+128 && sonic.y<y2-128)
    { 
    sonic.damagex=(x+x2)/2;
    sonic.damagey=sonic.y+16;
    sonic.damaged=1;}
}
repeat( ceil(global.time*2) )var xx,mm;
xx=(x+x2)/2;
mm=0.5*abs(x2-x)*choose(-1,1)*power(random(1),1/4);
i=instance_create(xx+mm,objLava.y,objLavaDrops);
i.hspeed=random(mm/80);
}
}
__b__ = action_if(timer>120);
if __b__
{
{
{
action_set_relative(0);
phase = 2;
action_set_relative(1);
}
y += global.time*hh*image_speed/image_number;
image_index += -image_speed*global.time;
__b__ = action_if(y>objLava.y);
if __b__
{
phase=0;
y=ystart;
y2=ystart;
timer=0;
if(playing)
soundstop(global.sndLavaFall);
}
}
}
action_set_relative(0);
