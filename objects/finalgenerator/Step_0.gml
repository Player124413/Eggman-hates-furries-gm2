var __b__;
__b__ = action_if(x<__view_get( e__VW.XView, 0 )+720 && phase==0);
if __b__
{
//On a side note: These are recrated at flushing point
i=instance_create(x,y,metaline);
i.x2=x+hallength;
i.y2=i.y;
i.deep=0;

i=instance_create(x,y-hh,metaline);
i.x2=x+hallength+3200;
i.y2=i.y;
i.deep=0;


phase=1;
}
__b__ = action_if(instance_exists(sonic));
if __b__
{
{
__b__ = action_if(phase==1 && sonic.x>x-256);
if __b__
{
phase=2;
i=instance_create(x-64,y-hh/2,objdoormaker2);
j=instance_create(x-64,y-16,objassessment);
j.txt="WEAK POINT##Vulnerability:#Spin Dash Attack";
j.depth=-16;
x+=hallength;
}
__b__ = action_if((phase==2 || phase==3) && sonic.x>x-800);
if __b__
{
with chopper
    {
    hspeed+=0.5*global.time;
    angle=angle mod 360;
    angle=(angle*5-33)/6;
    }
}
__b__ = action_if(phase==2 && sonic.x>x-640-2560);
if __b__
{
//L? grande plan: flush and recreate everything here.
with all
    {
    if (id!=other.id && object_index!=controlbg && object_index!=objectfg
         && object_index!=chopper && object_index!=objJaw && object_index!=metaline
          && object_index!=sonic)
        instance_destroy();
    else if (id!=other.id)
        {//Move back to origin for improved floating point precision
        x-=other.x;
        y-=other.y;
        }
    }

with metaline
    {
    alarm[1]=2;//to avoid blink
    x2-=other.x;
    y2-=other.y;
    on=0;//For it to remake line
    event_perform(ev_alarm,0);
    }
__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (x) );
__view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (y) );
chopper.goalx-=x;
chopper.goaly-=y;
x=0;
y=0;
controlbg.lev=4;

x-=hallength;
i=instance_create(x,y,metaline);
i.x2=x+hallength;
i.y2=i.y;
i.deep=0;
i.depth=-2;

i=instance_create(x+16,y-hh/2,objdoormaker2);
i.maxforce=-1;
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


phase=3;
}
__b__ = action_if(phase==3 && sonic.x>x-128);
if __b__
{
phase=4;
soundloop(global.sndLavaAmb1);

i=instance_create(x+320+16,y-hh/2,objdoormaker2);
i.maxforce=9001;//IT'S OVER NINE THOUSAAAAAND!!!
i=instance_create(x+320,y,greatbrown);
i.depth=0;
i.c3=c_black;
i.c4=c_black;
i.x2=i.x+64;
i.y2=i.y+128;
i=instance_create(x+320,y-hh,greatbrown);
i.depth=0;
i.c3=c_black;
i.c4=c_black;
i.x2=i.x+64;
i.y2=i.y-128;


y+=960;
//INIT
a=-32;
b=320;
i=instance_create(x,y,rockline);
i.x2=x+a;
i.y2=y+b;
j=instance_create(x+320,y,rockline);
j.x2=x+a+320;
j.y2=y+b;
k=instance_create(i.x,i.y,greattexture);
k.x2=i.x2;
k.y2=i.y2;
k.x3=j.x;
k.y3=j.y;
k.x4=j.x2;
k.y4=j.y2;
k.t=background_get_texture(bgrocktop);
x+=a;
y+=b;

makeRazer(x+320,y,-1,3);
//followups
a=320;
b=256;
event_user(0);
a=160;
b=256;
event_user(0);
makeRazer(x,y,1,3);
a=32;
b=320;
event_user(0);
a=-64;
b=256;
event_user(0);
makeRazer(x+320,y,-1,5);
a=-128;
b=288;
event_user(0);
a=-32;
b=320;
event_user(0);
makeRazer(x+304,y,-1,2);
a=-32;
b=320;
event_user(0);
k.c2=c_gray;
k.c4=c_gray;
makeRazer(x+32,y,1,6);
a=-32;
b=320;
event_user(0);
k.c1=c_gray;
k.c3=c_gray;
k.c2=c_black;
k.c4=c_black;


a=0;
b=640;
i=instance_create(x,y,rockline);
i.x2=x+a;
i.y2=y+b;
j=instance_create(x+320,y,rockline);
j.x2=x+a+320;
j.y2=y+b;
x+=a;
y+=b;



timer=0;
}
__b__ = action_if(phase==4);
if __b__
{



if (timer<90)
    {
    soundvolume(global.sndChopper,1-power(timer/90,2));
    soundvolume(global.sndShaft,1-power(timer/90,2));
    soundvolume(global.sndLavaAmb1,power(timer/90,2));
    }
else
    {
    soundstop(global.sndShaft);
    sonic.windsound=global.sndLavaAmb1;
    soundstop(global.sndChopper);
    soundvolume(global.sndChopper,1);
    soundvolume(global.sndLavaAmb1,1);
    soundvolume(global.sndShaft,1);
    phase=5;
    with chopper
        instance_destroy();
    with objJaw
        instance_destroy();
    }
timer+=global.time;


}
__b__ = action_if(phase==5);
if __b__
{
if (sonic.y>y-480)
    {
    with line
        {
        if(y2<sonic.y-320)
            instance_destroy();
        }
    with rockline
        {
        if(y2<sonic.y-320)
            instance_destroy();
        }
    with greattexture
        {
        if(y2<sonic.y-320)
            instance_destroy();
        }
    with metaline
        instance_destroy();
    with metaside
        instance_destroy();
    with objdoormaker2
        instance_destroy();
    //
    makeRazer(x,y-192,1,5);
    makeRazer(x+320,y-128,-1,5);
    i=instance_create(0,y+320,objLava);
    i=instance_create(x-128,y+320+64,objlavarockbg);
    i.x2=x+800;
    //up on other upper side FROM LAVA!!!
    i=instance_create(x+800,y+320,rockline);
    i.y2=y;
    i.x2=i.x;
    i=instance_create(x+800,y,rockline);
    i.y2=i.y-64;
    i.x2=x+1280;
    //Around and up uP UP on other side of wheel
    i=instance_create(x+320,y,rockline);
    i.x2=i.x+256;
    i.y2=y;
    i=instance_create(x+320+256,y,rockline);
    i.x2=i.x;
    i.y2=y-192;
    i=instance_create(x+320+256,y-192,rockline);
    i.x2=i.x+800;
    i.y2=y-960;
    remX=i.x2;
    remY=i.y2;
    
    //down into lava
    i=instance_create(x,y,rockline);
    i.x2=i.x-128;
    i.y2=i.y+192
    i=instance_create(x-128,y+192,rockline);
    i.x2=i.x;
    i.y2=y+320;
    
    
    i=instance_create(x+320,y,greatbrown);
    i.x2=x+320+256;
    i.y2=y-320;
    i.c3=c_black;
    i.c4=i.c3;
    
    i=instance_create(x+320+128,y,objLavaWheel);
    i.length=192;
    
    phase=6;
    x=x+1280;
    y=y-64;
    }
}
__b__ = action_if(phase==6);
if __b__
{

if(sonic.x>x-480)
    {
    event_user(1);
    }
}
__b__ = action_if(phase==8);
if __b__
{
if (tutSwitch>-1)
    {
    if(sonic.x>tutSwitch.x-128)
        {
        i=instance_create(0,0,objTuText);
        i.txt="PUSH THE SWITCH TO THE LEFT#TO ACTIVATE CONTRAPTIONS";
        tutSwitch=-1;
        }
    }

if(sonic.x>xx-320-256)
    {
    with (all)
        {
        if (x<__view_get( e__VW.XView, 0 )-640 && object_index!=objFloater && object_index!=objlavarockbg && id!=other.id)
            {
            if (object_index==movingline)
                {
                if(pp.object_index!=objFloater)
                    instance_destroy();
                }
            else
                instance_destroy();//MUAHAHAHA
            }
        }
    
    xx-=256;
    len=640+256+256;
    event_user(2);
    
    j=instance_create(xx+160,yy,objPushSwitch);
    j.delay=60;
    
    xx+=256;
    
    len=128;

    yy-=80;
    instance_create(xx+16,yy-64,objring);
    instance_create(xx+48,yy-64,objring);
    instance_create(xx+80,yy-64,objring);
    event_user(2);
    yy+=80;
    
    xx+=256;
    
    i=instance_create(xx+640+16,yy-24,objdoormaker3);
    i.dependency=j;
    
    //  stuff
    i=instance_create(xx+128,yy+64,objBlobSpawner);
    i.spd=10; i.timer=5;
    i.maxtimer=15;
    
    i=instance_create(xx+224,yy+64,objBlobSpawner);
    i.count=4; i.timer=20; i.meantimer=10; i.maxtimer=60;
    
    i=instance_create(xx+320,yy+64,objBlobSpawner);
    i.count=2; i.timer=24; i.meantimer=24; i.maxtimer=80;
    i=instance_create(xx+352,yy+64,objBlobSpawner);
    i.count=2; i.timer=12; i.meantimer=24; i.maxtimer=80;
    i=instance_create(xx+385,yy+64,objBlobSpawner);
    i.count=2; i.timer=00; i.meantimer=24; i.maxtimer=80;
    
    i=instance_create(xx+480,yy+64,objBlobSpawner);
    i.spd=14; i.timer=3;
    i.maxtimer=34;
    // /stuff
    
    
    xx+=512;
    i=instance_create(xx,yy-256,rockline);
    i.x2=remX;
    i.y2=remY;
    i=instance_create(xx,yy-256,rockline);
    i.x2=xx;
    i.y2=yy-192;
    i=instance_create(xx,yy-192,rockline);
    i.x2=objlavarockbg.x2;
    i.y2=i.y;
    i.ydeep=i.y-192;
    i.depth+=1;
    xx=objlavarockbg.x2;
    phase=9;
    }
}
__b__ = action_if(phase==9);
if __b__
{
if (sonic.x>xx-384)
    {
    audio_play_sound(Samwedo, 10, true);
    
    x=xx;
    y=yy;
    
    yy-=192;
    i=instance_create(xx,yy,rockline);
    yy=objLava.y-1024;
    i.x2=xx;
    i.y2=yy;
    i=instance_create(xx,yy,rockline);
    yy-=64+64;
    xx+=64+160+128;
    i.x2=xx;
    i.y2=yy;
    i=instance_create(xx,yy,rockline);
    yy-=320+24;
    i.x2=xx;
    i.y2=yy;
    i=instance_create(xx,yy,rockline);
    yy-=64;
    xx-=64;
    i.x2=xx;
    i.y2=yy;
    i=instance_create(xx+32,yy+32,objbouncer);//THE BOUNCER
    i.image_angle=45;
    i=instance_create(xx,yy,rockline);
    yy=objLava.y-1600-64;
    i.x2=xx;
    i.y2=yy;
        //ROOF START:
    i=instance_create(xx,yy,rockline);
    xx+=720-128;
    i.x2=xx;
    i.y2=yy;
    i=instance_create(xx,yy,rockline);
    yy+=128;
    i.x2=xx;
    i.y2=yy;
    
    i=instance_create(xx-32,yy-32,objPipeInit);//PIPE
    with i makePipe3();
    
    i=instance_create(xx,yy,rockline);
    xx-=256;//
    i.x2=xx;
    i.y2=yy;
    i=instance_create(xx,yy,rockline);
    yy+=96;
    i.x2=xx;
    i.y2=yy;
    i=instance_create(xx,yy,rockline);
    xx+=64+256;//
    i.x2=xx;
    i.y2=yy;
    i=instance_create(xx,yy,rockline);
    yy-=224;
    i.x2=xx;
    i.y2=yy;
    i=instance_create(xx,yy,rockline);
    
    xx+=1120-720-64-160;
    i.x2=xx;
    i.y2=yy;
        
    xx=x;
    yy=y;
    i=instance_create(xx,yy+64,objlavarockbg);
    i.x2=xx+480+640;
    
    xx+=480;
    yy+=32;
    
    i=instance_create(xx+16,yy-64-96,objdoormaker3);
    i.dependency=id;
    prog=1;
    
    i=instance_create(xx,yy,rockline);
    yy-=64;
    i.x2=xx;
    i.y2=yy;
    i.depth-=1;
    i=instance_create(xx,yy,rockline);

    myswitch=instance_create(xx+480,objLava.y-64,objPushSwitch);
    myswitch.delay=-1;
    myswitch.x-=24;
    rr=128;
    xx+=640-rr;
    i.x2=xx;
    i.y2=yy;
    
    i.ydeep=objLava.y;
    
    //HALFPIPE:
    for(a=0; a<pi-0.01; a+=pi/12)
        {
        i=instance_create(xx+rr*sin(a),yy-rr-rr*cos(a),rockline);
        i.x2=xx+rr*sin(a+pi/12);
        i.y2=yy-rr-rr*cos(a+pi/12);
        if (a>=pi/2-0.1)
            i.ydeep=objLava.y;
        }
    
    yy-=2*rr;
    //RIGHT SIDE RAZER WALL etc
    i=instance_create(xx,yy,rockline);
    xx-=64;
    i.x2=xx;
    i.y2=yy;
    
    makeRazer(xx-16,yy-16,-1,7);
    makeRazer(xx-16,yy-140-16,-1,7);
    makeRazer(xx-16,yy-288-16,-1,7);
    makeRazer(xx-16,yy-480+32,-1,7);
    
    i=instance_create(xx,yy,rockline);
    yy-=480;
    i.x2=xx;
    i.y2=yy;
    
    j=instance_create(xx+112,yy,objPushSwitch);
    j.delay=25;
    i=instance_create(xx-128,yy-288,objLavaWheel);
    i.length=288;
    i.rotsp=1;
    i.plats=3;
    i.dependency=j;
    i.rot+=60;
    
    i=instance_create(xx,yy,rockline);
    xx+=192;
    i.x2=xx;
    i.y2=yy;
    i=instance_create(xx,yy,rockline);
    yy=objLava.y-1600+64;
    i.x2=xx;
    i.y2=yy;
    remX=xx;//Roll the drum-um-um-um
    remY=yy;

    
    //GO TO platformy thing over door:
    xx=x+480;
    yy=y-64-152;
    
    i=instance_create(xx,objLava.y-960,rockline);
    i.x2=i.x+48;
    i.y2=i.y;
    i=instance_create(xx,yy,rockline);
    i.x2=i.x;
    i.y2=objLava.y-960;
    i.depth-=1;
    
    i=instance_create(xx,yy,rockline);
    xx+=32;
    i.x2=xx;
    i.y2=yy;
    i.ydeep=i.y-256;
    i.depth+=1;
    i=instance_create(xx,yy,rockline);
    xx+=32;
    i.x2=xx;
    i.y2=yy;
    i.depth-=1;
    i=instance_create(xx,yy,rockline);
    yy-=32;
    i.x2=xx;
    i.y2=yy;
    i.depth-=1;
    i=instance_create(xx,yy,rockline);
    xx-=32;
    i.x2=xx;
    i.y2=yy;
    i.ydeep=i.y+64;
    
    makeRazer(xx+32,yy-128,1,7);
    makeRazer(xx+32,yy-280,1,7);
    makeRazer(xx+32,yy-424,1,7);
    
    i=instance_create(xx,yy,rockline);
    yy=objLava.y-960;//This is for middle stuff
    i.x2=xx;
    i.y2=yy;
    
    
    xx=remX;
    yy=remY;
    i=instance_create(xx,yy,rockline);
    i.x2=xx+320;
    i.y2=yy;
    i=instance_create(xx,yy-128,rockline);
    i.x2=xx+320;
    i.y2=yy-128;
    
    i=instance_create(xx+1280,yy,rockline);
    i.x2=xx+320;
    i.y2=yy;
    i.ydeep=i.y+256;
    global.fu=i;
    i=instance_create(xx+1280,yy-128,rockline);
    i.x2=xx+320;
    i.y2=yy-128;
    i.ydeep=i.y-256;
    
    i=instance_create(xx,0,objLavaFader);
    i.x2=i.x+320;    
    
    phase=10;
    controlbg.lev=6;
    }
}
__b__ = action_if(phase==10);
if __b__
{
if(objFloater.x>=x+480-32 && objFloater.special>0)
    {
    objFloater.hspeed=0;
    objFloater.special=0;
    objFloater.x=x+480-32;
    }
if(myswitch.prog>=1 || prog<1)
    {
    if (prog==1)
        {
        with objFloater
            instance_destroy();
        i=instance_create(x+480-32,y-16,objFloater);
        i.special=2;
        timer=0;
        _line=instance_create(x+480+32,objLava.y-96-184,line);
        _line.y2=_line.y;
        _line.x2=_line.x;
        soundplay(global.sndExtend);}
    if (prog>0)
        prog-=global.time/10;
    if (timer<180)
        {
        timer+=global.time*2;
        _line.x2=_line.x+timer*2;
        with _line
            event_perform(ev_alarm,0);
        if (timer mod 16 ==0)
            {i=instance_create(_line.x,_line.y,objStatic);
            i.sprite_index=sprlavawalk;
            i.depth=-1;}
        with objStatic {if(sprite_index==sprlavawalk)x+=2;}
        }
    if (objLava.y<yy+96)
        {objLava.vspeed=0;
        objLavaBlob.vspeed=0;
        objLavaWave.vspeed=0;}
    else if (timer>=180 && objLava.vspeed==0)
        {objLava.vspeed=-0.85;
        objLavaBlob.vspeed=-0.85;
        objLavaWave.vspeed=-0.85;}
    
    
    if (sonic.x>xx+800)
        {
        x=xx+960+1280;
        y=yy;
        with all
            {
            if(object_index!=sonic && object_index!=controlbg && object_index!=objectfg && object_index!=finalgenerator)
                {
                if(object_index==rockline || object_index==line)
                    {
                    if(x2>__view_get( e__VW.XView, 0 )-640)
                        {
                        if (object_index==rockline)
                            {if(ydeep!=-1)ydeep-=other.y;}
                        x-=other.x;
                        y-=other.y;
                        x2-=other.x;
                        y2-=other.y;
                        event_perform(ev_alarm,0);
                        }
                    else
                        instance_destroy();
                    }
                else if(x<__view_get( e__VW.XView, 0 ))
                    instance_destroy();
                }
            else if (id!=other.id)
                {x-=other.x;
                y-=other.y;}
            }
        with objLava//Follows son..x
            instance_destroy();
        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (x) );
        __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (y) );
        xx-=x;
        yy-=y;
        x=0;
        y=0;
            
        i=instance_create(xx+640,yy-64,objdoormaker2);
        i.maxforce=9001;
        i.i1.x+=32;
        i.i1.x2+=32;
        
        xx+=1280;//YESZ
        
        phase=11;
        controlbg.lev=7;
        }
    
    }
}
__b__ = action_if(phase==11);
if __b__
{
i=instance_create(xx,yy-128,rockline);
i.y2=i.y;
i.x2=xx+960-96;

i=instance_create(xx,yy,rockline);
i.y2=i.y;
i.x2=xx+960-96;

instance_create(xx-20,yy-24,objring);
instance_create(xx-40,yy-24,objring);
instance_create(xx-60,yy-24,objring);

xx+=960;
phase=12;
timer=0;
}
__b__ = action_if(phase==12);
if __b__
{
if (timer<60)
    {
    timer+=1;
    soundvolume(global.sndLavaAmb1,1-power(timer/60,2));
    soundvolume(global.sndLavaAmb2,1-power(timer/60,2));
    audio_sound_gain(Samwedo,1-power(timer/60,2),0);
    if (timer>=60)
        {soundstop(global.sndLavaAmb1);
        soundvolume(global.sndLavaAmb1,1);
        audio_sound_gain(Samwedo,1,0);
        audio_stop_sound(Samwedo);
        soundvolume(global.sndLavaAmb2,1);
        soundstop(global.sndLavaAmb2);}
    }

if (sonic.x>xx-480)
    {
    soundstop(global.sndLavaAmb1);
    soundvolume(global.sndLavaAmb1,1);
    audio_sound_gain(Samwedo,1,0);
    audio_stop_sound(Samwedo);
    soundvolume(global.sndLavaAmb2,1);
    soundstop(global.sndLavaAmb2);
    
    i=instance_create(xx-96,yy,line);
    i.y2=i.y;
    i.x2=i.x+144;
    i=instance_create(xx-96,yy-128,line);
    i.y2=i.y;
    i.x2=i.x+144;
    
    ground=instance_create(xx,yy,movingline);
    ground.y2=yy;
    ground.x2=xx+640;
    instance_create(xx+640-144,yy,objtdr);
    instance_create(xx+144,yy,objtdl);
    instance_create(xx+144,yy-256,objTDRoom);
    
    i=instance_create(xx+144,yy-128,line);
    i.x2=i.x; i.y2=yy-256;
    i=instance_create(xx+144+352,yy-128,line);
    i.x2=i.x; i.y2=yy-256;
    
    i=instance_create(xx+144,yy-256,line);
    i.x2=i.x+352; i.y2=yy-256;
    
    //i=instance_create(xx+640-144-32,yy-16,objdollbot);
    //i.ground=ground;//LATERZ
    
    phase=13;
    }
}
__b__ = action_if(phase==13);
if __b__
{
if(sonic.x>=xx+160)
    {
    i=instance_create(xx+144-16,yy-64,objdoormaker2);
    i.maxforce=9001;
    i.i1.x+=32;
    i.i1.x2+=32;
    mydoor=instance_create(xx+144+352+16,yy-64,objdoormaker2);
    mydoor.maxforce=9001;
    phase=14;
    timer=0;
    
    i=instance_create(xx+144+352,yy-128,line);
    i.x2=i.x+320;
    i.y2=i.y;
    i=instance_create(xx+144+352,yy,line);
    i.x2=i.x+320;
    i.y2=i.y;
    i=instance_create(xx+144+352+320,yy-128,line);
    i.x2=i.x;
    i.y2=i.y+32;
    i=instance_create(xx+144+352+320,yy,objElevator);
    }
    
    
}
__b__ = action_if(phase==14);
if __b__
{
timer+=global.time;

if (timer==80 || timer==100 || timer==160 || timer==190 || timer==195 || timer==200)
    {with (objTDRoom)
        event_user(0);}
if(timer==200)
    {
    with objCpu
        image_index=1;
    with objServer
        image_index=1;
    }
//

if (timer==300)
     {
     objectfg.flashlight=-1;
     soundplay(global.sndUnPush);
     }
if (timer==301)
    {
    global.handle = SS_LoadSound("MentalMachine.ogg");
    SS_LoopSound(global.handle);
    }
if (timer==304)
    {objectfg.flashlight=0;}
//

if (timer==420)
     {
     objectfg.flashlight=-1;
     i=instance_create(objtdr.x-32,objtdr.y-96,objdollbot);
     i.ground=ground;
     soundplay(global.sndUnPush);
     }
if (timer==424)
    {objectfg.flashlight=0;
    phase=15;
    }
}
__b__ = action_if(phase==15);
if __b__
{
//HANDLE LOOPING OF MENTAL MACHINE
if(SS_GetSoundPosition(global.handle)>SS_GetSoundLength(global.handle)*96.48/103.415)
    SS_SetSoundPosition(global.handle,SS_GetSoundLength(global.handle)*14.196/103.415)
//ATTN. GIRLS!! Go to another phase as soon as the music stops/fades!
}
__b__ = action_if(phase==16);
if __b__
{
{
with mydoor
    {
    progsp=0;
    closesp=-0.5;
    soundplay(global.sndRedWave);
    }
    
instance_create(objElevator.x,objElevator.y,supergenerator);
action_kill_object();
}
}
}
}
__b__ = action_if(phase==7 && instance_exists(objPipeFollower));
if __b__
{

//Check point
if (objPipeFollower.x>x+360)
    {
    x=objPipeInit.x+1024;
    y=objLava.y;
    with all
        {//Exceptions to destruction
        if (object_index==objectfg || object_index==controlbg 
         || object_index==objPipe || object_index==objPipeInit
         ||object_index==objPipeFollower || object_index==objLava
         || object_index==objLavaBlob || object_index==objLavaWave
         || object_index==objLavaGirder || object_index==objStatic)
            {
            x-=other.x;
            y-=other.y;
            }
        else
            {
            if (id!=other.id)
                instance_destroy();
            }
        }
    objPipeFollower.xx-=x;
    objPipeFollower.yy-=y;
    objPipeFollower.xpp-=x;
    objPipeFollower.ypp-=y;
    objPipeFollower.xprevious-=x;
    objPipeFollower.yprevious-=y;
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (x) );
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (y) );
    x=0;
    y=0;
    
    i=instance_create(x,y+32,objlavarockbg);
    i.x2=x+5760;//only add multiples of 64
    
    
    i=instance_create(x,y,rockline);
    y-=384;
    i.x2=x; i.y2=y;
    
    i=instance_create(x,y,rockline);
    x+=480;
    i.x2=x; i.y2=y;
    rr=128;
    for(a=0; a<20; a+=1)
        {
        i=instance_create(x+rr+rr*cos(pi*a/20),y-rr*sin(pi*a/20),rockline);
        i.x2=x+rr+rr*cos(pi*(a+1)/20); 
        i.y2=y-rr*sin(pi*(a+1)/20);
        }
    x+=rr*2;
    i=instance_create(x,y,rockline);
    y+=64;
    i.x2=x; i.y2=y;
    
    i=instance_create(x-24,objLava.y-16,objFloater);
    i.special=1;

    i=instance_create(x,y,rockline);
    x+=64;
    i.x2=x; i.y2=y;    
    i=instance_create(x,y,rockline);
    y-=1280;            //OMG!
    i.x2=x; i.y2=y;
    remX=x; remY=y;
    
    yy=objLava.y-32;
    xx=x+128;
    
    instance_create(xx+40,yy-64,objring);
    instance_create(xx+60,yy-64,objring);
    instance_create(xx+80,yy-64,objring);
    instance_create(xx+100,yy-64,objring);
    
    len=384;
    event_user(2);
    i=instance_create(xx+len-32,0,objLavaFall);
    
    xx+=len+128;
    len=256;
    event_user(2);
    
    j=instance_create(xx+80,yy,objPushSwitch);
    tutSwitch=j;
    xx+=384;
    
    i=instance_create(xx,yy-256,objLavaWheel);
    i.length=256;
    i.dependency=j;
    i.rotsp=-0.5;
    
    xx+=128;
    i=instance_create(xx,yy+32,rockline);
    i.x2=i.x;
    i.y2=yy-192;
    
    i=instance_create(xx,yy-192,rockline);
    i.x2=i.x+64;
    i.y2=i.y;
    
    i=instance_create(xx+64,yy-192,rockline);
    i.x2=i.x;
    i.y2=yy+32;
    
    i=instance_create(xx,yy-192,greatbrown);
    i.x2=xx+64;
    i.y2=yy+32;
    i.depth=1;
    i.c3=c_black;
    i.c4=c_black;
    
    xx+=64;
    makeRazer(xx+32,yy-96,1,4);
    
    xx+=224;        //STOPPER BLOCK
    len=128;
    hh=512;
    i=instance_create(xx,yy-96,rockline);
    i.x2=xx+len
    i.y2=i.y;
    i=instance_create(xx,yy-96-hh,rockline);
    i.x2=xx+len
    i.y2=i.y; 
    i.ydeep=yy-96;
    i.depth+=1;
    
    i=instance_create(xx,yy-96,rockline);
    i.x2=i.x
    i.y2=i.y-hh;
    i=instance_create(xx+len,yy-96,rockline);
    i.x2=i.x
    i.y2=i.y-hh;
    
    
    //make some jumping blobs here??
    
    //RISE, PREPARE FOR PIPE
    hh=136;
    
    
    xx+=128;
    i=instance_create(xx,yy+32,rockline); i.ydeep=objLava.y;
    i.x2=i.x+160;
    i.y2=i.y-32;
    xx+=160;
    i=instance_create(xx,yy,rockline); i.ydeep=objLava.y;
    i.x2=i.x+96;
    i.y2=i.y-64;
    xx+=96;
    i=instance_create(xx,yy-64,rockline); i.ydeep=objLava.y;
    i.x2=i.x+192;
    i.y2=i.y-64;
    xx+=192;
    i=instance_create(xx,yy-128,rockline); i.ydeep=objLava.y;
    i.x2=i.x+96;
    i.y2=i.y+4;    
    i=instance_create(xx+48,yy-126,objbouncer); //BOUNCER
    i.image_angle=90-4;
    i.amount=13;
    xx+=96;
    i=instance_create(xx,yy-124,rockline); i.ydeep=objLava.y;
    i.x2=i.x+32;
    i.y2=yy-320;
    xx+=32;
    i=instance_create(xx,yy-320,rockline); i.ydeep=objLava.y-hh;
    i.depth+=1;//T'was ugly
    i.x2=i.x+480;
    i.y2=i.y;
    
        len=256;
    event_user(2);

    
    j=instance_create(xx+128,yy,objPushSwitch);
    
    i=instance_create(xx+len+16,yy-32,objdoormaker3);   //DOOOOOOOR
    i.dependency=j;
    
    i=instance_create(xx,objLava.y-hh,rockline);
    i.y2=objLava.y;
    i.x2=i.x;
    i=instance_create(xx,objLava.y-hh,rockline);
    i.y2=i.y;
    i.x2=xx+480+64;
    
    xx+=480;
    
    i=instance_create(xx-32,yy-320-32,objPipeInit);//PIPE HERE
    with i makePipe2();
    //UP UP UP
    i=instance_create(xx,yy-320,rockline);
    i.x2=i.x;
    i.y2=yy-480;
    i=instance_create(xx,yy-480,rockline);
    i.x2=remX;
    i.y2=remY;
    
    i=instance_create(xx,yy-192,greatbrown);
    i.x2=xx+64;
    i.y2=objLava.y-hh;
    i.depth=-1;
    i.c3=c_black;
    i.c4=c_black;
    xx+=64;
    //other side UP UP UP
    i=instance_create(xx,objLava.y-hh,rockline);
    i.y2=objLava.y-2560;
    i.x2=i.x;
    remX=i.x2;
    remY=i.y2;
    
    xx+=640;
    
    phase=8;
    }
}
