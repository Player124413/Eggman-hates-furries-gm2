d3d_model_destroy(modelBlock);
d3d_model_destroy(modelFloor);

if (phase<0 || (phase==0 && timer<90) || phase== 7)
    {soundvolume(global.handle,1);
    soundstop(global.handle);
    SS_FreeSound(global.handle);}
