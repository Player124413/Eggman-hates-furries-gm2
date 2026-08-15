gunimg+=gunsp*global.time;
if (gunimg>=3)
gunimg-=3;

tailimg+=global.time;
if (tailimg>=2)
    tailimg-=2;

tailanim+=0.5*global.time;
if (tailanim>=7)
tailanim-=7;

x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index+=-image_speed*(1-global.time);
var __b__;
__b__ = action_if(phase==0);
if __b__
{
x=sonic.x-h-1280*(1-prog);
y=sonic.y-v+160*(1-prog);
pull=0;
if (prog>0.82 && prog<0.95)
    pull=3;
}
__b__ = action_if(phase==1);
if __b__
{
timer+=global.time;
if (angle<0)
    {
    pull=1;
    if (timer>20)
        pull=2;
    angle=(angle*40)/(40+global.time)+1;
    if (angle>=0)
        {angle=0;
        pull=0;
        timer=-90;
        soundplay(global.sndAfterBurnerStop);
        phase=2;
        booster=1;}
    }
}
__b__ = action_if(phase==2);
if __b__
{
var ww,fx;
timer+=global.time;
if (timer==30)
    soundplay(global.sndPull);
if (timer>30)
    pull=1;
if (timer>50)
    pull=2;
if (timer==32)
    {soundplay(global.sndSpinUp);}
if (timer>32 && gunsp<1)
    gunsp+=global.time/25;
firing=0;
if (timer>=57 && timer mod 2 ==0)
    {    
    firing=1;
    soundplay(global.sndMiniGun)
    }
    
if (hspeed<40)
    hspeed+=1;
__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (max(0,min(72,(90+timer)/2))) );

if (timer>=60 && timer mod 4 == 0)
    {soundplay(global.sndCrush);
    if (timer>90)
        i=instance_create(myFan.x-16+random(32),myFan.y-32+random(56),objmedexp);
    }
if (timer>=60 && timer<=90)
    soundvolume(global.sndCrush,(timer-60)/30);
if (timer>90 && timer mod 2 == 1)
    {soundplay(global.sndBlth);
    if (myFan.x<x+320)
        {if (myFan.img==0)
            {
            soundplay(global.sndExplosion);
            i=instance_create(myFan.x,myFan.y,objbigexp);
            }
        myFan.img=1;}
    }

if (timer==90)//MAKE VENT
    {
    xx=x+80+hspeed*30;
    yy=y+32;
    ww=1280;
    myFan=instance_create(xx+16,yy,objVent);
    
    for(fx=xx+128; fx<xx+ww; fx+=192)
        i=instance_create(fx,yy,objCavityLight);
    
    i=instance_create(xx,yy-128,greattexture);
    i.t=background_get_texture(bgCavity1);
    i.hrepeat=9;
    i.x2=xx+ww;
    i.y2=i.y;
    
    i.x3=i.x;
    i.y3=yy+128;
    
    i.x4=i.x2;
    i.y4=i.y3;
    
    i=instance_create(xx,yy-128,rockline);
    i.x2=i.x;
    i.y2=i.y-256;
    i=instance_create(xx,yy-128,rockline);
    i.x2=xx+ww;
    i.y2=i.y;
    i.ydeep=i.y-256;
    
    yy+=128+256;
    i=instance_create(xx,yy,rockline);
    yy-=256;
    i.x2=xx;
    i.y2=yy;
    i=instance_create(xx,yy,rockline);
    xx+=ww;
    i.x2=xx;
    i.y2=yy;
    i.ydeep=yy+256;
    
    with rockline
        sprite_index=sblueground;
    oxx=xx;
    oyy=yy;
    }
//
if (timer>=120)
    {
    global.time=0.05;
    soundplay(global.sndSpinDown);
    soundplay(global.sndBreakDown);
    with (myFan)
        {
        i=instance_create(x,y-32,objbigexp);
        i.depth=-3;
        i.hspeed=other.hspeed/2;
        img=2;
        i=instance_create(x-16,y,objdebris);
        i.sprite_index=sprVent2;
        i.hspeed=other.hspeed+5;
        i.vspeed=-4;
        i.rotation=-1;
        i.image_yscale=2;
        i.image_speed=1;
        fan=0;    
        }
    pull=4;
    phase=3;
    timer=0;}
}
__b__ = action_if(phase==4);
if __b__
{
__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (max(0,min(72,72-(timer)/2))) );
timer+=global.time;

if (timer==60)
    soundplay(global.sndRoar);
if (timer==86)
    soundplay(global.sndPull);
pull=0;
if (timer>=86 && angle<90 && count<2)
    pull=1;
if (timer>90 && angle<90 && count<2)
    {
    angle+=global.time*2;
    }
if (__view_get( e__VW.YView, 0 )<yy+128)
    event_user(2);

if (count==2)
    {
    if (angle>80)
        {angle-=global.time;
        pull=5;}
    }
if (count==3)
    {
    if (angle<90)
        {angle+=global.time;
        pull=1;}
    }
    
if (count==4)
    {
    if (angle<110)
        {angle+=global.time;
        pull=1;}
    }
if (count==5)
    {
    if (angle>90)
        {angle-=global.time;
        pull=5;}
    }
if(count>=6)
    {
    booster=3;
    speed+=global.time/4;
    }
//   
direction=angle;
}
__b__ = action_if(phase==3);
if __b__
{
if(timer!=0)
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (max(0,min(72,72-(timer)/2))) );
timer+=global.time;
if(gunsp>0)
    gunsp-=global.time/25;
firing=0;
if (timer>=3 && global.time<0.5)
    {timer=3;
    global.time=0.5;}
if(__view_get( e__VW.XView, 0 )>xx-640 && xx==oxx)
    event_user(0); // MAKE FURTHER LOLZ
if (timer>23 && pull==4)
    {
    pull=0;
    }
if(x>oxx-144 && angle==0 && pull==0)
    {soundplay(global.sndPull)
    pull=1;}
if(angle==25)
    {
    soundplay(global.sndMetal1);
    repeat(6)
        {i=instance_create(x-64,y-64,objspark);
        i.hspeed+=hspeed;
        i.vspeed+=vspeed+2;}
    }
    
if (x>oxx-128 && angle<45)
    {
    if (angle==0)
        soundplay(global.sndAfterBurner);
    angle+=global.time*2;
    direction=angle;
    booster=3;
    if (angle>=45)
        {
        event_user(1); //MOAR LOLZ
        pull=0;
        angle=45;
        booster=2;
        soundstop(global.sndAfterBurner);
        soundplay(global.sndAfterBurnerStop2);
        phase=4;//plz do not reset timer.
        count=0;
        }
    }
    
if (angle==20)
    soundplay(global.sndBigGun);

}
__b__ = action_if(phase==5);
if __b__
{
timer+=global.time;

if y<yy+256
    {
    pull=4;
    }

if(y<yy+48)
    {
    __background_set_colour( make_color_rgb(12,0,17) );
    speed-=8;
    angle+=2;
    direction+=1;
    with (metaline)
        {
        a=d/amount;
        
        i=0;
        while(i<amount+1)
            {
            g=instance_create(x+ux*i*a,y+uy*i*a,objdebris);
            g.sprite_index=sboltgnd;
            g.image_speed=0;
            g.rotation=-5+random(10);
            g.speed=4+random(4);
            g.direction=point_direction(other.x,other.y,g.x,g.y);
            g.vspeed-=other.speed-8;
            i+=1;
            }
        instance_destroy();
        }
    soundplay(global.sndBreakDown);
    phase=6;
    timer=0;
    }
}
__b__ = action_if(phase==6);
if __b__
{
timer+=global.time;

if (timer==12)
    {
    soundplay(global.sndBigGun)
    soundstop(global.sndEngine2)
    booster=0;
    instance_create(x+32,y-64,objbigexp);
    }
if (timer==14)
    {
    soundplay(global.sndGunstar3)
    instance_create(x+32,y-64,objbigexp);
    }
if (timer>14 && timer mod 1 == 0)
    {
    i=instance_create(x,y,objsmoke);
    i.hspeed+=hspeed*0.7;
    i.vspeed+=vspeed*0.7;
    }
if (timer==20)
    pull=6;

if (timer==23)
    soundplay(global.sndBreakDownBuffer);
if (timer==46)
    soundplay(global.sndBreakDown);
if (timer<69 && timer mod 4 == 0)
    i=instance_create(x-96+random(192),y-96+random(192),objmedexp);    

vspeed+=global.grav/global.meter*global.time;
angle+=global.time/4;
direction+=global.time/8;

if (timer==26 || timer==35)
    {
    booster=1;
    soundplay(global.sndEngine2);
    }
if (timer==28 || timer==37)
    {
    booster=0;
    }
if (timer==90)
    pull=0;
if (timer>=120 && timer<120+15*3-10)
    {
    if timer mod 15 == 0
        {
        pull=1;
        soundplay(global.sndPull);
        }
    if timer mod 15 == 7
        {
        pull=0;
        }
    }
if (timer == 160)
    {
    booster=1;
    soundplay(global.sndEngine2)
    }
if (timer == 168)
    {
    booster=0;
    }
if (timer == 175)
    {
    timer=0;
    phase=7;
    booster=2;
    soundloop(global.sndEngine2)
    soundplay(global.sndAfterBurnerStop2);
    }        
}
__b__ = action_if(phase==7);
if __b__
{
timer+=global.time;

if(count==0)
    {
    f=0.5+7/((yy-64-y)/80);
    angle+=global.time*f+global.time*(direction-angle)/420;
    if (angle<direction)
        angle+=global.time/4;
    }
else
    angle=direction;

if(angle>direction-4 || timer>120)
    {
    direction+=global.time*f;
    if (direction>345-5)
        {
        pull=0;
        count=1;
        }
    }
if(count==1)
    {
    if (f>0 || (direction>2 && direction<180))
        f=(f*9-1)/(9+global.time);
    if(f<0)
        {count=2;
        instance_create(xx-64,yy-160+8,objRamEgg);
        }
    }
if(count==2)
    {
    if(true)
        {
        
        if(direction<180)
            direction-=global.time/30;
        else
            direction+=global.time/30;
        f=0;
        }
    if (direction<1/30 || direction>360-1/30)
        {f=0;
        count=3;
        direction=0;}
    }
if (speed<49)
    speed+=global.time/10;
if (count>1)
    {
    if (x>objRamEgg.x-128 && objRamEgg.sprite_index==sprSuperEgg1)
        {
        objRamEgg.sprite_index=sprSuperEgg8;
        objRamEgg.auraColor=c_black;
        objectfg.flashlight=1;
        controlbg.fixedStars=1;
        soundplay(global.sndGunstar3);
        i=instance_create(objRamEgg.x,objRamEgg.y,objbigexp);
        i.hspeed=hspeed/2;
        }
    if(objRamEgg.sprite_index==sprSuperEgg8)
        {
        if (timer mod 4 == 0)
            {soundplay(global.sndGunstar1);
            i=instance_create(objRamEgg.x-64+random(128),objRamEgg.y-64+random(128),objbigexp);
            i.hspeed=hspeed/2;}
        if(count==3)
            {
            pull=1;
            controlbg.lev=16;
            phase=8;
            timer=0;
            count=0;
            soundplay(global.sndPull);
            }
        objRamEgg.y=y+43.4;
        objRamEgg.x=x+120;
        }
    }
if (objectfg.flashlight>0)
    objectfg.flashlight=objectfg.flashlight*2/(2+global.time);
}
__b__ = action_if(phase==8);
if __b__
{
timer+=global.time;
if (speed<49 && timer<300)
    speed+=global.time/10;
if(timer==2)
    {
    soundplay(global.sndSpinUp);
    pull=2;
    }
if (timer>=2 && gunsp<2 && timer<160)
    gunsp+=2*global.time/25;
if (timer>=29 && timer < 200)
    {    
    if(timer mod 2 == 1)
        objRamEgg.auraColor=c_black;
    if(timer mod 2 == 0)
        objRamEgg.auraColor=c_aqua;
    if(timer mod 2 == 0)
        {soundplay(global.sndMiniGun);
        firing=1;}
    else
        {firing=0;}
    if(timer mod 20 == 0 && timer<40+20*7)
        {
        i=instance_create(objRamEgg.x+8,objRamEgg.y,objLoseEmerald);
        i.index=count; count+=1;
        i.hspeed=hspeed+7;
        i.vspeed=-9;
        }
    if(timer mod 4 == 0)
        {
        soundplay(global.sndHit);
        repeat(2)
            {i=instance_create(objRamEgg.x-16-random(32),objRamEgg.y-16+random(32),objSuperHit);
            i.image_angle=random(360);
            i.image_xscale=0.5+random(1);
            i.image_yscale=i.image_xscale;
            }
        }
    }
if (timer==200)
    {
    soundplay(global.sndSpinDown);
    }
if (timer>200 && gunsp>0)
    {
    gunsp-=2*global.time/25;
    }
objRamEgg.y=y+43.4;
objRamEgg.x=x+120;

if (x>xx+800)
    {xx+=1600;
    i=instance_create(xx,yy,objLimitedGrass);
    i.x2=xx+1600;}
with (objLimitedGrass)
    {if(x2<__view_get( e__VW.XView, 0 )) instance_destroy();
    }

if(timer==180)
    {
    sonic.physics=1;
    sonic.image_speed=1/15;
    sonic.sprite_index=shurt;
    sonic.vspeed=-0.2;
    sonic.hspeed=hspeed-0.2;
    }
if(timer>180 && timer<300)
    {
    sonic.image_speed=1/15;
    sonic.sprite_index=shurt;
    sonic.vspeed-=global.grav/global.meter*global.time;
    }

if (timer==300)
    {
    soundplay(global.sndCharge2);
    with sonic
        {
        instance_destroy();
        i=instance_create(x,y,objGetSuper);
        i.hspeed=other.hspeed;
        }
    with objOrbitEmerald
        {
        instance_destroy();
        }
    }
}
__b__ = action_if(phase==9);
if __b__
{
timer+=global.time;
if (objGetSuper.x>xx+800)
    {xx+=1600;
    i=instance_create(xx,yy,objLimitedGrass);
    i.x2=xx+1600;}
with (objLimitedGrass)
    {if(x2<__view_get( e__VW.XView, 0 )) instance_destroy();
    }
}
blink = !blink;
fourstage+=1;
if (fourstage>=4)
    fourstage-=4;
