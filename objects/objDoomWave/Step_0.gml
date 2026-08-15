image_index-=image_speed*(1-global.time);

var __b__;
__b__ = action_if(image_index>5);
if __b__
{
var c,d,e;

c=cos(degtorad(image_angle-point_direction(x,y,sonic.x,sonic.y)));

d=abs(sin(degtorad(image_angle-point_direction(x,y,sonic.x,sonic.y))));
e=doom.dist;
if (e>extend && e<extend+64*image_xscale && d<0.15 && c>0)
    {
    sonic.damaged=1;
    sonic.damagex=x;
    sonic.damagey=y;
    with (sonic)
        {
        c=1;
        if sin(point_direction(doom.x,doom.y,x,y)-other.image_angle<0)
            c=-1;
        motion_add(other.image_angle+90*c,2)
        }
    }
}
