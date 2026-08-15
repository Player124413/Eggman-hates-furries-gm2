action_set_relative(1);
if(gnd==2)// && lastgnd==0)
    {
    hspeed+=hspeed-phspeed;
    vspeed+=vspeed-pvspeed;
    x+=min(6,speed)*nx;
    y+=min(6,speed)*ny;
    }

lastgnd=gnd;
    
if(gnd>0)
    gnd-=1;

  
    
phspeed=hspeed;
pvspeed=vspeed;

speed-=global.air*speed*speed*global.time;


image_index += -image_speed*(1-global.time);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
action_set_vspeed(global.grav/global.meter*global.time);
timer += global.time;
var __b__;
__b__ = action_if(timer<20 || timer>maxtimer-60);
if __b__
{
{
action_set_relative(0);
visible = 1-visible;
action_set_relative(1);
}
}
else
{
{
action_set_relative(0);
visible = 1;
action_set_relative(1);
}
}
__b__ = action_if(timer>maxtimer);
if __b__
{
action_kill_object();
}
__b__ = action_if(instance_exists(sonic));
if __b__
{
if(point_distance(x,y,sonic.x,sonic.y)<sonic.radius+radius+10 && timer>20)
    {instance_create(x,y,objringget);
    instance_destroy();}
}
action_set_relative(0);
