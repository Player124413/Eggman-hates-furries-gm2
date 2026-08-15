action_set_relative(1);
var __b__;
__b__ = action_if(extend<192 && active==0);
if __b__
{
extend += global.time*2;
}
else
{
angle+=global.time*4*image_yscale;
if (active==0)
    {soundplay(global.sndRedWave);
    active=1;}
timer+=global.time;
if (timer>30 || doom.invulnerable>0)
    extend-=5*global.time;
if (extend<192-32)
    instance_destroy();
repeat(3)
    {
    i=instance_create(x,y,objspark);
    i.hspeed=(x-doom.x)/24+hspeed-4+random(8);
    i.vspeed=(y-doom.y)/24+vspeed-4+random(8);
    }
}
{
action_set_relative(0);
prevangle = angle;
action_set_relative(1);
}
{
action_set_relative(0);
image_angle = angle;
action_set_relative(1);
}
var a,b,c,d,e;
while (angle>=360)
    angle-=360;
while (angle<0)
    angle+=360;
a=min(prevangle,angle);
b=max(prevangle,angle);
c=point_direction(doom.x,doom.y,sonic.x,sonic.y);
if(abs(a-b)<180)
    d=(c>a-1 && c<b+1);
else
    d=(c<a+1 || c>b-1);
e=doom.dist;
if (e>extend && e<extend+length+sonic.radius && d && doom.invulnerable==0)
    {
    sonic.damaged=1;
    }
action_set_relative(0);
