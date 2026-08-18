var __b__;
__b__ = action_if(active);
if __b__
{
__b__ = action_if(min(x,x2)<__view_get( e__VW.XView, 0 )+660 && max(x,x2)>__view_get( e__VW.XView, 0 )-20);
if __b__
{
var o;
x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);

x2+=hspeed2*(global.time);
y2+=vspeed2*(global.time);

i1.x=x;
i1.y=y;
i1.hsp=hspeed;
i1.vsp=vspeed;

if(rp)
    {i2.x=x2;
    i2.y=y2;
    i2.hsp=hspeed2;
    i2.vsp=vspeed2;}

//calculate unit vector in the direction of this line
d = max(0.0001, point_distance(x,y,x2,y2));
ux=(x2-x)/d;
uy=(y2-y)/d;
//calculate orthogonal unit vector
p=point_direction(x,y,x2,y2);
nx=cos(degtorad(p+90));
ny=-sin(degtorad(p+90));

}
}
