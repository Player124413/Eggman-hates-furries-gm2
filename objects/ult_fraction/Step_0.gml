
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
