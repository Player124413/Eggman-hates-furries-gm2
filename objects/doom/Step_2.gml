action_set_relative(1);
var __b__;
__b__ = action_if(invulnerable>0);
if __b__
{
var c,d;
invulnerable-=global.time;
with sonic
    {
    motion_add(point_direction(x,y,other.x,other.y),global.grav/global.meter*global.time);
    }

if (invulnerable<=0)
    {invulnerable=0;
    if (phase<3)
        grav=1;
    
    }

if(phase==2)
    {
    if (invulnerable==35)
        soundloop(global.sndChainSewer);
    if (invulnerable==0)
        {soundplay(global.sndElevatorStop);
        soundstop(global.sndChainSewer);}
    if(invulnerable>20 && invulnerable mod 4 == 0)
        {
        c=(50-invulnerable)/30;
        d=point_direction(x,y,sonic.x,sonic.y)-2+random(4);
        instance_create(x+lengthdir_x(c*192,d),y+lengthdir_y(c*192,d),objsmexp);
        }
    }

}
__b__ = action_if(phase==0 && camtimer<0.66);
if __b__
{
camtimer += 1/160;
}
__view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )+(objEggMid.x-320)*camtimer)/(1+camtimer) )
__view_set( e__VW.YView, 0, (__view_get( e__VW.YView, 0 )+(objEggMid.y-240)*camtimer)/(1+camtimer) )

image_angle+=rotsp*global.time;

__b__ = action_if(falling);
if __b__
{
vspeed+=global.grav/global.meter*global.time;
speed-=global.air*speed*speed*global.time;
}
action_set_relative(0);
