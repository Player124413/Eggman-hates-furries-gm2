var __b__;
__b__ = action_if(on==0);
if __b__
{
if (sprite_index!=-1)
{
l=(x-1-8)/64;
t=(y-1)/64;
r=(x+1+8)/64;
b=(y+1+16)/64;
}
else
{
l=(x-1)/64;
t=(y-1)/64;
r=(x+1+16)/64;
b=(y+1+16)/64;
}
on=1;
}

if (timer>0)
    {
    timer-=global.time;
    if (instance_exists(pp))
        {
        hspeed=pp.hspeed;
        vspeed=pp.vspeed;
        }
    }
else
    {
    vspeed+=g*global.time;
    if (y>__view_get( e__VW.YView, 0 )+480+8)
        instance_destroy();
    }

x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);
