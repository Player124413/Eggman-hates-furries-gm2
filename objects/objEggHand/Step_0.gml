image_index-=image_speed*(1-global.time);

x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);



image_blend=make_color_hsv(0,0,c);
var __b__;
__b__ = action_if(phase<=2);
if __b__
{
c=(90*c+255*global.time)/(90+global.time);

soundvolume(global.sndC,1-power(1-cTimer,2));
if (cTimer<0.95)
cTimer+=global.time/80;
}
__b__ = action_if(phase==0);
if __b__
{
timer+=global.time;
image_index=0;
if ((timer+18) mod 46 < 6)
    image_index=1;
}
__b__ = action_if(phase==0 && y>232);
if __b__
{
timer=0;
vspeed=0;
phase=1;
}
__b__ = action_if(phase==1);
if __b__
{
timer+=global.time;
if(timer>8)
{
phase=2;
timer=0;
image_index=0;
hspeed=-0.5;
vspeed=1.33;
}
}
__b__ = action_if(phase==2);
if __b__
{
if (timer==2)
    image_index=1;
if (timer==10)
    {image_speed=0.5;
    vspeed=1;
    hspeed=2;}
timer+=global.time;
if (image_index>=5 && objDreamTails.visible)
    {
    soundstop(global.sndC);
    soundplay(global.sndGunstar3);
    objDreamTails.visible=0;
    }
if (image_index>=5 && objectfg.flashlight<1)
    objectfg.flashlight+=0.15;
if (image_index>6)
    {image_speed=0;
    hspeed=0;
    vspeed=0;
    timer=0;
    phase=3;
    }
}
__b__ = action_if(phase==3);
if __b__
{
objectfg.flashlight=1;
if (c>0)
    {
    c-=global.time*32; 
    if(c<=0)
        {
        global.rings=0;
        c=0;
        controlbg.on=1;
        controlbg.lev=-9;
        instance_create(0,0,sonic);
        instance_create(0,0,makeStartHut);
        with (objDreamTails)
            instance_destroy();
        instance_destroy();
        }
    }
timer+=global.time;

}
