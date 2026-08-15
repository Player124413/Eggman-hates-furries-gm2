action_set_relative(1);
var __b__;
__b__ = action_if(y>360 && hspeed>-1.5 && cnt<3 && jumping==0);
if __b__
{
action_set_hspeed(-0.00);
}
{
action_set_relative(0);
ground = instance_nearest(x,y,objGrass).z;
action_set_relative(1);
}
z += zspeed;
__b__ = action_if(z>ground+1);
if __b__
{
if (jumping==0)
    {jumping=1;
    soundplay(global.sndJump);
    
    if (cnt==1)
        {vspeed=1;
        zspeed=1.9;
        }
    if (cnt==2)
        {vspeed=2.2;
        hspeed=-1.8;
        zspeed=1.25;
        }
    }
    
if (cnt==0)
    sprite_index=sprCarryJump1;
if (cnt==1)
    sprite_index=sprCarryJump1;
if (cnt==2)
    sprite_index=sprCarryJump2;
if (cnt==3)
    sprite_index=sprCarryJump1;
//etc    
image_speed=0;
if (zspeed>0.5)
    image_index=0;
else
    image_index=1;

zspeed-=0.05;
}
else
{
z=ground;
zspeed=0;

if (jumping==1)
    {
    if (cnt==0)
        {
        sprite_index=sprCarrySit1;
        phase=1;
        timer=0;}
    if (cnt==1)
        {sprite_index=sprCarryRun1;
        image_speed=0.5;}
    if (cnt==2)
        {sprite_index=sprCarrySit1;
        phase=3;
        timer=0;}
    cnt+=1;
    }
jumping=0;
}
timer += 1;
__b__ = action_if(phase==1);
if __b__
{
if (timer==1)
    vspeed=0;

if (timer>=6 && jumping==0 && vspeed<2)
    {sprite_index=sprCarryRun1;
    image_speed=0.5;
    vspeed+=0.5;}
if (cnt==2 && hspeed>-0.3)
    hspeed-=0.0;
}
__b__ = action_if(phase==3);
if __b__
{
if (timer==1)
    {vspeed=0;
    hspeed=0;}

if (timer==13)
    {
    hspeed=-0.4;
    vspeed=1.25;
    zspeed=1.66;
    jumping=1;
    soundplay(global.sndJump);
    }
}
action_set_relative(0);
