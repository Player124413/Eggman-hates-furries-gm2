var __b__;
__b__ = action_if(phase==0);
if __b__
{
{
action_create_object(objSmokeEnd, sx, sy);
timer+=1;
if (timer<=300 && __background_get( e__BG.Alpha, 0 )<1)
    {
    c+=1/300;
    __background_set( e__BG.Alpha, 0, 0.5+0.5*power(c,2) );
    __background_set( e__BG.Blend, 1, make_color_hsv(0,0,160+c*80/300) );
    }


if(next)
    {
    destroyRingCounter();
    next=0;
    phase=5;
    timer=0;
    instance_create(0,0,makeDance);
    light=-1;
    depth=-4;
    with (objSonicEnd1)
        instance_destroy();
    with (objRainEnd)
        instance_destroy();

    with (objTailsEnd1)
        instance_destroy();
    with (objSmokeEnd)
        instance_destroy();
    
    for(i=0; i<8; i+=1)
        {
        __background_set( e__BG.Visible, i, 0 );
        }
    }
}
}
__b__ = action_if(phase==1);
if __b__
{
phase=2;
light=1;
with (danceStatic)
    instance_destroy();
with (danceSo)
    instance_destroy();
with (danceTa)
    instance_destroy();
with (makeDance)
    instance_destroy();
with (objFirePlace)
    instance_destroy();

with (objSonicEnd1)
    instance_destroy();
with (objTailsEnd1)
    instance_destroy();
with (objSmokeEnd)
    instance_destroy();
soundplay(global.handle);
for(i=0; i<8; i+=1)
    {
    __background_set( e__BG.Visible, i, 0 );
    }
image_blend=c_black;
__background_set_colour( c_black );
depth=0;
timer=0;
}
__b__ = action_if(phase==2);
if __b__
{
timer+=1;
if (timer>16*30)
    {
    yp1=480-(480*2)*(timer-16*30)/(30*30);
    }
if (timer>34*30)
    {
    yp2=480-(480*2)*(timer-34*30)/(30*30);
    }
if (timer>4*30 && c<250 && timer<51*30)
    {
    c+=250/300;
    }
    
if (timer>51*30 && c>0)
    {
    c-=255/300;
    soundvolume(global.sndWind,0.8*(1-power(1-c/255,2)))
    if (c<=0)
        game_completed();
    }
image_blend=make_color_rgb(c,c,c);
if (c>0 && random(9)<1 && timer<55*30)
    {
    i=instance_create(random(96+640-192),480+32,objBubbleEnd);
    i.image_blend=make_color_rgb(c*0.8+8,c*0.8+8,c*0.8+8);
    }
}
__b__ = action_if(phase==5);
if __b__
{
timer+=1;
total=152*30;
rollStart=140;

if (timer<120)
    {soundvolume(global.sndWind,0.8*(1-power(timer/120,2)));
    soundvolume(global.sndRain,(1-power(timer/120,2)));}
if (timer==120)
    {
    soundvolume(global.sndWind,1);
    soundstop(global.sndWind);
    soundvolume(global.sndRain,1);
    soundstop(global.sndRain);
    }
if (timer==150)
    soundplay(global.handle2);

if (light<0 && timer>400 && timer<rollStart-120+total)
    {
    light+=1/120;
    if (light>=0)
        light=0;
    }
if (timer>rollStart)
    credY=480-(480+256+credHeight)*(timer-rollStart)/total;
if (timer>rollStart-120+total && light>-1)
    {
    light-=1/120;
    }
if (timer>rollStart+60+total)
    {
    phase=1;
    }
}
