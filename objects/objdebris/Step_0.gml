action_set_relative(1);
speed-=global.air*speed*speed*global.time;

x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

image_index+=-image_speed*(1-global.time);
action_set_vspeed(0.3*global.time);
var __b__;
__b__ = action_if(y>__view_get( e__VW.YView, 0 )+1024 || y<__view_get( e__VW.YView, 0 )-1024);
if __b__
{
action_kill_object();
}
if(exploding>0)
    {
    if(random(1)<exploding*global.time)
        {
        i=instance_create(x-16+random(32),y-16+random(32),objsmexp);
        }
    //i=instance_create(x,y,objsmoke);
    //i.hspeed=hspeed*0.98;
    //i.vspeed=vspeed*0.98;
    }
image_angle += rotation;
action_set_relative(0);
