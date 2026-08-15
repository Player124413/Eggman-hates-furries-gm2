if(__view_get( e__VW.XView, 0 )+fallX>x)
    {
    vspeed+=sonails.g*global.time*0.5;
    if (y>480)
        instance_destroy();
    y-=(1-global.time)*vspeed;
    }
y+=global.time/2;
