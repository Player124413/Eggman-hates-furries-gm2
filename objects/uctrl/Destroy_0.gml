soundstop(global.sndQuake);
soundvolume(global.sndQuake,1);

if (SS_IsHandleValid(global.handle))
{
    soundstop(global.handle);
    SS_FreeSound(global.handle);
}

if (variable_global_exists("bgDustBottomRuntime"))
{
    if (sprite_exists(global.bgDustBottomRuntime))
        sprite_delete(global.bgDustBottomRuntime);
    // variable_global_remove is unavailable in the target runtime.
    global.bgDustBottomRuntime = -1;
}

