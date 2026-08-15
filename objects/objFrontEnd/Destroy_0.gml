soundstop(global.sndWind);
soundvolume(global.sndWind,1);
soundstop(global.sndRain);
soundvolume(global.sndRain,1);

soundstop(global.handle);
SS_FreeSound(global.handle);
soundstop(global.handle2);
SS_FreeSound(global.handle2);
__background_set( e__BG.HSpeed, 0, 0 );
__background_set( e__BG.Alpha, 0, 1 );

__background_set( e__BG.Blend, 1, c_white );
