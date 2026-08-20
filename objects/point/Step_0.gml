var __b__;
__b__ = action_if(x-128<__view_get( e__VW.XView, 0 )+640 && y-128<__view_get( e__VW.YView, 0 )+480 && x+128>__view_get( e__VW.XView, 0 ) && y+128>__view_get( e__VW.YView, 0 ) || (instance_exists(controlbg) && controlbg.outsideOn));
if __b__
{
var a,b;
with (movable)
    {
    a=point_direction(other.x,other.y,x,y);
    b=-lengthdir_x(speed,direction-a);
    if(point_distance(x,y,other.x,other.y)<radius+b)
        {
        motion_add(a,b);
        
        x=other.x+lengthdir_x(radius,a);
        y=other.y+lengthdir_y(radius,a);
        
        //inherit normal, set ground
        if(gnd!=2)
            {ux=cos(degtorad(a-90));
            uy=-sin(degtorad(a-90));
            nx=cos(degtorad(a));
            ny=-sin(degtorad(a));
            gnd=2;}
        }
    }
}
