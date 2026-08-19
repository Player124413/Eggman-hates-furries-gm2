action_set_relative(0);
if (!instance_exists(p))
{
    instance_destroy();
    exit;
}

x+=hspeed*(2*global.time-1);
y+=vspeed*(2*global.time-1);
i=instance_create(x,y,objdollghost);
i.sprite_index=sprite_index;
i.image_single=image_index;
i.image_xscale=image_xscale;
i.image_yscale=image_yscale;
i.image_angle=image_angle;
i.image_blend=image_blend;
i.image_alpha=image_alpha;
i.armrot=armrot;
image_single = p.mood;
var goal;
goal=point_direction(p.nf.x,p.nf.y,x,y);
    if(goal<90 && image_angle>270)
        goal+=360;
    if(goal>270 && image_angle<90)
        goal-=360;


image_angle=(image_angle+goal)/2;

if (image_angle>=360)
    image_angle-=360;
    
if (image_angle<0)
    image_angle+=360;

if (p.right==1)
    image_yscale=-1;
else
    image_yscale=1;
var __b__;
__b__ = action_if(instance_exists(p));
if __b__
{
var a,b;
sp=point_distance(p.hspeed,p.vspeed,hspeed,vspeed);
dir=point_direction(p.hspeed,p.vspeed,hspeed,vspeed);
l=point_distance(x,y,p.x,p.y);
a=point_direction(p.x,p.y,x,y);
if (l>d)
    {
    x=p.x+lengthdir_x(d,a);
    y=p.y+lengthdir_y(d,a);
    
    b=-lengthdir_x(sp,dir-a);
    
    motion_add(a,b);
    }
}
else
{
action_kill_object();
}
action_set_friction(0.1*global.time);
__b__ = action_if(p.atk!=5 || p.subphs!=1);
if __b__
{
{
action_set_relative(1);
action_set_vspeed(0.3*global.time);
action_set_relative(0);
}
}
__b__ = action_if(p.atk==2 && p.subphs==1);
if __b__
{
{
action_set_relative(1);
action_set_motion(point_direction(p.x,p.y,x,y)-60*image_yscale, 8);
action_set_relative(0);
}
}
__b__ = action_if(p.atk==5 && p.subphs==1);
if __b__
{
{
action_set_relative(1);
action_set_motion(point_direction(p.x,p.y,x,y)-45*image_yscale, 0.2);
action_set_relative(0);
}
}

soundvelocity(global.sndDoll,20/(1+abs(vspeed)),abs(hspeed*10));
yscale = image_yscale;
action_set_relative(0);
