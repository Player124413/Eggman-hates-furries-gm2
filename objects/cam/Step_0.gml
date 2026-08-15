var __b__;
__b__ = action_if(phase>=6 && phase<=8);
if __b__
{
//if(timer mod 1 == 0)
    {

    subby+=0.5;
    b=timer*7;
    a=12*48*abs(sin(subby));
    makefall(lengthdir_x(a,b),lengthdir_y(a,b),32);
    b=-b*5;
    makefall(lengthdir_x(a,b),lengthdir_y(a,b),32);
    }
}
__b__ = action_if(phase==7);
if __b__
{
timer+=1;

fh=max(0,(timer-1200)/1.5);

c=min(timer/150,1);
x=48/(1+fh/200);
y=528-fh;
z=16-6*c+fh;

xto=0;
yto=y-320;

if (timer<600)
zto=z-24;
else
zto=z-24+min(300,timer/2-300);

fogcolor=make_color_rgb(max(64,128-timer),max(0,128-timer),max(32,128-timer))

if (timer<1200)
    {
    with objRiseAura
        z+=1.5*power(sin(0.4+0.6*pi*objRiseWing.timer/(3.3*objRiseWing.f)),3);
    with objStaticSurround
        z+=1.5*power(sin(0.4+0.6*pi*objRiseWing.timer/(3.3*objRiseWing.f)),3);
    with objRiseWing
        z+=1.5*power(sin(0.4+0.6*pi*timer/(3.3*f)),3);
    }
if (current_time>startTime+55377)
    {
    endLast();
    }
}
__b__ = action_if(phase==6);
if __b__
{
var a,b;
timer+=1;
if(instance_exists(objCraft))
    {
    i=instance_create(objCraft.x,objCraft.y,objDarkSmoke);
    i.z=objCraft.z;
    objCraft.z-=(120+timer)/300;
    objCraft.x+=2;
    xto=objCraft.x;
    yto=objCraft.y;
    zto=objCraft.z;
    }


x=0;
y=520;
z=8;

if (timer>70 && timer<100)
    {
    x=objCraft.x+2;
    y=objCraft.y+10;
    z=objCraft.z-1.5;

    xto=objCraft.x;
    yto=objCraft.y+8;
    zto=objCraft.z;
    subphs=1;
    
    if (timer==73)
        soundplay(global.sndJump);
    }
if(timer>=100)
    subphs=2;


if (timer==120)
    {
    soundplay(global.sndBreakDown);
    repeat(24)
        {
        i=instance_create(objCraft.x,objCraft.y,objLinePlode);
        i.z=objCraft.z;
        i.x2=i.x-32+random(64);
        i.y2=i.y-32+random(64);
        i.z2=i.z+32+random(32);
        }
    
    with objCraft
        instance_destroy();
        
    
    }
if (timer==133)
    instance_create(0,0,objJumpingSonic);
    
if (timer==370)
    {
    with (objGrass)
        {
        if(!immune)
            falling=1;
        }
    }
if (timer==460)
    {
    soundplay(global.sndBreakDown);
    soundplay(global.sndFinalBoom);
    soundstop(global.sndQuake);
    timer=0;
    phase=7;
    with (objJumpingSonic)
        instance_destroy();
    subphs=0;
    
    i=instance_create(0,0,objRiseWing);
    i.px=-16;
    i.hsc=-1;
    
    i=instance_create(0,0,objRiseWing);
    i.px=16;
    i.hsc=1;
    
    i=instance_create(0,-24,objRiseAura);
    i.z=-640;

    i=instance_create(0,2,objStaticSurround);
    i.sprite_index=sprRiseEggman;
    i.image_speed=0.15;
    i.z=-640;
    i.blend_mode=bm_normal;
    i.image_xscale=0.4;
    i.image_yscale=0.4;
    draw_clear(c_white);
    
    global.handle=SS_LoadSound("SuperUltraViolet1.ogg");
    soundplay(global.handle);
    startTime=current_time;
    }

}
__b__ = action_if(phase==5);
if __b__
{
timer+=1;


i=instance_create(objCraft.x,objCraft.y,objDarkSmoke);
i.z=objCraft.z;
//objCraft.xrot+=0.1;
objCraft.yrot=-10;
objCraft.z-=120/300;
objCraft.x+=2;

x=objCraft.x+10;
y=objCraft.y+8;
z=objCraft.z-2;

xto=objCraft.x;
yto=objCraft.y+6;
zto=objCraft.z;

if (timer<50)
    subphs=halfblink;
else
    {
    subphs+=0.33;
    if (subphs>=9)
        subphs=7;
    }
    
if (timer>120)
    {    
    timer=0;
    subphs=0;
    phase=6;
    }
}
__b__ = action_if(phase==4);
if __b__
{
timer+=1;


if (timer==1)
    {
    objCraft.r=objCraft.r/2;
    objCraft.engine=0;
    i=instance_create(0,0,objNukeExplosion);
    global.rings=0;
    soundstop_all();
    soundplay(global.sndBreakDown);
    }

if (timer==30)
    {
    instance_create(0,0,objFogDust);
    i=instance_create(0,0,objDiscExpand);
    soundplay(global.sndBreakDown);
    }
if (timer>=30)
    {fogdist=512+1024/(1+timer/10);
    i=instance_create(objCraft.x,objCraft.y,objDarkSmoke);
    i.z=objCraft.z;
    objCraft.xrot+=0.1;
    objCraft.yrot-=0.1;
    objCraft.z-=timer/300;}

if (timer==1 || timer==25)
    {
    soundplay(global.sndQuake); 
    with objGrass
        {
        dist=point_distance(x,y,0,0);
        if(dist<16*32)
        z=-8/(1+power(dist/128,3));
        }
    }

if (timer==30)
    {    
    soundloop(global.sndQuake);
    with objGrass
        {
        dist=point_distance(x,y,0,0);
        if(dist<16*32)
        zspeed=-2/(1+power(dist/128,3));
        }
    }



x=192;
y=192;
z=112;

objCraft.x+=2;

xto=0;
yto=0;
zto=0;

if (timer>120)
    {
    with (objStaticSurround)
        instance_destroy();
    timer=0;
    phase=5;
    subphs=0;
    fogdist=800;
    }
}
__b__ = action_if(phase==3);
if __b__
{
timer+=1;

x+=4;
y=16;
z=6;


objSonic.x+=4;
objEggRoll.x+=8;
objEggRoll.image_angle-=5;
objEggRoll.z+=vsp;
vsp-=0.1;
objCails.x+=4;
objCraft.x+=4;

lol.x=objEggRoll.x-8;
lol.y=objEggRoll.y;
lol.z=objEggRoll.z;

if (1)//timer<20)
    {
    xto=objCraft.x+24;
    yto=objCraft.y;
    zto=objCraft.z-4;
    }
else
    {
    xto=objEggRoll.x;
    yto=objEggRoll.y;
    zto=objEggRoll.z;
    }

if (subphs>0)
    {
    subphs-=1;
    }
objCraft.gunrot+=subphs;
objCraft.gunblink=0;


if (objEggRoll.z<2)
    {
    subphs=0;
    timer=0;
    phase=4;
    with (objEggRoll)
        instance_destroy();
    with (objCails)
        instance_destroy();
    with (objSonic)
        instance_destroy();
    with (lol)
        instance_destroy(); 
    }
}
__b__ = action_if(phase==2);
if __b__
{
timer+=1;

x+=4;
y=16;
z=6;


objSonic.x+=4;
objEggRoll.x+=4;
objCails.x+=4;
objCraft.x+=4;

if (timer>=1 && timer<23)
    {
    subphs+=1;
    }
objCraft.gunrot+=subphs;
objCraft.gunblink=0;
if (timer>=22 && timer mod 2 == 0)
    {
    soundplay(global.sndMiniGun);
    objCraft.gunblink=1;
    i=instance_create(objEggRoll.x-4,objEggRoll.y-5+random(10),objEggHit);
    i.z=objEggRoll.z-6+random(12);
    
    i=instance_create(objEggRoll.x-8,objEggRoll.y,objPowerSurround);
    i.z=objEggRoll.z;
    i.image_blend=c_aqua;
    }
if (timer>30 && timer mod 4 ==0)
    {
    i=instance_create(objEggRoll.x-4,objEggRoll.y-10+random(20),objFaceExplosion);
    i.z=objEggRoll.z-12+random(24);
    soundstop(global.sndHit);
    soundplay(global.sndHit);
    }

xto=objCraft.x+16+min(timer/10,8);
yto=objCraft.y;
zto=objCraft.z-4;

if (timer==100)
    {
    i=instance_create(objEggRoll.x-4,objEggRoll.y,objPowerSurround);
    i.z=objEggRoll.z;
    }

if (timer==102)
    {
    soundstop(global.sndHit);
    soundplay(global.sndHit);
    i=instance_create(objEggRoll.x-4,objEggRoll.y,objPowerSurround);
    i.z=objEggRoll.z;
    }
if (timer>=104)
    {
    soundplay(global.sndFinalBoom);
    soundplay(global.sndSpinDown);
    timer=0;
    phase=3;
    vsp=4;
    i=instance_create(objEggRoll.x-4,objEggRoll.y,objPowerSurround);
    i.z=objEggRoll.z;
    i=instance_create(objEggRoll.x-4,objEggRoll.y,objStaticSurround);
    i.z=objEggRoll.z;
    i.sprite_index=sprSmokeSurround;
    i.blend_mode=bm_normal;
    i.image_alpha=0.8;
    i.hspeed=-4;
    i=instance_create(objEggRoll.x-4,objEggRoll.y,objStaticSurround);
    i.z=objEggRoll.z;
    lol=i;
    }

}
__b__ = action_if(phase==1);
if __b__
{
timer+=1;

minz=96/(1+timer/3);


x+=4;
y=16;
z=20;


objEggRoll.x+=4;
objCails.x+=4;
objCraft.x+=4;



objSonic.hspeed=0;
objSonic.vspeed=0;
objSonic.zspeed=0;

objSonic.x=objCraft.x;
objSonic.y=objCraft.y+18.5;

objSonic.image_xscale=0.04;
objSonic.image_yscale=0.04;
if(timer<=16)
    {
    t=(16-timer)/16;
    objSonic.z=objCraft.z+5+t*96;
    }
else
    {objSonic.sprite_index=sprSonicUnder;
    
    objSonic.z=objCraft.z+5;}

if (timer==30)
    {soundplay(global.sndPull);
    objCails.image_speed=0;
    objCails.image_index=0;
    objCails.sprite_index=sprTailPull;}
    
if (timer>30)
    {
    objCails.image_index+=0.5;
    if (objCails.image_index>=5)
        objCails.image_index=3;    
    }
    
if (timer==36)
    soundplay(global.sndSpinUp);

xto=objEggRoll.x;
yto=objEggRoll.y;
zto=objEggRoll.z;

if (timer>40)
    {
    x+=20;
    timer=0;
    subphs=0;
    phase=2;
    }
}
__b__ = action_if(phase==0);
if __b__
{
timer+=1;

minz=96/(1+timer/3);
if (timer<=32)
    soundvolume(global.sndEngine2,power(timer/32,1/3));
if (timer==4)
    soundloop(global.sndEngine2);

if(timer<90)
    soundvolume(global.handle,1-power(timer/90,2))
if (timer==90)
    {soundvolume(global.handle,1);
    soundstop(global.handle);
    SS_FreeSound(global.handle);
    }
    
x+=4;
y=16;
z=8;


if (timer<=32)
    {
    objEggRoll.x=x+128;
    objEggRoll.y=y-16;
    objEggRoll.z=20;
    t=(32-timer)/32;
    objSonic.x=objEggRoll.x-t*64;
    objSonic.y=objEggRoll.y-6;
    objSonic.z=objEggRoll.z+t*512;
    }
else
    {
    objEggRoll.x+=5;
    if(subphs==0)
        {
        objEggRoll.z-=2;
        if (objEggRoll.z<12)
            {
            subphs=10;
            i=instance_create(objEggRoll.x,0,objFaceExplosion);
            soundstop(global.sndHit);
            soundplay(global.sndHit);
            }
        }
    else
        {
        objEggRoll.z+=subphs/10;
        subphs=subphs/1.1;
        }
    objSonic.zspeed-=0.075;
    }
if (timer==32)
    {
    objSonic.hspeed=3;
    objSonic.zspeed=3;
    objEggRoll.sprite_index=sprEggRoll;
    soundplay(global.sndHit);
    repeat(10)
        {
        xs=objEggRoll.x-4;
        ys=objEggRoll.y-4+random(8);
        zs=objEggRoll.z+8;
        i=instance_create(xs,ys,objLinePlode);
        i.z=zs;

        i.x2=i.x-32-32/(1+abs(i.y));
        i.y2=i.y*3;
        i.z2=i.z+4+8/(1+abs(i.y));
        i.hspeed=3.5;
        }   
    i=instance_create(objEggRoll.x-8,objEggRoll.y,objFaceExplosion);
    i.z=objEggRoll.z+10;
    }
with (objLinePlode)
    {z+=0.5;
    y=y*1.1;}

xto=objEggRoll.x;
yto=objEggRoll.y;
zto=objEggRoll.z;

objCraft.x=x+32;
objCraft.y=y-16-minz;
objCraft.z=20;


if (timer>90)
    {
    subphs=0;
    timer=0;
    phase=1;
    i=instance_create(objCraft.x-8,objCraft.y+12,objCails)
    i.z=objCraft.z+4;
    }
}
__b__ = action_if(phase==-1);
if __b__
{
x=lengthdir_x(sp,dir);
y=lengthdir_y(sp,dir);
}
