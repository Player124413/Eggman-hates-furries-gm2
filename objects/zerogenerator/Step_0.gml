var __b__;
__b__ = action_if(firstSand!=-1);
if __b__
{
firstSand.i.x=correctX;
firstSand=-1;
}
__b__ = action_if(phase==0 && sonic.x>xx+640);
if __b__
{
phase=1;
timer=0;
i=instance_create(__view_get( e__VW.XView, 0 )-256,objWaterFront.y,panjan);
i.hspeed=sonic.hspeed+4;

soundplay(global.sndBreakDown);
objectfg.flashlight=1;

event_user(3);
}
__b__ = action_if(phase==1);
if __b__
{
var obj,k;
timer+=global.time;
if instance_exists(panjan)
    obj=panjan;
else
    obj=objPanjanCore;
if (timer==100)
    {
    soundloop(global.handle);
    i=instance_create(__view_get( e__VW.XView, 0 )-256,__view_get( e__VW.YView, 0 )-192,tornado);
    i.hspeed=sonic.hspeed+8;
    i.vspeed=i.hspeed/16;
    }


    
k=power(stufu/8,6);
__view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*(7+k)+obj.x-320)/(8+k) );
if (obj.invulnerable>30 && obj.phase==3)
    {__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (min((16-stufu)*16,32)) );
    if (stufu<16)
        stufu+=global.time*16/90;
    }
if(__view_get( e__VW.XView, 0 )<sonic.x-608)
    __view_set( e__VW.XView, 0, sonic.x-608 );
if(__view_get( e__VW.XView, 0 )>sonic.x-16)
    __view_set( e__VW.XView, 0, sonic.x-16 );
if (obj.phase!=3 || obj.subphs>=2)
    {
    if (stufu>0)
        stufu-=global.time*16/90;
    }

if (timer==23)
    {soundplay(global.sndBreakDownBuffer);
    objectfg.flashlight=0.9;}
if (timer==46)
    {soundplay(global.sndBreakDown);
    objectfg.flashlight=0.8;}
//lol
if (timer<=18)
    a=obj.y-128+128*timer/18;
else if(timer<=36)
    a=obj.y-128*(timer-18)/18;
else if(timer<=54)
    a=obj.y-128+128*(timer-36)/18;
else if(timer<=72)
    a=obj.y-128*(timer-54)/18;
//lol
if(timer<=72)
    {i=instance_create(obj.x+96+random(64),a-32+random(64),objmedexp);
    i.vspeed=random(32);}
    
}
__b__ = action_if(phase==2);
if __b__
{
var obj,k,a;
timer+=global.time;
if instance_exists(panjan)
    obj=panjan;
else
    obj=objPanjanCore;
//no matter what the state WAS, fade to normal.
a=1-min(1,timer/180);
k=power(stufu/8,6);
__view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*(7+k)+(obj.x-320)*a)/(7+k+1*a) );
__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (min((16-stufu)*16,32)*a) );
}
if(__view_get( e__VW.YView, 0 )>objWaterFront.y-128)
    __view_set( e__VW.YView, 0, objWaterFront.y-128 );
if (sonic.y>objWaterFront.y-128+496)
    game_over();
