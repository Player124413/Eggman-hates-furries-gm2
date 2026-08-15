action_set_relative(1);
var __b__;
__b__ = action_if(active==0);
if __b__
{
direction=point_direction(x,y,tx,ty);
speed=16;
image_angle=direction;
}
image_index += -image_speed*(1-global.time);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;


{
action_set_relative(0);
active = 1;
action_set_relative(1);
}
__b__ = action_if(point_distance(x,y,tx,ty)<speed);
if __b__
{
i=instance_create(x,y,objbigexp);
i.depth=-5;
soundplay(global.sndExplosion);
instance_destroy();
with (transitiongenerator)
    {
    if(edge!=-1)
        {
        with edge
            instance_destroy();
        edge=-1;
        }
    }
}
action_set_relative(0);
