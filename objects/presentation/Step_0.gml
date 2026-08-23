timer+=global.time;

if (timer<60)
    {
    if (alpha<1)
        alpha+=global.time/30;
    else
        alpha=1;
    }
if (timer>120)
    {
    alpha-=global.time/60;
    if (alpha<=0)
    {
        soundstop(global.sndRain);
        event_user(0);
    }
    }
else
    soundvolume(global.sndRain,0.85*(1-power(1-timer/120,2)));
