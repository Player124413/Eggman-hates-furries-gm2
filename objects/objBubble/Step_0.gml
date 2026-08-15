action_set_relative(1);
image_xscale=approach(image_xscale,10,targetSize,1);
image_yscale=image_xscale;

vspeed-=global.time*0.05;

x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index += -image_speed*(1-global.time);
var __b__;
__b__ = action_if(y<__view_get( e__VW.YView, 0 )-16);
if __b__
{
action_kill_object();
}
__b__ = action_if(y>__view_get( e__VW.YView, 0 )+480+16);
if __b__
{
action_kill_object();
}
__b__ = action_if(instance_exists(sonic));
if __b__
{
__b__ = action_if(point_distance(x,y,sonic.x,sonic.y-8)<26 && image_xscale>0.9);
if __b__
{
i=instance_create(x,y,objBubbleGone);
i.image_xscale=image_xscale;
i.image_yscale=image_yscale;
soundplay(global.sndBubble);
with objWaterFront
    {
    oxygenUp();
    upTimer=1;
    }
instance_destroy();
}
}
__b__ = action_if(instance_exists(objWaterFront));
if __b__
{
__b__ = action_if(y<objWaterFront.y);
if __b__
{
i=instance_create(x,y,objBubbleGone);
i.image_xscale=image_xscale;
i.image_yscale=image_yscale;
soundplay(global.sndClick);
instance_destroy();
}
}
action_set_relative(0);
