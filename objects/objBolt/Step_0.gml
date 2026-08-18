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
// Branches keep a reference to this controller for their shared palette and
// destination. Keep it alive until the complete lightning tree has faded.
if (timer > 31 && !instance_exists(objBranch))
    instance_destroy();
alpha=max(0,1-timer/30);
