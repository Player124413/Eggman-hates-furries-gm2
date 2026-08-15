//sprite_index=sprPixel;
p=point_direction(x,y,x2,y2);
//image_angle=p;
d=point_distance(x,y,x2,y2)-1;
//image_xscale=d;
dx=x2-x;
dy=y2-y;
ux=dx/d;
uy=dy/d;

nx=cos(degtorad(p+90));
ny=-sin(degtorad(p+90));


if(i1==-1)
    {if(instance_position(x,y,endpoint)==noone)
        {i1=instance_create(x,y,endpoint);
        i1.p=id;}
    }
else
    {i1.x=x;
    i1.y=y;
    i1.hspeed=hspeed;
    i1.vspeed=vspeed;}
if(i2==-1)
    {
    if(instance_position(x2,y2,endpoint)==noone)
        {i2=instance_create(x2,y2,endpoint);
        i2.p=id;}
    }
else
    {i2.x=x2;
    i2.y=y2;
    i2.hspeed=hspeed;
    i2.vspeed=vspeed;}

if(on!=-2)
    {
    fx=x;
    fy=y;
    fx2=x2;
    fy2=y2;
    }

xi=min(x,x2);
yi=min(y,y2);
xa=max(x,x2);
ya=max(y,y2);

if (right)
    ck=1;
else
    ck=-1;
on = 1;
