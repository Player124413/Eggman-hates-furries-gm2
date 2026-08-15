
soundvolume(global.sndEngine,0);
soundvolume(global.sndWind,0);
soundloop(global.sndWind);
soundloop(global.sndEngine);
soundfrequency(global.sndEngine,0.22);
on = 1;
action_create_object(objectfg, 0, 0);
var __b__;
__b__ = action_if(lev==-10);
if __b__
{
{
action_create_object(sonic, 0, 0);
soundvolume(global.sndEngine,0);
instance_create(0,0,tutorialgenerator);
soundvolume(global.sndWind,0)
soundloop(global.sndOoze4);
sonic.windSound=global.sndOoze4;
}
}
__b__ = action_if(lev==-9);
if __b__
{
{
action_create_object(sonic, 64, 288);
soundvolume(global.sndEngine,0);
instance_create(0,0,makeStartHut);
}
}
__b__ = action_if(lev==-8);
if __b__
{
{
soundvolume(global.sndEngine,0);
instance_create(0,0,objTakeOff);
}
}
__b__ = action_if(lev==-7);
if __b__
{
{
soundvolume(global.sndEngine,0);
instance_create(0,0,transitiongenerator);
}
}
__b__ = action_if(lev==-6);
if __b__
{
{
action_create_object(sonic, 32, 0);
global.handle=SS_LoadSound("Invulnerability.ogg");
instance_create(0,0,zerogenerator);
}
}
__b__ = action_if(lev==-5);
if __b__
{
{
action_create_object(sonic, 0, 0);
global.handle=SS_LoadSound("FeistyOne1.ogg");
i=instance_create(0,0,objWaterFront)
sonic.x=128;
sonic.y=i.y-64-16;
i=instance_create(0,objWaterFront.y-64,grassgenerator);


i=instance_create(-1280,objWaterFront.y-64,sandline);
i.x2=0;

i=instance_create(0,objWaterFront.y-64-48,objPanjanCore);
i.brakeX=-2;
i.lastFire=i.x;
i.yy=i.y+48;
i.xx=0;

for(a=-32; a>-640; a-=64)
    {
    instance_create(a,objWaterFront.y-64,objFireWall);
    }
}
}
__b__ = action_if(lev==-4);
if __b__
{
{
action_create_object(sonic, 0, 0);
global.handle=SS_LoadSound("FeistyOne1.ogg");
soundloop(global.handle);
i=instance_create(0,0,objWaterFront)
sonic.x=640;
sonic.y=i.y-64-16;
i=instance_create(640,objWaterFront.y-64,grassgenerator);
i.xx=i.x;
i.yy=i.y;
i.r=24;
with (i) {event_user(10); event_user(11);}
i.phase=3;


i=instance_create(640-1280,objWaterFront.y-64,sandline);
i.depth-=1;
i.x2=640-24;
i=instance_create(640-24,objWaterFront.y-64,sandline);
i.x2=640+24;
i.c4=c_white;
i.deep=32;
with grassgenerator
    {
    xx=x;
    yy=y+32;
    r=24;
    len=480;
    dir=270;
    lx1=x+24;
    ly1=y;
    lx2=x-24;
    ly2=y;
    event_user(4);
    }
i=instance_create(640+24,objWaterFront.y-64,sandline);
i.depth-=1;
i.x2=640+1280;
}
}
__b__ = action_if(lev==-3);
if __b__
{
{
action_create_object(sonic, 0, 0);
//soundloop(global.handle);
i=instance_create(0,0,objWaterFront)
sonic.x=640;
sonic.y=i.y-64-16;
i=instance_create(640,objWaterFront.y-64,grassgenerator);
i.xx=i.x;
i.yy=i.y;
i.r=24;
with (i) {event_user(10); event_user(11);}
i.phase=3;
sonic.x=i.xx-320;
sonic.y=i.yy-16;


i=instance_create(640-1280,objWaterFront.y-64,sandline);
i.depth-=1;
i.x2=640-24;
i=instance_create(640-24,objWaterFront.y-64,sandline);
i.x2=640+24;
i.c4=c_white;
i.deep=32;
with grassgenerator
    {
    xx=x;
    yy=y+32;
    r=24;
    len=480;
    dir=270;
    lx1=x+24;
    ly1=y;
    lx2=x-24;
    ly2=y;
    event_user(4);
    }
i=instance_create(640+24,objWaterFront.y-64,sandline);
i.depth-=1;
i.x2=640+1280;
}
}
__b__ = action_if(lev==-2);
if __b__
{
{
action_create_object(sonic, 0, 0);
var h,v;
global.handle=SS_LoadSound("FeistyOne2.ogg");
//soundloop(global.handle);
i=instance_create(0,0,objWaterFront)
sonic.x=2560;
sonic.y=i.y-256-16;
i=instance_create(2560,objWaterFront.y-256,grassgenerator);
i.phase=6;
sonic.x=i.x-128;
sonic.y=i.y-16;

i=instance_create(0,0,drill);
i.layerExists=0;
i.phase=7;
i.remRX=0;
i.remRY=objWaterFront.y-256;

with (drill)
        {
        i=instance_create(remRX,remRY,grassline);
        i.x2=remRX+1559-56;
        i.y2=remRY;
        i.deep=0;
        i=instance_create(remRX+1559+120,remRY,grassline);
        i.x2=remRX+2560;
        i.y2=remRY;
        i.deep=0;
        
        i=instance_create(remRX,remRY,greatbrown2);
        i.c4=i.c3;
        i.depth=11;
        i.x2=remRX+2560;
        i.y2=remRY+1280;

        event_user(0);
        
        closeX=0;
        subphs=2;
        coreSprite=sprcoredest;
        speed=0;
        sp=0;
        
        x=remRX+1809;
        y=remRY+202;
        xx=remRX+1762;
        yy=remRY+159;
        dir=point_direction(xx,yy,x,y);
        drillAngle=dir;
        image_angle=dir;
        
        lastRight=-2;
        lastLeft=-2;
        lx=remRX+1559+120;
        ly=remRY;
        rx=remRX+1559-56;
        ry=remRY;
        precision=80;
        
        h=lengthdir_x(1,dir);
        v=lengthdir_y(1,dir);
        
        for(a=4*83; a>=0; a-=81;)
            drillScript(x-h*a,y-v*a);
        
        dead=1;
        myBouncer=instance_create(xx,yy,objbouncer);
        myBouncer.image_angle=dir+180;
        myBouncer.amount=14;
        }
    
}
}
__b__ = action_if(lev==1);
if __b__
{
{
soundvolume(global.sndEngine,1);
soundvolume(global.sndWind,1);
i=instance_create(5120,-1040,objtornado2);
i.myson=sstand;
i.phase=1;
i.dir=0;
}
}
__b__ = action_if(lev==2);
if __b__
{
{
x=5120;
y=5120;
           
            i=instance_create(x+128,3400+1280,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i=instance_create(x+128,3400+1280+3200,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i=instance_create(x+128,3400+1280+6400,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i=instance_create(x+128,3400+1280+9600,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            
            //send to robot
            sendx=x;
            sendy=3400+1280+12800;
            
            i=instance_create(x-128,3400+1280,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
            i=instance_create(x-128,3400+1280+3200,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
            i=instance_create(x-128,3400+1280+6400,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
            i=instance_create(x-128,3400+1280+9600,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
            
                            i=instance_create(x-112,y+64,objtails1);
                            i.direction=270;
                            i.speed=56;
                            i.sprite_index=stailrun;
                            i.phase=1;
                            i.image_speed=2;
                            i.frict=0.16;
                            i.image_angle=270;


                            myson=-1;
                            i=instance_create(x-112,y-64,sonic);
                            i.able=0;
                            i.image_angle=270;
                            i.sprite_index=srun;
                            i.image_speed=1;
                            i.gnd=2;
                            i.direction=270;
                            i.speed=56;
    y-=320;
                            
            i=instance_create(x,y,robot);
            i.vspeed=sonic.speed+8;
            i.nnx=sendx;
            i.nny=sendy;
            soundplay(global.sndBreakDown);
            for(a=0; a<8; a+=1)
                {
                i=instance_create(x-a*16-32+random(64),y,objdebris);
                i.sprite_index=stornadopieces;
                i.exploding=1/30;
                i.hspeed=random(a/2);
                i.vspeed=sonic.vspeed+9+random(2);
                i.rotation=2+random(10);
                i.image_single=a;
                }
}
}
__b__ = action_if(lev==3);
if __b__
{
{
x=5120;
y=5120;
           
            i=instance_create(x+128,3400+1280,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i=instance_create(x+128,3400+1280+3200,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i=instance_create(x+128,3400+1280+6400,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i=instance_create(x+128,3400+1280+9600,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            
            //send to robot
            sendx=x;
            sendy=3400+1280+12800;
            
            i=instance_create(x-128,3400+1280,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
            i=instance_create(x-128,3400+1280+3200,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
            i=instance_create(x-128,3400+1280+6400,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
            i=instance_create(x-128,3400+1280+9600,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
                            myson=-1;
                            i=instance_create(x-112,y-64,sonic);
                            i.image_angle=270;
                            i.sprite_index=srun;
                            i.image_speed=1;
                            i.gnd=2;
                            i.direction=270;
                            i.speed=56;
    y-=320;
                            
            i=instance_create(x,y,robot);
            i.vspeed=sonic.speed+8;
            i.nnx=sendx;
            i.nny=sendy;
            
            with i
                {
                audio_play_sound(OrSmovrBos, 10, true);
                phase=1;
                fake=0; destroyed=2;
                leye=0;
                reye=0;
                }
}
}
__b__ = action_if(lev==4);
if __b__
{
{
//L? grande plan execution:

soundstop(global.sndWind);
soundloop(global.sndShaft);
sonic.windsound=global.sndShaft;


hallength=9600;
hh=192;

x=0;
y=0;
instance_create(160,0,sonic);

x-=hallength;
i=instance_create(x,y,metaline);
i.x2=x+hallength;
i.y2=i.y;
i.deep=0;
i.depth=-2;

i=instance_create(x,y-hh,metaline);
i.x2=x+hallength+3200;
i.y2=i.y;
i.deep=0;

x+=hallength;

i=instance_create(x+320,y,metaline);
i.x2=x+3200-320;
i.y2=i.y;
i.deep=0;
i.depth=-2;

i=instance_create(x,y,metaside);
i.x2=i.x;
i.y2=i.y+960;
i.deep=0;
i=instance_create(x+320,y,metaside);
i.x2=i.x;
i.y2=i.y+960;
i.deep=0;

i=instance_create(0,0,finalgenerator);
i.phase=3;
i.hh=hh;
i.hallength=hallength;

}
}
__b__ = action_if(lev==5);
if __b__
{
{
//Checkpoint 5(4 rizzle?):

soundstop(global.sndWind);
soundloop(global.sndLavaAmb1);
sonic.windsound=global.sndLavaAmb1;

soundvolume(global.sndEngine,0);
i=instance_create(0,448,objLava);

i=instance_create(0,0,finalgenerator);
with (i)
    event_user(1);
    
i=instance_create(0,0,objPipeFollower);
i.pp=objPipeInit.id;
i.curr=30;
i.x=i.pp.pipe[i.curr-1].x+16;
i.y=i.pp.pipe[i.curr-1].y+16;
i.xx=i.pp.pipe[i.curr].x+16;
i.yy=i.pp.pipe[i.curr].y+16;
i.spd=32;
}
}
__b__ = action_if(lev==6);
if __b__
{
{
//Checkpoint 6:

soundstop(global.sndWind);
soundloop(global.sndLavaAmb1);
sonic.windsound=global.sndLavaAmb1;

i=instance_create(0,0,objLava);

i=instance_create(0,0,finalgenerator);

with i
    {
    xx=x-3200;
    yy=y-32;
    i=instance_create(xx,yy+64,objlavarockbg);
    i.x2=xx+3200;
    
    i=instance_create(xx,yy-192,rockline);
    i.x2=objlavarockbg.x2;
    i.y2=i.y;
    i.ydeep=i.y-192;
    i.depth+=1;
    xx=objlavarockbg.x2;
    phase=9;
    
    i=instance_create(x+480-32,y-16,objFloater);
    i.special=2;
    i=instance_create(x+480-32,y-32,sonic);
    }
}
}
__b__ = action_if(lev==7);
if __b__
{
{
//Checkpoint 6:


soundstop(global.sndWind);
soundloop(global.sndLavaAmb1);
sonic.windsound=global.sndLavaAmb1;
soundloop(global.sndLavaAmb2);

i=instance_create(-1280-960+800,-16,sonic);
i=instance_create(0,0,finalgenerator);

with i
    {
    xx=-1280-960;
    yy=0;
    i=instance_create(xx+1280,yy,rockline);
    i.x2=xx+320;
    i.y2=yy;
    i.ydeep=i.y+256;
    i=instance_create(xx,yy,rockline);
    i.x2=xx+320;
    i.y2=yy;
    i.ydeep=i.y+256;
    
    i=instance_create(xx+1280,yy-128,rockline);
    i.x2=xx+320;
    i.y2=yy-128;
    i.ydeep=i.y-256;
    i=instance_create(xx,yy-128,rockline);
    i.x2=xx+320;
    i.y2=yy-128;
    i.ydeep=i.y-256;
        
    i=instance_create(xx+640,yy-64,objdoormaker2);
    i.maxforce=9001;
    i.i1.x+=32;
    i.i1.x2+=32;
    
    xx+=1280;
    phase=11;
    }
}
}
__b__ = action_if(lev==8);
if __b__
{
{
//Checkpoint 6:


soundstop(global.sndWind);
sonic.windsound=-1;
soundloop(global.sndNonRythmic);



i=instance_create(32,-16,sonic);
i=instance_create(0,0,supergenerator);

i=instance_create(0,0,objElevator);

with (i)
    {
    i4=instance_create(x,y-96,movingline);
    i4.x2=i4.x;
    i4.y2=y;
    i4.mindist=-2;
    timer=90;
    vspeed=-29;
    phase=1;
    y+=32*global.time;
    sonic.y-=32*global.time;
    }
}
}
__b__ = action_if(lev==9);
if __b__
{
{
soundstop(global.sndWind);
sonic.windsound=-1;
soundloop(global.sndNonRythmic);



i=instance_create(512-16,-16,sonic);
i=instance_create(0,0,supergenerator);
i.phase=1;
}
}
__b__ = action_if(lev==10);
if __b__
{
{
soundstop(global.sndWind);
soundvolume(global.sndEngine,0);
sonic.windsound=-1;
//soundloop(global.sndNonRythmic);





i=instance_create(128,0,objtails3);
i.phase=2;
i.sprite_index=stailfly2;
i=instance_create(0,0,supergenerator);
with (i)
    {
    phase=9
    remX=0;
    remY=0;
    }

}
}
__b__ = action_if(lev==11);
if __b__
{
{
soundstop(global.sndWind);
soundvolume(global.sndEngine,0);
instance_create(48,-16,sonic);
sonic.windsound=-1;
//soundloop(global.sndNonRythmic);



i=instance_create(0,0,supergenerator);
with (i)
    {
    myDoor=instance_create(x-16,y-160,objdoormaker3);
    myDoor.mycolor=c_white;
    myDoor.depth=-4;
    phase=21;
    remX=0;
    remY=0;
    event_user(1);
    event_user(0);
    }

}
}
__b__ = action_if(lev==12);
if __b__
{
{
soundstop(global.sndWind);
soundvolume(global.sndEngine,0);
instance_create(0,-192,sonic);
sonic.windsound=-1;
sonic.specialStopCase=1;
//soundloop(global.sndNonRythmic);
global.handle=SS_LoadSound("MetalScratchin1.ogg");

i=instance_create(0,0,doom);
i.phase=0;
i.grav=1;
with i
    event_user(1);
with objFinalOuter
    {image_index=1;
    event_user(0);}

instance_create(-1080,0,objFinalRail);
instance_create(256,0,objring);
instance_create(-256,0,objring);
instance_create(0,256,objring);
instance_create(0,-256,objring);
}
}
__b__ = action_if(lev==13);
if __b__
{
{
soundstop(global.sndWind);
soundvolume(global.sndEngine,0);
instance_create(0,-192,sonic);
sonic.windsound=-1;
sonic.specialStopCase=1;
//soundloop(global.sndNonRythmic);

i=instance_create(0,0,doom);
i.phase=3;
i.grav=0;
i.open=50;
i.image_angle=20;
i.camtimer=0.66;
i.life=i.maxlife2;
with i
    event_user(0);
with objFinalOuter
    {image_index=1;
    hatch=1;
    event_user(0);}

instance_create(-1080,0,objFinalRail);
}
}
__b__ = action_if(lev==14);
if __b__
{
{
soundstop(global.sndWind);
soundvolume(global.sndEngine,0);
instance_create(320+96,-16,sonic);
sonic.windsound=-1;
//soundloop(global.sndNonRythmic);
global.handle=SS_LoadSound("Library.ogg");
SS_LoopSound(global.handle);

objectfg.flashlight=1;
soundplay(global.sndGunstar3);

sonic.able=0;
sonic.image_xscale=-1;
sonic.physics=0;
sonic.sprite_index=sawful;

instance_create(0,0,objDarkDepths);

i=instance_create(0,0,doom);
instance_create(0,0,objFinalCrack);
i.phase=7;
i.grav=0;
i.open=50;
i.falling=1;
i.rotsp=2;
i.image_angle=120;
instance_create(0,0,objFinalCrack);
i.camtimer=0.33;
i.life=i.maxlife2;
with objFinalOuter
    {image_index=1;
    hatch=1;}
with (objDoomRack)
    {
    emeralds=0;
    }
with (objEggMid)
    {
    image_index=7;
    fixed=0;
    y-=60;
    phase=4;
    }
with doom
    {
    nyy=y;
    nxx=x-200;
    for(a=0; a<10; a+=1)//THIRD
        {
        if (a mod 5 == 4)
            {
            for(b=0; b<8; b+=1)
                {
                i=instance_create(nxx,nyy-b*64,objLavaGirder);
                if (a==4 && b==0)
                    i.sprite_index=sprDoomGirderEnd;
                else
                    i.sprite_index=sprDoomGirder;
                i.image_angle=90;
                i.depth=3;
                }
            }
        if(a==6)
            {    
            i=instance_create(nxx,nyy,objSceneryStatic);
            i.sprite_index=sprBridgeCut;
            }
        if(a>=6)
            {
            j=instance_create(nxx,nyy,line);
            i=instance_create(nxx,nyy,objSceneryStatic);
            i.sprite_index=sprBridgeGirder;
            
            j.x2=nxx+64;
            j.y2=nyy;
            }
        nxx+=64;
        }
            
    i=instance_create(nxx,nyy,line);
    i.x2=nxx;
    i.y2=nyy-32;
    i=instance_create(nxx,nyy,objSceneryStatic);
    i.sprite_index=sprBridgeEnd;
    global.tempRingsAllowed=1;
    instance_create(nxx-32,nyy-16,objring);
    global.tempRingsAllowed=0;
    }
}
}
__b__ = action_if(lev==15);
if __b__
{
{
soundstop(global.sndWind);
soundvolume(global.sndEngine,0);
instance_create(0,0,sonic);
sonic.windsound=-1;
controlbg.on=0;
//soundloop(global.sndNonRythmic);
global.handle=SS_LoadSound("Library.ogg");
SS_LoopSound(global.handle);

instance_create(0,0,objCraft2);
objCraft2.prog=0;
objCraft2.phase=1;
soundplay(global.sndLand1);
soundplay(global.sndPull);
soundloop(global.sndEngine2);
sonic.able=0;
sonic.physics=0;

}
}
__b__ = action_if(lev==16);
if __b__
{
{
soundstop(global.sndWind);
soundvolume(global.sndEngine,0);
instance_create(0,0,sonic);
sonic.windsound=-1;
controlbg.on=1;
//soundloop(global.sndNonRythmic);
global.handle=SS_LoadSound("Library.ogg");
SS_LoopSound(global.handle);

instance_create(0,-195.4,objCraft2);
objCraft2.prog=0;
objCraft2.phase=8;
fixedStars=1;
with objCraft2
    {
    hspeed=47;
    angle=0;
    xx=-800;
    yy=0;
    pull=1;
    }
i=instance_create(0,0,objRamEgg);
i.sprite_index=sprSuperEgg8;
i.auraColor=c_black;
soundloop(global.sndEngine2);
sonic.able=0;
if(global.zeroRingMode)
    sonic.rings=30;
else
    sonic.rings=60;
sonic.physics=0;
background_color=make_color_rgb(12,0,17);

i=instance_create(-800,0,objLimitedGrass);
i.x2=800;

}
}
__b__ = action_if(lev==17);
if __b__
{
{
soundstop(global.sndWind);
soundvolume(global.sndEngine,0);
sonic.windsound=-1;
controlbg.on=0;
//soundloop(global.sndNonRythmic);
global.handle=SS_LoadSound("Library.ogg");
SS_LoopSound(global.handle);

background_color=make_color_rgb(12,0,17);


    i=instance_create(0,0,objSuperFG);
    instance_create(0,384,objSuperGrass);
    instance_create(32,384-32,objSuperSonic);
    instance_create(0,0,objCraft3);
    instance_create(0,240,objSuperEgg);
    
    view_xview=0;
    view_yview=0;
    background_visible[0]=1;
    background_index[0]=bgsky;
    background_htiled[0]=1;
    background_foreground[0]=0;
    background_hspeed[0]=-0.5;
    

}
}
__b__ = action_if(lev==18);
if __b__
{
{
soundstop(global.sndWind);
soundvolume(global.sndEngine,0);
sonic.windsound=-1;
controlbg.on=0;
global.handle=SS_LoadSound("Library.ogg");
    soundloop(global.handle);
background_color=make_color_rgb(12,0,17);
instance_create(0,0,cam);
instance_create(0,0,overlay);
room_speed=30;
}
}
__b__ = action_if(lev==19);
if __b__
{
{
soundstop(global.sndWind);
soundvolume(global.sndEngine,0);
//sonic.windsound=-1;
controlbg.on=0;
global.rings=0;
instance_create(0,0,uctrl);
}
}
__b__ = action_if(lev==20);
if __b__
{
{
soundstop(global.sndWind);
soundvolume(global.sndEngine,0);
//sonic.windsound=-1;
controlbg.on=0;

instance_create(0,0,objFrontEnd);
room_speed=30;
}
}
