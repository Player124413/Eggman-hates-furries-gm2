action_set_relative(1);
var __b__;
__b__ = action_if(abs(report)>1);
if __b__
{
{
action_set_vspeed(abs(report)/5);
__b__ = action_if(report>0);
if __b__
{
with (sonic) {
action_set_vspeed(abs(other.report)/10);
}
}
__b__ = action_if(special==1);
if __b__
{

special=2;

}
}
}
__b__ = action_if(instance_exists(objLava) && y>=objLava.y-16);
if __b__
{
action_set_vspeed(global.time*(objLava.y-16-y)/30);
}
else
{
action_set_vspeed(global.grav/global.meter*global.time);
}
speed-=0.1+global.air*speed*speed*global.time;
if (speed<0)
    speed=0;
if (special==2)
    {hspeed=1.5;
    if(instance_exists(sonic))
        {if (x>sonic.x+1280)
        x=sonic.x-480;}
    }
    


x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);
image_index-=image_speed*(1-global.time);

with (i1)
    {x=other.x-24;
    y=other.y;
    y2=y;
    x2=x+48;
    hspeed=other.hspeed;
    vspeed=other.vspeed+0.3;
    event_perform(ev_alarm,0);
    }

{
action_set_relative(0);
report = 0;
action_set_relative(1);
}
action_set_relative(0);
