
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
var __b__;
__b__ = action_if(on);
if __b__
{
__b__ = action_if(x-(radius+128)<__view_get( e__VW.XView, 0 )+640 && y-(radius+128)<__view_get( e__VW.YView, 0 )+480 && x+(radius+128)>__view_get( e__VW.XView, 0 ) && y+(radius+128)>__view_get( e__VW.YView, 0 ) || (instance_exists(controlbg) && controlbg.outsideOn));
if __b__
{
var a,b,c,d;
with (movable)
    {
    a=point_direction(other.x,other.y,x,y);
    
    c=point_distance(other.hspeed,other.vspeed,hspeed,vspeed);
    d=point_direction(other.hspeed,other.vspeed,hspeed,vspeed);
    b=-lengthdir_x(c,d-a);
    if(point_distance(x,y,other.x,other.y)<=radius+other.radius+b+min(4,c/8) && object_index!=robot && 
        object_index!=objJaw && object_index!=objredlaser && object_index!=objFlashG2 && object_index!=doom)
        {
        motion_add(a,b);
        
        x=other.x+lengthdir_x(radius+other.radius,a);
        y=other.y+lengthdir_y(radius+other.radius,a);
        
        e=lengthdir_x(c,d-(a-90));
        hspeed-=ux*sign(e)*min(abs(e),abs(b)*frict*other.frict);
        vspeed-=uy*sign(e)*min(abs(e),abs(b)*frict*other.frict);
        
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
