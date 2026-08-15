action_set_relative(1);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
vspeed+=global.grav/global.meter*global.time;
image_index+=-image_speed*(1-global.time);
if (lastgnd==0 && gnd==2 && speed>4)
    {if (phase==0)
        {
        phase=1;
        sprite_index=stailrun;
        image_angle=270;
        image_yscale=1;
        image_speed=2;
        frict=sonic.frict;
        }
    soundplay(global.sndLand2);}
    
if (gnd==0)
    {if (phase!=0) image_angle=direction;
    sprite_index=stailroll;}
    
    
if(phase==1)
    speed-=global.air*speed*speed*global.time;

var __b__;
__b__ = action_if(gnd>0);
if __b__
{
gnd += -1;
}
{
action_set_relative(0);
lastgnd = gnd;
action_set_relative(1);
}
action_set_relative(0);
