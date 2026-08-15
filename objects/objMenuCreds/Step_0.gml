timer+=1;
total=61*60;//this is sort of bad because music does not start at rollstart.
rollStart=180;

if (light<0 && timer>400 && timer<rollStart-120+total)
    {
    light+=1/120;
    if (light>=0)
        light=0;
    }
if (timer>rollStart)
    credY=480-(480+256+credHeight)*(timer-rollStart)/total;
if (timer==rollStart+total)
    {
    with makestairs
        event_user(0);
    }

