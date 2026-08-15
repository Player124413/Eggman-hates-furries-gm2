var __b__;
__b__ = action_if(able);
if __b__
{
if(midiSound!=-1)
    {
    audio_stop_sound(midiSound);
    audio_stop_sound(midiSound);
    midiSound=-1;
    }
if (mySound!="")
    {
    soundstop(mySound);
    SS_FreeSound(mySound);
    mySound="";
    }
if(myImg!=-1)
    {
    background_delete(myImg);
    myImg=-1;
    geWhite=1;
    }
        
if(choice==items-1)
    {
    with objScratch
        instance_destroy();
    able=0;
    phase=2;
    hspeed=20;
    if (function==0)
        audio_play_sound(FoxFace, 10, true);
    soundloop(global.sndChainSewer);
    }
else if (function==0)
    {
    if(choice==14 && !instance_exists(objScratch))
        instance_create(0,0,objScratch);
    else
        {
        with objScratch
            instance_destroy();
        }
    audio_stop_sound(FoxFace);
    if(objMenu.music_t[choice]==1)//midi
        {
        midiSound=SS_LoadSound(objMenu.music_f[choice]);
        audio_play_sound(midiSound, 10, true);
        }
    else
        {
        mySound=SS_LoadSound(objMenu.music_f[choice]);
        soundloop(mySound);
        }
    }
else if (function==1)
    {
    mySound=SS_LoadSound(working_directory+"/sound/"+item[choice]);
    soundplay(mySound);
    }
else if (function==2)
    {
    audio_stop_sound(FoxFace);
    with all
        instance_destroy();
    if(choice==0)
        {
        global.introProg=0;//need to do this when returning to intro.
        room_restart();
        }
    else
        {
        global.startProg=item_n[choice];
        instance_create(0,0,controlbg);
        }
    }
}
