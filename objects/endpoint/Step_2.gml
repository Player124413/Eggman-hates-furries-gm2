
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
var __b__;
__b__ = action_if(compute);
if __b__
{
var a,b,c,d;
with (sonic)
    {
    //if(object_index!=objfallring && object_index!=doom && object_index!=robot)
        {
        a=point_direction(other.x,other.y,x,y);
        
        c=point_distance(other.hspeed,other.vspeed,hspeed,vspeed);
        d=point_direction(other.hspeed,other.vspeed,hspeed,vspeed);
        b=-lengthdir_x(c,d-a);
        if(point_distance(x,y,other.x,other.y)<radius && gnd==0 && object_index!=robot)
            {
            motion_add(a,b);
            
            x=other.x+lengthdir_x(radius,a);
            y=other.y+lengthdir_y(radius,a);
            
            //inherit normal, set ground
            if(gnd!=2)
                {nullh=other.hspeed;
                nullv=other.vspeed;
                ux=cos(degtorad(a-90));
                uy=-sin(degtorad(a-90));
                nx=cos(degtorad(a));
                ny=-sin(degtorad(a));
                gnd=2;}
            }
        }
    }
}
compute = 0;
