var __b__;
__b__ = action_if(phase>=0 && phase<3 || (phase==3 && timer>90) || phase==4 || phase==5 || (phase==6 && (count==0 || count>60)));
if __b__
{
SS_StopSound(global.handle);
SS_FreeSound(global.handle);
}
soundvolume(global.sndMetalScrape,1);
