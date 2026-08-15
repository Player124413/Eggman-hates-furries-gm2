action_set_relative(1);
var __b__;
__b__ = action_if(instance_exists(sonic));
if __b__
{
if(point_distance(x,y,sonic.x,sonic.y)<sonic.radius+radius+sonic.speed/2)
    {i=instance_create(x,y,objringget);
    i.depth=depth;
    instance_destroy();}
}
image_index += -image_speed*(1-global.time);
action_set_relative(0);
