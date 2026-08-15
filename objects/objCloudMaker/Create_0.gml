scroll = 0.96;
event_user(1)
global.time = 0.5;
timer = 30+random(150);
hscale = 360;
vscale = 224;
repeat(32)
    {
    event_user(0);
    i.c=random(1);
    if (random(2)<1)
        phs=1;
    }
    
soundloop(global.sndRain);
