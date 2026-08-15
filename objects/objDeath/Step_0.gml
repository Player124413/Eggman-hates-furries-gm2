action_set_relative(1);
var __b__;
__b__ = action_if(global._drown);
if __b__
{
{
action_set_vspeed(global.grav/global.meter*global.time/4);
if(random(5)<global.time)
    {
    i=instance_create(x,y-16,objBubble);
    i.depth=depth-1;
    }
}
}
else
{
action_set_vspeed(global.grav/global.meter*global.time);
}
speed-=global.air*speed*speed*global.time;
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index-=image_speed*(1-global.time);
__b__ = action_if(y>__view_get( e__VW.YView, 0 )+512 && vspeed>0);
if __b__
{
with objBubble
    instance_destroy();
instance_destroy();
soundstop_all();
background_delete(mybg);
if(lev!=-1000)
    {
    i=instance_create(0,0,controlbg);
    i.lev=lev;
    }
else
    {
    i=instance_create(0,0,presentation);
    with (i)
        event_user(0);
    }
}
action_set_relative(0);
