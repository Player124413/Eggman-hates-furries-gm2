SS_StopSound(global.handle);
SS_SetSoundVol(global.handle,1);
SS_FreeSound(global.handle);

SS_StopSound(global.speech0);
SS_FreeSound(global.speech0);
SS_StopSound(global.speech1);
SS_FreeSound(global.speech1);
SS_StopSound(global.speech2);
SS_FreeSound(global.speech2);

if (surface_exists(textSurf))
    surface_free(textSurf);
if (surface_exists(baseSurf))
    surface_free(baseSurf);
if (surface_exists(surf))
    surface_free(surf);
