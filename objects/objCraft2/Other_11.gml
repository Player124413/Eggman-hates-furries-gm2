with greattexture
    {
    instance_destroy();
    }
with (rockline)
    {
    if(y2>__view_get( e__VW.YView, 0 )+480 && y>__view_get( e__VW.YView, 0 )+480)
        {
        with (i)
           instance_destroy();
        instance_destroy();
        }
    }
i=instance_create(xx,yy,greatbrown);
i.c3=c_black;
i.c4=c_black;
i.x2=xx+640;
i.y2=yy+640;

makeCavityV(288,-320,1280);
makeCavityV(256,-320,1280);
makeCavityV(128,-320,1280);
makeCavityV(0,-320,1280);

