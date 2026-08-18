var __b__;
__b__ = action_if(active==0);
if __b__
{
{
x2=x+32;
y2=y;
    
//level editor, write the level in code, or have predefined ground objects that generate line objects around themselves.
i1=instance_create(x,y,upoint);
if(rp)
    i2=instance_create(x2,y2,upoint);
    
//calculate unit vector in the direction of this line
d = max(0.0001, point_distance(x,y,x2,y2));
ux=(x2-x)/d;
uy=(y2-y)/d;
//calculate orthogonal unit vector
p=point_direction(x,y,x2,y2);
nx=cos(degtorad(p+90));
ny=-sin(degtorad(p+90));

active=1;



}
}
__b__ = action_if(min(x,x2)<sonails.x+32 && max(x,x2)>sonails.x-32);
if __b__
{
__b__ = action_if(min(y,y2)<sonails.y+32 && max(y,y2)>sonails.y-32);
if __b__
{
var h,v,a,b,f,s,r,c;

with ult_balls
    {
    with(other)    
            {
            //calculate the ball's distance to the line:
            b=(other.y*ux-y*ux-other.x*uy+x*uy)/(-nx*uy+ny*ux);
            
            //calculate how many unit vectors(ux,uy) we must go from the origin(x,y)
            //in order to reach the point on the line(x+a*ux,y+a*uy)
            //which is the closest point to the ball(other.x,other.y):
            
            if(uy==0)//can't divide by zero
                a=(other.x-nx*b-x)/ux;
            else//these two are equivalent(give the same output)apart from the "divide by zero" part.
                a=(other.y-ny*b-y)/uy;
            
            
            h=hspeed*(1-a/d)+hspeed2*a/d;
            v=vspeed*(1-a/d)+vspeed2*a/d;
            //calculate the component of the speed(other.speed with direction "other.direction") 
            //which is going in the direction orthogonal to the direction of the line(p-90 (or p+90))
            //In other words, how much we must accelerate in order to prevent going through the line. 
            
            s=point_distance(h,v,other.hspeed,other.vspeed);
            r=point_direction(h,v,other.hspeed,other.vspeed);
            
            f=s*cos(degtorad(p-90-r));            
            //Check if the distance to the line b is less than the radius of the ball + f, and
            //if the point on the beam which is closest to the ball IS on the line at all(that is, wether the ball arrives within the boundaries of the line.)
            dead=0;
            if (b<0)
                {
                dead=1;
                }
            //if(abs(b)<=other.radius+sign(b)*f+min(mindist,s/12)+abs(nx) && a>=0 && a<=d && f>0)
            if(abs(b)<=sign(b)*f+other.radius+min(mindist,s/12)+abs(nx) && a>=0 && a<=d && ((((other.gnd<2 && ny<=other.ny) || ny<=other.ny) && doomable) || f>0))
                {
                pp.report=b;
                if(dead)
                    {
                    if(doomable)
                        other.doomed=1;
                    b=abs(b);
                    }
                else
                    other.doomed=0;
                //normal force
                other.hspeed+=nx*f;
                other.vspeed+=ny*f;
                
                if(other.gnd<2 || ny<=other.ny)
                    {
                    other.nx=nx;
                    other.ny=ny;
                    
                    other.ux=ux;
                    other.uy=uy;
                    other.nullh=h;
                    other.nullv=v;
                    }
                
                other.gnd=2;
                
                c=min(point_distance(h,v,other.hspeed,other.vspeed),frict*other.frict);
                c=-c*sign(lengthdir_x(1,point_direction(h,v,other.hspeed,other.vspeed)-p));
                
                with (other)
                    {
                    motion_add(other.p,(1-max(0,ny))/2*c*global.time);
                    }
                                
                //set position the hard way to prevent ugliness.
                other.x=x+ux*a+nx*sign(b)*other.radius;
                other.y=y+uy*a+ny*sign(b)*other.radius;
                }
            }
    }
}
}
