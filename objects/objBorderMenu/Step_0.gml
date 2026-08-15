action_set_relative(1);
var __b__;
__b__ = action_if(phase==0);
if __b__
{
{
action_set_hspeed(-0.5);
if (x+hspeed<=320)
    {
    x=320;
    hspeed=0;
    soundstop(global.sndChainSewer);
    soundvolume(global.sndChainSewer,1);
    soundplay(global.sndClank);
    phase=1;
    able=1;
    }
else
    soundvolume(global.sndChainSewer,1-0.5*power(1-abs(hspeed)/16,2));
}
}
__b__ = action_if(phase==2);
if __b__
{
{
action_set_hspeed(-0.5);
if (x+hspeed>=656)
    {
    soundstop(global.sndChainSewer);
    soundvolume(global.sndChainSewer,1);
    soundplay(global.sndClank);
    objMenu.able=1;
    with objScratch
        instance_destroy();
    instance_destroy();
    }
else
    soundvolume(global.sndChainSewer,1-0.5*power(1-abs(hspeed)/16,2));
}
}
__b__ = action_if(delayDown>-1);
if __b__
{
delayDown-=1;
}
__b__ = action_if(delayUp>-1);
if __b__
{
delayUp-=1;
}
action_set_relative(0);
