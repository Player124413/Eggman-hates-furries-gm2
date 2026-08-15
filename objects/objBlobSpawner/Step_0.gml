var c;
timer+=global.time;

if (counter==0)
    c=maxtimer;
else
    c=meantimer;

if (timer>c)
    {
    timer=0;
    counter+=1;
    if (counter>=count)
        counter=0;
    if(x<__view_get( e__VW.XView, 0 )+640 && x>__view_get( e__VW.XView, 0 ))
        {i=instance_create(x,y,objJumpingBlob);
        i.vspeed=-spd;}
    }
