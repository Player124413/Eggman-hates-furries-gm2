var __b__;
__b__ = action_if(phase==1);
if __b__
{
i=instance_create(x,y,greattexture)
i.t=background_get_texture(bgclean);
i.x2=x+800;
i.y2=i.y;
i.x3=i.x;
i.y3=y-128;
i.x4=i.x2;
i.y4=i.y3;
i.hrepeat=4;

xx=480;

i=instance_create(x,y,cleanline);
i.y2=i.y;
i.x2=x+xx;
lower=instance_create(x+xx,y,cleanline);
lower.y2=y;
lower.x2=x+800-64;
i=instance_create(x+800-64,y,cleanline);
i.y2=i.y;
i.x2=x+800;

i=instance_create(x,y-128,line);
i.x2=i.x;
i.y2=i.y+32;

i=instance_create(x+xx,y-128,cleanline);
i.y2=i.y;
i.x2=x;
upper=instance_create(x+800-64,y-128,cleanline);
upper.y2=y-128;
upper.x2=x+xx;
i=instance_create(x+800,y-128,cleanline);
i.y2=i.y;
i.x2=x+800-64;


myswitch=instance_create(x+xx+16,y,objPushSwitch);
myswitch.image_single=1;
myswitch.delay=-1;
if(controlbg.lev==9)
    myswitch.x-=32;
else
    myswitch.x-=24;
i=instance_create(x+800-48,y-88,objVat);
i.dependency=myswitch;
    
i=instance_create(x+800-48,y,line);
i.y2=i.y-128;
i.x2=i.x;



phase=2;

}
__b__ = action_if(phase==3);
if __b__
{

x+=xx;
global.handle=SS_LoadSound("SevenForce.ogg");

with (all)
    {
    if(x<__view_get( e__VW.XView, 0 )-480)
        instance_destroy();
    }

phase=4;
controlbg.lev=9;

with (upper)
    {
    a=d/amount;
    i=0;
    while(i<amount)
        {
        b=instance_create(x+ux*i*a,y+uy*i*a,objdebris);
        b.sprite_index=scleangnd;
        b.image_single=i mod 4;
        b.image_angle=p;
        b.vspeed=8+random(6);
        b.depth=-9;
        i+=1;
        }
        
    instance_destroy();
    }

i=instance_create(x,y-480,line);
i.x2=i.x;
i.y2=y-128;

remX=x;
remY=y-480;

j=instance_create(x+256,y-128,line);
j.x2=j.x;
j.y2=y-480;


k=instance_create(i.x,i.y,greattexture);
k.x2=i.x2;
k.y2=i.y2;
k.x3=j.x2;
k.y3=j.y2;
k.x4=j.x;
k.y4=j.y;
k.c1=c_black;
k.c3=c_black;

soundstop(global.sndNonRythmic);
soundplay(global.sndBreakDown);
i=instance_create(x+128,y-320,chopper);
i.launchdir=225;
i.goalx=i.x;
i.goaly=y+1600;
i.vspeed=12;
i.hspeed=0;
objJaw.dir[0]=60;
objJaw.final=60+180;
}
__b__ = action_if(phase==4);
if __b__
{
if(instance_exists(sonic))
    {if (objJaw.y>sonic.y-128 && objJaw.open>0)
        {objJaw.open-=10*global.time;
        if (objJaw.open<=0)
            {
            objJaw.open=0;
            soundplay(global.sndClank);
            with (sonic)
                instance_destroy();
            }
        }
    //
    
    }
//
if(objJaw.open>0)
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + ((blink-0.5)*8) );
if (objJaw.open==0 && objJaw.dir[0]<170)
    {s=1.5;
    if (chopper.y>chopper.goaly-640)
        s=3;
    objJaw.final+=s*global.time;
    objJaw.dir[0]+=s*global.time;}
    
with (chopper)
    {
    i=instance_create(x+40,y+20,objsmoke);
    i.depth=200;
    i.direction=random(45);
    i.vspeed+=vspeed;
    }

    
if (objJaw.y>y-24 && instance_exists(lower))
    {
    
    with (lower)
        {
        a=d/amount;
        i=0;
        while(i<amount)
            {
            b=instance_create(x+ux*i*a,y+uy*i*a,objdebris);
            b.sprite_index=scleangnd;
            b.image_single=i mod 4;
            b.image_angle=p;
            b.vspeed=8+random(6);
            b.depth=-9;
            i+=1;
            }
            
        instance_destroy();
        }
    i=instance_create(x,y,line);
    i.x2=i.x;
    i.y2=y+960;

    j=instance_create(x+256,y+960,line);
    j.x2=j.x;
    j.y2=y;
    k=instance_create(i.x,i.y,greattexture);
    k.x2=i.x2;
    k.y2=i.y2;
    k.x3=j.x2;
    k.y3=j.y2;
    k.x4=j.x;
    k.y4=j.y;
    k.hrepeat=2;
    k.c2=make_color_rgb(0,0,0);
    k.c4=make_color_rgb(0,0,0);


    soundplay(global.sndBreakDown);

    y+=960;
    thefloor=instance_create(x-256,y+512,cleanline);
    thefloor.x2=x+256+256;
    thefloor.y2=thefloor.y;
    thefloor.ydeep=thefloor.y+640;
    
    with (thefloor)
        {special=1;}
    
    i=instance_create(x+128,y+512,objbouncer);
    i.image_angle=90;
    i.amount=16;
    i.depth=-4;
    i.on=0;
    i.y+=8;//Keep separate to avoid setting the ystart to wrong value, k?
        
    i=instance_create(x-256,y,cleanline);
    i.x2=i.x;
    i.y2=y+512;
    
    i=instance_create(x-512,y-288,greatbrown);
    i.x2=x-256;
    i.y2=y+800;
    i.c3=c_black;
    i.c4=c_black;
    i.depth=-9;
    
    i=instance_create(x+256+256,y-288,greatbrown);
    i.x2=i.x+256;
    i.y2=y+800;
    i.c3=c_black;
    i.c4=c_black;
    i.depth=-9;
    
    i=instance_create(x+256+256,y+512,cleanline);
    i.x2=i.x;
    i.y2=y;

    
    i=instance_create(x,y,cleanline);
    i.x2=i.x-256;
    i.y2=i.y;
    
    i=instance_create(x+256+256,y,cleanline);
    i.x2=i.x-256;
    i.y2=i.y;
    
    i=instance_create(x-256,y,greatbrown);
    i.x2=x+256+256;
    i.y2=y+512;
    i.c3=make_color_rgb(0,0,0);
    i.c4=make_color_rgb(16,16,16);
    
    i=instance_create(x+256+64,y+480,objring);
    i=instance_create(x+256+96,y+480,objring);
    
    i=instance_create(x-64,y+480,objring);
    i=instance_create(x-96,y+480,objring);
    
    }
else
    {
    if (chopper.y+chopper.radius>y+512 && chopper.goaly>y+512)
        {
        chopper.vspeed=-chopper.vspeed/2;
        soundplay(global.sndClank);
        soundplay(global.sndExplosion);
        chopper.goaly=y+288;
        instance_create(chopper.x+16,y+512,objmedexp);
        objJaw.pendulum=1;
        
        objJaw.open=45;
        i=instance_create(objJaw.x+lengthdir_x(64,objJaw.final),objJaw.y+lengthdir_y(64,objJaw.final),sonic);
        i.hspeed=3;
        i.able=0;
        with i
            startroll();
        soundplay(global.sndRoll);
        
        phase=5;
        timer=0;
        }
    if(chopper.goaly>y+512)
        {chopper.vspeed+=0.1;}
    }

a=objJaw.x+lengthdir_x(64,objJaw.final);
b=objJaw.y+lengthdir_y(64,objJaw.final)-100;    
if (b>__view_get( e__VW.YView, 0 )+240)
    {
    __view_set( e__VW.YView, 0, b-240 );
    __view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*19+a-320)/20 );
    }    
    

}
__b__ = action_if(phase==5);
if __b__
{
__view_set( e__VW.YView, 0, sonic.y-340 );
__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + ((blink-0.5)*8) );

if (chopper.launchdir<315)
    chopper.launchdir+=2*global.time;
else
    {phase=6;
    //minor cleanup
    with objVat
        {instance_create(x,y,objEmptyVat);
        instance_destroy();}
    with objElevator
        instance_destroy();
    soundloop(global.handle);
    chopper.phase=2;
    chopper.ik=instance_create(0,0,movingball);
    chopper.ik.radius=48;
    objJaw.ik=instance_create(0,0,movingball);
    objJaw.ik.radius=32;
    objJaw.ia=instance_create(0,0,objJawCollider);
    objJaw.ia.sprite_index=sprTopJaw;
    objJaw.ib=instance_create(0,0,objJawCollider);
    objJaw.ib.sprite_index=sprBotJaw;
    chopper.refX=x+128;
    chopper.refY=y+192;
    chopper.ia=instance_create(0,0,objJawCollider);
    chopper.ia.sprite_index=sprChopper1;
    chopper.atk=0;
    sonic.able=1;}
    

}
__b__ = action_if(phase==6);
if __b__
{
if (SS_GetSoundPosition(global.handle)>SS_GetSoundLength(global.handle)*73.44/86)
    SS_SetSoundPosition(global.handle,SS_GetSoundLength(global.handle)*18.5/86)

    
__view_set( e__VW.YView, 0, sonic.y-340 );
}
__b__ = action_if(phase==8);
if __b__
{
phase=9;
i=instance_create(x+128,y-256,objtails3);
i.goaly=y+512-112;
}
__b__ = action_if(phase==9);
if __b__
{

if (instance_exists(objtails3))
    {
    
    if (objtails3.y<remY+320 && objtails3.phase==2)
        {
        xRight=480;
        xLeft=64;
        
        objtails3.phase=3;
        objtails3.goaly=remY-128;
        
        //
        x=remX;//does NOTHING!
        y=remY;
        for(a=0; a<=64*3; a+=64)
            {
            i=instance_create(x+a,y,objStatic);
            i.depth=-2;
            i.sprite_index=sprBridgeGirder;
            }
        //
        i=instance_create(x,y,line);
        i.x2=x+256;
        i.y2=i.y;
        
        i=instance_create(x+256,y,cleanline);
        i.x2=x+256+xRight;
        i.y2=i.y;
        i.ydeep=i.y+320;
        i=instance_create(x-xLeft,y,cleanline);
        i.x2=x;
        i.y2=i.y;
        
        i=instance_create(x-xLeft,y-256,cleanline);
        i.x2=i.x;
        i.y2=y;
        
        i=instance_create(x+256+xRight,y-256,cleanline);
        i.x2=x-xLeft;
        i.y2=i.y;
        i.ydeep=i.y-320;
        
        j=instance_create(x+256+xRight-64,y,objStandSwitch);
        i=instance_create(x+256+xRight-16,y-160,objdoormaker3);
        i.mycolor=c_white;
        i.dependency=j;
        
        i=instance_create(x-xLeft-640,y-800,greatbrown);//Left side patch
        i.x2=x-xLeft;
        i.y2=y+640;
        i.c3=c_black;
        i.depth=16;
        i=instance_create(x-xLeft,y,greatbrown);//Bottom side patch
        i.x2=x+256;
        i.y2=y+640;
        i.c3=c_black;
        i.depth=16;
        
        i=instance_create(x-xLeft,y-256,greattexture);
        i.x2=x+256+xRight;
        i.y2=i.y;
        i.x3=i.x;
        i.y3=y;
        i.x4=i.x2;
        i.y4=i.y3;
        i.hrepeat=7;
        i.t=background_get_texture(bgHangar);
        
        phase=10;
        }
    }
}
__b__ = action_if(phase==11);
if __b__
{
x=x+256+xRight;

i=instance_create(x,y-320,cleanline);
i.x2=i.x;
i.y2=y-256;
i=instance_create(x,y,cleanline);
i.x2=x+320;
i.y2=i.y;
i.ydeep=i.y+320;
i=instance_create(x+320,y-320,cleanline);
i.x2=x;
i.y2=i.y;
i.ydeep=i.y-256;

j=instance_create(x+320-64,y,objStandSwitch);
i=instance_create(x+320-16,y-160,objdoormaker3);
i.mycolor=c_white;
i.dependency=j;
        

i=instance_create(x+128,y-128,objBallHolder);

i=instance_create(x,y-320,greattexture);
i.x2=x+320;
i.y2=i.y;
i.x3=i.x;
i.y3=y;
i.x4=i.x2;
i.y4=i.y3;
i.hrepeat=4;
i.t=background_get_texture(bgHangar);

phase=12;

}
__b__ = action_if(phase==13);
if __b__
{
x=x+320;

i=instance_create(x,y,cleanline);
i.x2=x+320;
i.y2=i.y;
i.ydeep=i.y+320;
i=instance_create(x+320,y-320,cleanline);
i.x2=x;
i.y2=i.y;
i.ydeep=i.y-256;

j=instance_create(x+320-64,y,objStandSwitch);
i=instance_create(x+320-16,y-160,objdoormaker3);
i.mycolor=c_white;
i.dependency=j;

i=instance_create(x+128,y-64,objBallHolder);

i=instance_create(x+64,y,objBallCart);

i=instance_create(x,y-320,greattexture);
i.x2=x+320;
i.y2=i.y;
i.x3=i.x;
i.y3=y;
i.x4=i.x2;
i.y4=i.y3;
i.hrepeat=5;
i.t=background_get_texture(bgHangar);

phase=14;

}
__b__ = action_if(phase==15);
if __b__
{
x=x+320;

i=instance_create(x,y,cleanline);
i.x2=x+320;
i.y2=i.y;
i.ydeep=i.y+320;
i=instance_create(x+320,y-320,cleanline);
i.x2=x;
i.y2=i.y;
i.ydeep=i.y-256;

j=instance_create(x+320-64,y,objStandSwitch);
i=instance_create(x+320-16,y-160,objdoormaker3);
i.mycolor=c_white;
i.dependency=j;

i=instance_create(x+128,y-224,objPanjan1);
i=instance_create(x+128,y-224,objBallHolder);

i=instance_create(x,y-320,greattexture);
i.x2=x+320;
i.y2=i.y;
i.x3=i.x;
i.y3=y;
i.x4=i.x2;
i.y4=i.y3;
i.hrepeat=3;
i.t=background_get_texture(bgHangar);

phase=16;

}
__b__ = action_if(phase==17);
if __b__
{
x=x+320;

i=instance_create(x,y,cleanline);
i.x2=x+320;
i.y2=i.y;
i.ydeep=i.y+320;
i=instance_create(x+320,y-320,cleanline);
i.x2=x;
i.y2=i.y;
i.ydeep=i.y-256;

j=instance_create(x+320-64,y,objStandSwitch);
i=instance_create(x+320-16,y-160,objdoormaker3);
i.mycolor=c_white;
i.dependency=j;
i.depth=-4;
myDoor=i;

i=instance_create(x+128,y-128,objCraft1);
i=instance_create(x+128,y-128,objBallHolder);

i=instance_create(x+32,y,objToolBox);
i=instance_create(x+96,y,objMechanicCart);

i=instance_create(x+224,y,objAggregate);

i=instance_create(x+128,y-32,objMiniGunGround);

i=instance_create(x,y-320,greattexture);
i.x2=x+320;
i.y2=i.y;
i.x3=i.x;
i.y3=y;
i.x4=i.x2;
i.y4=i.y3;
i.hrepeat=5;
i.t=background_get_texture(bgHangar);

phase=18;

}
__b__ = action_if(phase==19);
if __b__
{
x=x+320;

controlbg.lev=11;
event_user(1);

objTails.maek=0;
phase=20;

}
__b__ = action_if(phase==20 && instance_exists(sonic));
if __b__
{

if (sonic.x<myDoor.x+32)
    timer=0;
else
    {
    myDoor.dependency=id;
    timer+=global.time;
    sonic.able=0;
    sonic.image_angle=0;
    if(sonic.hspeed>0)
        sonic.hspeed-=global.time/10;
    if(sonic.x>myDoor.x+64)
        sonic.hspeed=sonic.hspeed/1.5;
    if (sonic.hspeed<0 || sonic.x>myDoor.x+96)
        sonic.hspeed=0;
    /*if (timer==25)
        {objTails.sprite_index=stailcollapse;
        objTails.image_single=0;}*/
    /*if (timer==30)
        {objTails.image_single=1;
        soundplay(global.sndLand2);}*/
    
    if(timer>45)
        sonic.image_xscale=-1;
    if (timer==50)
        {sonic.sprite_index=sshockup;
        sonic.physics=0;}
    if (timer==48)
        soundplay(global.sndRedWave);
    if (timer>48 && prog>0)
        {
        prog-=global.time/10;
        if (prog<=0)
            {
            phase=21;
            prog=0;
            timer=0;
            soundplay(global.sndClank);
            event_user(0);
            }
        }
    }

/* */
}
__b__ = action_if(phase==21 && instance_exists(sonic));
if __b__
{

timer+=global.time;
sonic.able=0;
if(timer<30)
    {sonic.image_xscale=-1;
    sonic.sprite_index=sshockup;
    sonic.physics=0;}
else if (timer == 30)
    {
    with (objFragile)
        {
        fragile=1;
        instance_create(x,y+192+320,objFinalRail);
        }
    }
else if (timer == 39)
    {
    sonic.image_speed=0.5;
    sonic.sprite_index=sedge;
    sonic.image_xscale=1;
    }
else if (timer==54)
    {
    sonic.physics=1;
    
    makeRazer(x+32,y+640+32,1,4);
    with (objFragile)
        fragile=0;
    
    }
else if (timer==90)
    {
    i=instance_create(x+860,y+192+320,doom);
    i.hspeed=-4;
    soundloop(global.sndChainSewer);
    with objFinalOuter
        event_user(0);
        
    phase=22;
    timer=0;
    }
/* */
}
__b__ = action_if(phase==22);
if __b__
{

timer+=global.time;

__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (min(timer/2,48)) );

if(doom.x<x+480 && doom.hspeed<0)
    {
    soundstop(global.sndChainSewer);
    soundplay(global.sndElevatorStop);
    doom.hspeed=0;
    }
    
if (timer==90)
    soundplay(global.sndExtend);
if (timer>90 && timer<=180)
    {doom.open+=global.time*50/90;}
if (timer==180)    
    {
    global.handle=SS_LoadSound("MetalScratchin1.ogg");//LOADZ MUSIX
    instance_create(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),objEggGanon);
    soundplay(global.sndJoinMe);
    }

if (timer==380+50)
    soundplay(global.sndExtend);
if (timer>380+50 && timer<=470+50)
    {doom.open-=global.time*50/90;}
    
if (timer==470+50)
    {
    with (objFragile)
        fragile=1;
    }

if (timer>500+50)
    {
    phase=23;
    timer=0;
    soundplay(global.sndElectric1);
    soundvolume(global.sndElectric1,1);
    repeat(16)
        {
        a=random(360);
        b=random(360);
        i=instance_create(doom.x+lengthdir_x(doom.radius,a),doom.y+lengthdir_y(doom.radius,a),objElArc);
        i.x2=doom.x+lengthdir_x(doom.radius,b);
        i.y2=doom.y+lengthdir_y(doom.radius,b);
        }
    
    soundplay(global.sndDoom);
    //sonic.able=1;
    sonic.specialStopCase=1;
    sonic.direction=point_direction(sonic.x,sonic.y,doom.x,doom.y);
    sonic.speed=3;
    }
/* */
}
__b__ = action_if(phase==23);
if __b__
{
if (timer!=0)
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (48/(1+timer/60)) );



timer+=global.time;

if (timer<30)
    {
    if (timer mod 4 ==0)
        soundplay(global.sndSurround);
    a=random(360);
    b=random(360);
    i=instance_create(doom.x+lengthdir_x(doom.radius,a),doom.y+lengthdir_y(doom.radius,a),objElArc);
    i.x2=doom.x+lengthdir_x(doom.radius,b);
    i.y2=doom.y+lengthdir_y(doom.radius,b);
    i=instance_create(doom.x+lengthdir_x(doom.radius+64,140-timer*12),doom.y+lengthdir_y(doom.radius+64,140-timer*12),objElExp);
    i.image_angle=random(360);
    }
if (timer==30)
    {
    soundloop(global.sndChainSewer);
    doom.hspeed=4;
    instance_create(doom.x+4*150+256,doom.y,objring);
    instance_create(doom.x+4*150-256,doom.y,objring);
    instance_create(doom.x+4*150,doom.y+256,objring);
    instance_create(doom.x+4*150,doom.y-256,objring);
    sonic.able=1;
    soundloop(global.sndShield);
    doom.grav=1;    
    objFinalOuter.image_index=1;
    }

if(timer<120 && timer mod 15 == 0)
    {
    soundplay(global.sndElectric1);
    soundvolume(global.sndElectric1,1/(1+timer/120));
    }
    
if (timer==150)
    soundvolume(global.sndElectric1,1);
    
if (timer==180)
    {
    soundstop(global.sndChainSewer);
    soundplay(global.sndElevatorStop);
    doom.hspeed=0;
    timer=0;
    phase=24;
    }
/* */
}
__b__ = action_if(phase==24);
if __b__
{
var xx,yy;

controlbg.lev=12;
xx=doom.x;
yy=doom.y;
doom.phase=0;
with doom
    event_user(1);

__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (xx) );
__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (yy) );
with all
    {
    x-=xx;
    y-=yy;
    if (object_index==movingline)
        {
        x2-=xx;
        y2-=yy;
        event_user(0);
        }
    if (x<__view_get( e__VW.XView, 0 )-320 && object_index!=objFinalRail)
        instance_destroy();
    }


instance_destroy();
/* */
}
blink = 1-blink;
/* */
/*  */
