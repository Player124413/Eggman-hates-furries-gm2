var __b__;
__b__ = action_if(active==1);
if __b__
{
active=2;
if(i1!=-1 && instance_exists(i1))
    {
    with (i1)
        {
        if(i2!=-1)
        {with (i2)
            instance_destroy();}//do this for the rest as well
        i2=-1;
        }
    }
if(i2!=-1 && instance_exists(i2))
    {
    with (i2)
        {
        if(i2!=-1)
        {with (i2)
            instance_destroy();}
        i2=-1;
        }
    }
if(i3!=-1 && instance_exists(i3))
    {
    with (i3)
        {
        if(i1!=-1)
        {with (i1)
            instance_destroy();}
        if(i2!=-1)
        {with (i2)
            instance_destroy();}
        i1=-1;
        i2=-1;
        }
    }
}
__b__ = action_if(active==0);
if __b__
{
var h1,v2,h2,v2;
h1=lengthdir_x(1,image_angle);
v1=lengthdir_y(1,image_angle);
h2=lengthdir_x(1,image_angle+90);
v2=lengthdir_y(1,image_angle+90);

i1=instance_create(x-15*h2,y-15*v2,line);
i1.x2=x-15*h2+30*h1;
i1.y2=y-15*v2+30*v1;
i2=instance_create(x+15*h2,y+15*v2,line);
i2.x2=x+15*h2+30*h1;
i2.y2=y+15*v2+30*v1;

i3=instance_create(x-15*h2+30*h1,y-15*v2+30*v1,reportingline);
i3.x2=x+15*h2+30*h1;
i3.y2=y+15*v2+30*v1;
i3.pp=id;

active=1;

}
__b__ = action_if(report!=0);
if __b__
{
sonic.damaged=1;
sonic.damagex=x;
sonic.damagey=y;
report=0;
}
