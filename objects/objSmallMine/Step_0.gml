action_set_relative(1);
image_index += -image_speed*(1-global.time);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
action_set_vspeed(global.time*image_yscale*global.grav/global.meter);
timer += -global.time;
var __b__;
__b__ = action_if(timer<0 || point_distance(x,y,sonic.x,sonic.y)<16+sonic.speed/2);
if __b__
{
soundplay(global.sndExplosion);
i=instance_create(x,y,objmedexp);
if (point_distance(x,y,sonic.x,sonic.y)<32+sonic.speed/2)
    {
    sonic.damaged=1;
    sonic.damagex=x;
    sonic.damagey=y;
    if (sonic.invulnerable==0)
            sonic.hspeed+=4;
    }
instance_destroy();
}
action_set_relative(0);
