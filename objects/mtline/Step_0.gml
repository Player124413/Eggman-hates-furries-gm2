var __b__;
__b__ = action_if(active==0);
if __b__
{
{
//find next line
/*
if instance_exists(id+1)
    {x2=(id+1).x;
    y2=(id+1).y;}
else
    {x2=x+32;
    y2=y;}
*/  
//The stuff above is a crappy way of connecting the lines. You'd want to design a level editor, 
//write the level in code, or have predefined ground objects that generate line objects around themselves.
if(instance_position(x,y,mtpoint)==noone)
    i1=instance_create(x,y,mtpoint);
if(instance_position(x2,y2,mtpoint)==noone)
    i2=instance_create(x2,y2,mtpoint);
//calculate unit vector in the direction of this line
d=point_distance(x,y,x2,y2);
ux=(x2-x)/d;
uy=(y2-y)/d;
//calculate orthogonal unit vector
p=point_direction(x,y,x2,y2);
nx=cos(degtorad(p+90));
ny=-sin(degtorad(p+90));

xi=min(x,x2);
xa=max(x,x2);
yi=min(y,y2);
ya=max(y,y2);

active=1;


/* */
}
}
__b__ = action_if(active);
if __b__
{
with balls
    {
    if (x+radius+24>other.xi && x-radius-24<other.xa && y+radius+24>other.yi && y-radius-24<other.ya)
    {
    with(other)    
            {
            b=(other.y*ux-y*ux-other.x*uy+x*uy)/(-nx*uy+ny*ux);
            
            if(uy==0)//can't divide by zero
                a=(other.x-nx*b-x)/ux;
            else//these two are equivalent(give the same output)apart from the "divide by zero" part.
                a=(other.y-ny*b-y)/uy;
            f=other.speed*cos(degtorad(p-90-other.direction));
            if (b<0)
                b=-b;
            
            if(abs(b)<=sign(b)*f+other.radius && a>=0 && a<=d)
                {
                //normal force
                other.hspeed+=nx*f;
                other.vspeed+=ny*f;
                
                other.nx=nx;
                other.ny=ny;
                
                other.ux=ux;
                other.uy=uy;
                
                other.gnd=2;
                
                //set position the hard way to prevent ugliness.
                other.x=x+ux*a+nx*sign(b)*other.radius;
                other.y=y+uy*a+ny*sign(b)*other.radius;
                
                //You might also want to "tell" the object that it is touching the ground, so it can react accordingly.
                }
            }
    }
    }
/* */
}
/*  */
