action_set_relative(1);
image_index += -image_speed*(1-global.time);
speed-=global.air*speed*speed*global.time;

x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

if (target!=-1)
    {
    c=point_direction(doom.x,doom.y,x,y);
    target.x=doom.x+lengthdir_x(192,c);
    target.y=doom.y+lengthdir_y(192,c);
    }
action_set_vspeed(global.grav/global.meter*global.time);
var __b__;
__b__ = action_if(explosive);
if __b__
{
var lol;
if (gnd>0)
    {
    soundplay(global.sndExplosion);
    instance_create(x,y,objmedexp);
    if (point_distance(sonic.x,sonic.y,x,y)<30)
        {sonic.damaged=1;
        sonic.damagex=x;
        sonic.damagey=y;
        }
    if (target!=-1)
        {
        with (target)
            instance_destroy();
        }
    instance_destroy();
    }
lastgnd=gnd;
if (gnd>0)
    gnd-=1;    
}
else
{
var lol;
if (gnd>0)
    {
    timer+=global.time;
    if (timer>30 && phase==0)
        {
        visible=0;
        phase=1;
        timer=0;
        soundplay(global.sndFlashOut);
        }
    lol=120;
    if (timer<=lol&&phase==1)
        {
        objectfg.flashlight=1-power(timer/lol,3);
        soundvolume(global.sndJump,timer/lol);
        soundvolume(global.sndRoll,timer/lol);
        soundvolume(global.sndSpin,timer/lol);
        soundvolume(global.sndDash,timer/lol);
        soundvolume(global.sndStop,timer/lol);
        soundvolume(global.sndTailsFly,timer/lol);
        soundvolume(global.sndRing,timer/lol);
        soundvolume(global.sndLoseRing,timer/lol);
        soundvolume(global.sndLand2,timer/lol);
        soundvolume(global.sndClank,timer/lol);
        soundvolume(global.sndSpjoing,timer/lol);
        //remember to reset these when someone dies
        soundvolume(global.handle,0.5+0.5*timer/lol);
        soundvolume(global.sndChopper,timer/lol);
        }
    if (timer==lol)
        {
        instance_destroy();
        }
        
    }

if(gnd==2 && lastgnd==0)
    {
    soundplay(global.sndClink);
    }
lastgnd=gnd;
if (gnd>0)
    gnd-=1;
}
{
action_set_relative(0);
image_index = explosive;
action_set_relative(1);
}
action_set_relative(0);
