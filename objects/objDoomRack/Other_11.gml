charging = 0;
soundstop(global.sndChopper);
soundstop(global.sndDarkO);
soundplay(global.sndRedWave);
soundplay(global.sndElevatorStop);

if(lazor>0)
    {
    soundstop(global.sndBigGun);
    soundplay(global.sndAfterBurnerStop);
    }
lazor=0;
noMoreLazors = 1;
