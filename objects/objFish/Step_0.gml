action_set_relative(1);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index += -image_speed*(1-global.time);
var __b__;
__b__ = action_if(phase==0);
if __b__
{
if (hspeed>1)
    {
    hspeed-=global.time/10;
    }
if (hspeed<-1)
    {
    hspeed+=global.time/10;
    }
if(x>xstart+128)
    {
    image_xscale=-1;
    hspeed=-4;
    }
if(x<xstart)
    {
    image_xscale=1;
    hspeed=4;
    }
if(sonic.y>ystart && y>=ystart)
    {
    phase=1;
    goalx=sonic.x-48;
    goaly=sonic.y+128;
    }
image_speed=0.1;
}
__b__ = action_if(phase==1);
if __b__
{
var hsp,dist;
timer+=global.time;
dist=point_distance(x,y,goalx,goaly);
if(dist>192)
    image_speed=0.2;
else
    image_speed=0.1;
if((timer>35 && dist<64) || goalx==-1)
    {
    goalx=sonic.x-64+random(128);
    goaly=sonic.y-64+random(128);
    timer=floor(random(15));
    }

x=approach(x,35,goalx,1);
y=approach(y,35,goaly,1);

hsp=x-xp;
hspeed=0;
vspeed=0;
if(hsp>0)
    image_xscale=1;
if(hsp<0)
    image_xscale=-1;
if (sonic.y<ystart || y<ystart)
    phase=0;
}
xp=x;

bubbles-=global.time;
if(bubbles<0)
    {
    instance_create(x,y,objBubble);
    bubbles=15+random(45);
    }
action_set_relative(0);
