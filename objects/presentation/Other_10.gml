global.maxVolume=0.85;
soundglobal_volume(global.maxVolume);

global.handle=SS_LoadSound("OpenedWay.ogg");
soundvolume(global.handle,0.95);
SS_LoopSound(global.handle);

global.speech0=SS_LoadSound("T_0.ogg");
global.speech1=SS_LoadSound("T_1.ogg");
global.speech2=SS_LoadSound("T_2.ogg");


global.ignoreSurfaces=0;
action_create_object(bike, 320, 240);
action_create_object(viper, 128, 320);
action_create_object(objCloudMaker, 0, 0);
action_create_object(introgenerator, 0, 0);
action_kill_object();
// No thunder/siren effects in the intro presentation.
if(global.introHasBeenCleared && global.introProg==0)
    {
    i=instance_create(0,0,objTuText);
    i.alarm[1]=floor(0.66*i.alarm[1]);
    i.txt="PRESS ESCAPE TO SKIP INTRO";
    i.yOff=0;
    }
