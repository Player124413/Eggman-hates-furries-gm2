global.gameWantsControls = 0;
soundvolume(global.sndOoze4,1);
soundstop(global.sndOoze4);

soundstop(global.handle);
soundvolume(global.handle,1);
SS_FreeSound(global.handle);

event_user(1);
