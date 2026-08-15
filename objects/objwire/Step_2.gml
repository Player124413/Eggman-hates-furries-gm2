action_set_relative(0);
x+=hspeed*(2*global.time-1);
y+=vspeed*(2*global.time-1);
var __b__;
__b__ = action_if(instance_exists(p1));
if __b__
{
var a,b;

sp=point_distance(p2.hspeed,p2.vspeed,hspeed,vspeed);
dir=point_direction(p2.hspeed,p2.vspeed,hspeed,vspeed);
l=point_distance(x,y,p2.x,p2.y);
a=point_direction(p2.x,p2.y,x,y);
if (l>d)
    {
    x=p2.x+lengthdir_x(d,a);
    y=p2.y+lengthdir_y(d,a);
    
    b=-lengthdir_x(sp,dir-a);
    
    motion_add(a,b);
    }

sp=point_distance(p1.hspeed,p1.vspeed,hspeed,vspeed);
dir=point_direction(p1.hspeed,p1.vspeed,hspeed,vspeed);
l=point_distance(x,y,p1.x,p1.y);
a=point_direction(p1.x,p1.y,x,y);
if (l>d)
    {
    x=p1.x+lengthdir_x(d,a);
    y=p1.y+lengthdir_y(d,a);
    
    b=-lengthdir_x(sp,dir-a);
    
    motion_add(a,b);
    }

}
else
{
action_kill_object();
}
action_set_friction(0.1*global.time);
{
action_set_relative(1);
action_set_vspeed(0.3*global.time);
action_set_relative(0);
}
action_set_relative(0);
