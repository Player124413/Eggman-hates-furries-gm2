if (SS_IsHandleValid(global.handle) && phase>0 &&(phase<4 || timer<180 || (phase>5 && phase<10)))
    {SS_StopSound(global.handle);
    SS_FreeSound(global.handle);}
