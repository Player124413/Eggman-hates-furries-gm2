action_set_relative(1);
if(gnd==2)// && lastgnd==0)
    {
    hspeed+=hspeed-phspeed;
    vspeed+=vspeed-pvspeed;
    }    
if(gnd>0)
    gnd-=1;

  
    
phspeed=hspeed;
pvspeed=vspeed;

speed-=global.air*speed*speed*global.time;

x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
action_set_vspeed(0.3*global.time);
var __b__;
__b__ = action_if(y>__view_get( e__VW.YView, 0 )+1024 || y<__view_get( e__VW.YView, 0 )-1024);
if __b__
{
action_kill_object();
}
if(exploding>0)
    {
    if(random(1)<exploding*global.time)
        {
        i=instance_create(x-16+random(32),y-16+random(32),objsmexp);
        }
    //i=instance_create(x,y,objsmoke);
    //i.hspeed=hspeed*0.98;
    //i.vspeed=vspeed*0.98;
    }
image_angle += rotation;
timer += global.time;
__b__ = action_if(timer>maxtimer-30);
if __b__
{
{
action_set_relative(0);
visible = 1-visible;
action_set_relative(1);
}
}
__b__ = action_if(timer>maxtimer);
if __b__
{
action_kill_object();
}
action_set_relative(0);
