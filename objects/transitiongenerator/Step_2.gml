var __b__;
__b__ = action_if(phase==0);
if __b__
{
timer+=global.time;
if (timer>30)
    sonic.lockMovement=1;
if(sonic.x>xx-96)
    sonic.lockMovement=0;
if (sonic.x>xx)
    {phase=1;
    timer=0;}
}
__b__ = action_if(phase==1);
if __b__
{
sonic.lockMovement=-1;
if (sonic.hspeed<0.5)
    {phase=2;
    timer=0;}
}
__b__ = action_if(phase==2);
if __b__
{
timer+=global.time;
if (timer==60)
    {
    //make eggman
    audio_play_sound(Ingenious, 10, false);
    sTime=current_time;
    e=instance_create(xx+330,yy+240+32,objShowOffMachine);
    e.vspeed=-2;
    sonic.physics=0;
    sonic.sprite_index=slookdown;
    }
sonic.lockMovement=0;    
sonic.standcount=1;
if(timer>60)
    {
    if (e.y<yy+64)
        {
        sonic.sprite_index=sstand;
        }
    if (e.y<yy-128)
        {
        
        phase=3;
        timer=0;
        }
    }

}
__b__ = action_if(phase==3);
if __b__
{
timer+=global.time;
sonic.sprite_index=slookup;
if (e.vspeed<0)
    e.vspeed+=global.time/2;
else
    e.vspeed=0;
if (timer==10)
    e.img=2;
if (timer==12)
    e.img=3;
sonic.standcount=1;
if (current_time-sTime>8000 && e.img<4)
    {
    soundvolume(global.sndSurprise,0.87);
    soundplay(global.sndSurprise);
    i=instance_create(e.x-8,e.y-52,objCutFlash);
    i.image_angle=135;
    e.img=4;
    }
if (current_time-sTime>12000 && timer>60)
    {
    phase=4;
    timer=0;
    fy=480-400;
    fx=-500;
    soundfrequency(global.sndSurround,0.15);
    soundplay(global.sndSurround);
    }
}
__b__ = action_if(phase==4);
if __b__
{
fx=approach(fx,14,100,1);
timer+=global.time;
if (current_time-sTime>14000 && bling==0)
    {
    bling=1;
    objectfg.flashlight=1;
    soundplay(global.sndBreakDown);
    }
if (current_time-sTime>16000)
    {
    global.handle=SS_LoadSound("Invulnerability.ogg");
    phase=5;
    timer=0;
    e.img=0;
    }


}
__b__ = action_if(phase==5);
if __b__
{
timer+=global.time;

if (timer==60)
    {
    soundplay(global.sndMercury);
    i=instance_create(e.x,e.y+45,objShowOffRocket);
    i.tx=xx+96;
    i.ty=yy+16;
    e.image_index=1;
    }
if (timer==63)
    e.image_index=0;
if (timer==65)
    {
    soundplay(global.sndMercury);
    i=instance_create(e.x+6,e.y+45,objShowOffRocket);
    i.tx=xx+96;
    i.ty=yy+32;
    e.image_index=1;
    sonic.physics=1;
    }
if (timer==68)
    e.image_index=0;
if (timer>=70 && e.hspeed<2)
    e.hspeed+=global.time/2;
if (timer==80)
    fragile.report=1;
if (timer==100)
    {
    with (fragileLine)
        instance_destroy();
    }
if (__view_get( e__VW.YView, 0 )>sy-512)
    {
    with (all)
        {
        if (object_index!=controlbg && object_index!=objectfg && object_index!=sonic)
            instance_destroy();
        }
    instance_create(0,0,zerogenerator);
    controlbg.lev=-6;
    }
}
__b__ = action_if(sonic.physics==0);
if __b__
{
sonic.vspeed=0;
}
if (phase==2 && timer>60)
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (min(16,16*(timer-60)/60)) );
if(phase>2 && phase<5)
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (16) );
if(phase==5 && timer<60)
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (max(0,16-16*(timer)/60)) );
