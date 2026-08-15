var c,k;
timer+=global.time;
if (timer==15)
    {
    k=floor(random(4));
    if (k==0)
        c=global.sndThunder1;
    if (k==1)
        c=global.sndThunder2;
    if (k==2)
        c=global.sndThunder3;
    if (k==3)
        c=global.sndThunder4;
    soundplay(c);
    }
if (timer>31)
    instance_destroy();
alpha=max(0,1-timer/30);
