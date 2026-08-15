action_set_relative(1);
image_index += -image_speed*(1-global.time);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

var __b__;
__b__ = action_if(phase==0);
if __b__
{
{
__b__ = action_if(sprite_index!=sprSuperUp && sprite_index!=sprSuperFly);
if __b__
{
{
__b__ = action_if(y<objCraft2.yy-15);
if __b__
{
action_set_vspeed(global.grav/global.meter*global.time);
}
else
{
y=objCraft2.yy-15;
if (vspeed>0)
    {
    sprite_index=sprSuperStart;
    soundplay(global.sndLand1);
    }
i=instance_create(x,y+15,objsmoke);
i.hspeed=hspeed/2;
hspeed-=global.time;

vspeed=0;

timer+=global.time;
if (timer==12)
    {
    i=instance_create(x,y+15,objFullDust);
    objCraft2.phase=9;
    with objRamEgg
        instance_destroy();
    soundplay(global.sndBreakDown);
    sprite_index=sprSuperFly;
    phase=1;
    timer=0;
    objectfg.flashlight=0.2;
    hspeed=objCraft2.hspeed+1;
    vspeed=-5;
    }
}
}
}
}
}
if (phase==1)
    {__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (timer*28/20) );
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (timer*(114)/(375*2/3)) );}
__view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*3+x-320+2*hspeed*global.time)/4 );
__view_set( e__VW.YView, 0, (__view_get( e__VW.YView, 0 )*3+y-240+2*vspeed*global.time)/4 );

if(controlbg.lev==0)
{if (__view_get( e__VW.XView, 0 )<0)
__view_set( e__VW.XView, 0, 0 );
//if (view_yview<0)
//view_yview=0;

if (__view_get( e__VW.XView, 0 )>room_width-640)
__view_set( e__VW.XView, 0, room_width-640 );}
//if (view_yview>room_height-480)
//view_yview=room_height-480;


__b__ = action_if(phase==1);
if __b__
{
{
action_create_object(objFullSparkly, -32+random(64), -16+random(32));
timer+=global.time;

if(objCraft2.hspeed>hspeed-16)
    objCraft2.hspeed-=global.time/8;
if(y<objCraft2.yy-128)
    {
    if (vspeed<-2)
        vspeed+=global.time/8;
    vspeed+=global.time/4;
    }
if(y>objCraft2.yy-64 && vspeed>0)
    {
    vspeed-=global.time/4;
    }
dustTimer-=global.time;
if (dustTimer<=0)
    {
    i=instance_create(x-random(32),objCraft2.yy,objFullDust);
    i.alpha=max(0,1-(objCraft2.yy-16-y)/160);
    dustTimer+=3;
    }
    
__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (timer*28/20) );
__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (timer*(114)/(375*2/3)) );

if (timer>375*2/3)
    {
    __background_set( e__BG.X, 0, -__view_get( e__VW.XView, 0 )*controlbg.scrollFactor mod 512 );
    __background_set( e__BG.Y, 0, objCraft2.yy-428-__view_get( e__VW.YView, 0 ) );
    gx=objGetSuper.x+objGetSuper.hspeed;
    gy=objGetSuper.y;
    with (all) {if (object_index!=controlbg) instance_destroy();}
    controlbg.on=0;
    controlbg.lev=17;
    i=instance_create(0,0,objSuperFG);
    instance_create(0,384,objSuperGrass);
    instance_create(gx-__view_get( e__VW.XView, 0 ),gy-__view_get( e__VW.YView, 0 ),objSuperSonic);
    instance_create(0,0,objCraft3);
    instance_create(0,240,objSuperEgg);
    
    __view_set( e__VW.XView, 0, 0 );
    __view_set( e__VW.YView, 0, 0 );
    __background_set( e__BG.Visible, 0, 1 );
    __background_set( e__BG.Index, 0, bgsky );
    __background_set( e__BG.HTiled, 0, 1 );
    __background_set( e__BG.Foreground, 0, 0 );
    __background_set( e__BG.HSpeed, 0, -0.5 );
    
    }
}
}
action_set_relative(0);
