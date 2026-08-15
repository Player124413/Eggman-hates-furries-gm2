var __b__;
__b__ = action_if(active==0);
if __b__
{
if(tex!=background_get_texture(bgTunnel) && tex!=background_get_texture(bgTunnelHR))
    repeats=1;
else
    repeats=ceil(point_distance(x1,y1,x3,y3)/(point_distance(x1,y1,x2,y2)));
if(left)
    {i1=instance_create(x1,y1,line);
    i1.x2=x3;
    i1.y2=y3;}
if(right)
    {i2=instance_create(x2,y2,line);
    i2.x2=x4;
    i2.y2=y4;}

if(down)
    {i3=instance_create(x1,y1,line);
    i3.visible=1;
    i3.x2=x2;
    i3.y2=y2;}
if(up)
    {i4=instance_create(x3,y3,line);
    i4.visible=1;
    i4.x2=x4;
    i4.y2=y4;}

active=1;

}
