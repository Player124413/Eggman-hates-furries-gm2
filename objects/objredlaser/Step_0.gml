x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_xscale = (image_xscale+1)/3;
var __b__;
__b__ = action_if(y<__view_get( e__VW.YView, 0 )-640 || y>__view_get( e__VW.YView, 0 )+1280);
if __b__
{
action_kill_object();
}
__b__ = action_if(gnd==2);
if __b__
{
{
action_kill_object();
var a;
a=0;

if (uy<0)
    {
    a=1;
    ux=-ux;
    uy=-uy;
    }
    
i=instance_create(x,y,objredwave);
i.direction=point_direction(0,0,ux,uy);
i.image_angle=i.direction;
i.speed=sonic.speed*1.2;
if (a==1)
    i.image_yscale=-1;
}
}
