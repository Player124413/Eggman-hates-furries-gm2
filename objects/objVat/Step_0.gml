image_index-=image_speed*(1-global.time);
var __b__;
__b__ = action_if(phase==1);
if __b__
{
sonic.able=0;
sonic.image_xscale=1;
sonic.standcount=1;

if (prog==0)
    {soundplay(global.sndUnWater);
    soundplay(global.sndLand1);}
if (prog<1)
    {prog+=global.time/45;
    if (prog>=1)
        soundplay(global.sndElevator)
    }
else if (prog<2)
    {prog+=global.time/45;
    }

}
__b__ = action_if(prog<0.9);
if __b__
{
timer+=global.time;
if (timer<15)
    image_single=0;
else
    image_single=1;
    
if (timer>=30)
    timer=0;
}
else
{
if (image_single<2)
    {soundplay(global.sndWetFall)
    timer=0;}
timer+=global.time;
image_single=4;
if (timer<4)
    image_single=3;
if (timer<2)
    image_single=2;
if (timer==2)
    soundplay(global.sndWetLand);

if (timer>90)
    image_single=5;
    
if (timer==120)
    supergenerator.phase=3;
}
__b__ = action_if(dependency.prog==1 && phase==0);
if __b__
{
{
phase = 1;
}
}
