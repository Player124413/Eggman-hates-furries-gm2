x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index+=-image_speed*(1-global.time);

dist=point_distance(x,y,sonic.x,sonic.y);

a1.hspeed=hspeed;
a1.vspeed=vspeed;
a2.hspeed=hspeed;
a2.vspeed=vspeed;
a3.hspeed=hspeed;
a3.vspeed=vspeed;
a4.hspeed=hspeed;
a4.vspeed=vspeed;
var __b__;
__b__ = action_if(grav);
if __b__
{
var rados,c,e;

if(true || dist>192 || phase<2)
{
rados=radius+point_distance(x,y,movingsector.x,movingsector.y);
e=power(abs(sonic.speed*sin(degtorad(point_direction(x,y,sonic.x,sonic.y)-sonic.direction))/8),1.8);
c=(1+e+power(max(0,(point_distance(x,y,sonic.x,sonic.y)-rados)/48),2)) *global.grav/global.meter*global.time;
with (sonic)
    {
    dir=point_direction(x,y,other.x,other.y);
    motion_add(dir,c);
    sonic.flyRight=dir+90;
    }
}   
gravitate(objfallring,2);
gravitate(objFlashG2,2);
}
__b__ = action_if(i1!=-1);
if __b__
{
i1.x=x;
i1.y=y;
i1.hspeed=hspeed;
i1.vspeed=vspeed;
}
__b__ = action_if(phase==0);
if __b__
{
timer+=global.time;



if (dist<128)
    {
    event_user(0);
    }
    
    
if (timer mod (42+life*5) == 0)
    {
    outer[count mod 4].phase=1;
    outer[count mod 4].atk=count mod 3;
    count+=1;
    if (count>=12)
        count-=12;
    }
}
__b__ = action_if(phase==1);
if __b__
{
timer+=global.time;


if (timer>180)
    {phase=2;
    with (objFinalOuter)
        phase=4;
    soundplay(global.sndExtend);
    timer=0;}
}
__b__ = action_if(phase==2);
if __b__
{
timer+=global.time;

if (open<50)
    open+=global.time*50/90;
    
if (dist<48)
    {
    event_user(0);//I'm going to assume this is hitting the center during 1st 2 phases
    }
    
if (invulnerable>0 && invulnerable<=35)
    image_angle+=0.75*global.time;
if (invulnerable==0)
    sonic.able=1;
    
}
__b__ = action_if(phase==3);
if __b__
{
timer+=global.time;

if (instance_exists(objDoomRack))
    {
    lastlazor=0;
    lazor=0;
    }

if (open>10)
    open-=global.time*50/90;

if (timer>76 && open>6)
    open-=global.time*5/9;

if (timer==80 || timer==86)
    soundplay(global.sndArmChange);
if (timer==84)
    soundplay(global.sndElevatorSetup);
if ((timer>=80 && timer<84) || (timer>=86 && timer<90))
    image_angle-=global.time;
    
if (timer>20 && timer<90)
    sonic.speed=sonic.speed/1.03;

if (timer==40)
    {
    with (objFinalOuter)
        phase=3;
    soundplay(global.sndDoorClose);
    }
    
if (timer<90 && timer mod 4 == 0)
    {
    soundplay(global.sndGunstar1);
    instance_create(x-192+random(384),y-192+random(384),objmedexp);
    }

if (timer==90)
    {
    sonic.flyRight=0;
    sonic.specialStopCase=0;
    global.handle=SS_LoadSound("MetalScratchin2.ogg");
    sonic.able=1;
    falling=1;
    
    nxx=x-128;
    nyy=y+1600;
    i=instance_create(nxx,nyy,rockline);
    nyy-=800;
    i.x2=nxx;
    i.y2=nyy;
    i.depth-=1;
    i=instance_create(nxx,nyy,rockline);
    nxx+=1024;
    nyy+=480;
    i.ydeep=nyy+800;
    i.x2=nxx;
    i.y2=nyy;
    }
if (timer>90 && camtimer>0.33)
    camtimer-=global.time/90;

if (timer>90)
    sonic.hspeed=sonic.hspeed/1.05;
if (gnd>0)
    {
    with objFinalOuter
        {
        with i1
            instance_destroy();
        i1=-1;
        }
        
    repeat(8)
        {
        i=instance_create(x-nx*radius,y-ny*radius,objspark);
        i.hspeed+=hspeed*2+nx*speed*2;
        i.vspeed+=vspeed*2+ny*speed*2;
        i.depth=-9;
        }
    i=instance_create(nxx,nyy,rockline);
    nxx+=1024;
    nyy+=512;
    i.ydeep=nyy+800;
    i.x2=nxx;
    i.y2=nyy;
    soundloop(global.sndMetalScrape);
    
    open=0;
    rotsp=-radtodeg(speed/radius)/3;
    phase=4;
    soundplay(global.sndClank);
    x+=nx*4;
    y+=ny*4;
    hspeed=hspeed+nx*6;
    vspeed=vspeed+ny*6;
    global.time=0.1;
    gnd=0;
    timer=0;
    }
}
__b__ = action_if(phase==4);
if __b__
{
timer+=global.time;
soundvolume(global.sndMetalScrape,0.9-min(0.9,power(timer/90,2)));
if (random(24)<1)
    {
    i=instance_create(x-192+random(384),y-192+random(384),objsmexp);
    i.depth=-7;
    }

if (gnd>0)
    {
    repeat(8)
        {
        i=instance_create(x-nx*radius,y-ny*radius,objspark);
        i.hspeed+=hspeed*2+nx*speed*2;
        i.vspeed+=vspeed*2+ny*speed*2;
        i.depth=-9;
        }
    rotsp=-radtodeg(speed/radius)*2/3;
    phase=5;
    timer=0;
    count=0;//!
    soundplay(global.sndClank);
    x+=nx*3;
    y+=ny*3;
    vspeed=vspeed*sonic.hspeed/hspeed+ny*4;
    hspeed=sonic.hspeed+nx*4;
    global.time=0.5;
    gnd=0;
    soundloop(global.handle);
    }
    
if (dist<192+16)
    {
    sonic.damaged=1;
    sonic.damagex=x;
    sonic.damagey=y;
    }
    
if (sonic.x<x-16)
    game_over();// I won't have it!
}
__b__ = action_if(phase==5);
if __b__
{
if (gnd>0)
    {
    timer=0;
    if (count>25)
        {hspeed=(hspeed*49+40)/50;
        sonic.hspeed+=0.1;}
    else
        {speed=(speed*49+max(lastspeed-1,sonic.speed+2))/50;
        speed+=power((sonic.x-160-x)/800,2);}
    
    rotsp=-radtodeg(speed/radius);
    
    if(lastgnd==0)
        {
        repeat(8)
            {
            i=instance_create(x-nx*radius,y-ny*radius,objspark);
            i.hspeed+=hspeed*2+nx*speed*2;
            i.vspeed+=vspeed*2+ny*speed*2;
            i.depth=-9;
            }
        soundplay(global.sndClank);
        if (abs(lastdirection-direction)>6)
            {x+=nx*4;
            y+=ny*4;
            hspeed=hspeed+nx*2;
            vspeed=vspeed+ny*2;
            gnd=0;}
        }

    }
else
    {
    timer+=global.time;
    }
soundvolume(global.sndMetalScrape,0.9-min(0.9,power(timer/30,2)));

lastdirection=direction;
lastspeed=speed;

if (sonic.x>nxx-640)
    {
    if (count==0)
        {
        instance_create(nxx,nyy-16,objring);
        }
    if(count>4 && count<20)
        {
        if (count mod 4==2)
            instance_create(640,416,objRockWarning);
        if (count mod 4==3)
            instance_create(nxx,nyy-12,objRoxxorz);
        }
    //

    if (count==27)
        {//Go down and make girder
        timer=0;
        count=-1;//1 is added later down... :(
        phase=6;
        }
    else if (count==25 || count==26)
        {//Ahead
        i=instance_create(nxx,nyy,rockline);
        nxx+=1600;
        nyy+=32;
        i.ydeep=nyy+800;
        i.x2=nxx;
        i.y2=nyy;
        sonic.able=0;//Happens twice for easy debugging
        sonic.lockMovement=1;
        }
    else if (count==24)
        {//JUMP
        i=instance_create(nxx,nyy,rockline);
        nxx+=128;
        nyy+=48;
        i.ydeep=nyy+800;
        i.x2=nxx;
        i.y2=nyy;
        i=instance_create(nxx,nyy,rockline);
        nxx+=128;
        nyy+=16;
        i.ydeep=nyy+800;
        i.x2=nxx;
        i.y2=nyy;
        
        i=instance_create(nxx,nyy,rockline);
        nxx+=128;
        nyy+=8;
        i.ydeep=nyy+800;
        i.x2=nxx;
        i.y2=nyy;
        
        i=instance_create(nxx,nyy,rockline);
        nxx+=128;
        i.ydeep=nyy+800;
        i.x2=nxx;
        i.y2=nyy;

        
        i=instance_create(nxx,nyy,rockline);
        nxx+=128;
        nyy-=12;
        i.ydeep=nyy+800;
        i.x2=nxx;
        i.y2=nyy;

        i=instance_create(nxx,nyy,rockline);
        nxx+=128;
        nyy-=32;
        i.ydeep=nyy+800;
        i.x2=nxx;
        i.y2=nyy;
        
        i=instance_create(nxx,nyy,rockline);
        nxx+=64;
        nyy+=32;
        i.ydeep=nyy+800;
        i.x2=nxx;
        i.y2=nyy;

        
        i=instance_create(nxx,nyy,rockline);
        nyy+=1280;
        i.x2=nxx;
        i.y2=nyy;
        
        yMax=nyy-240;
        nxx+=1280;
        
        i=instance_create(nxx,nyy,rockline);
        nyy-=1366;
        i.x2=nxx;
        i.y2=nyy;
        i.depth-=1;
        i=instance_create(nxx,nyy,rockline);
        nxx+=1366;
        nyy+=24;
        i.ydeep=nyy+800;
        i.x2=nxx;
        i.y2=nyy;
        }
    else if (count<28)
        {//NORMAL SLOPES:
        i=instance_create(nxx,nyy,rockline);
        nxx+=1024;
        nyy+=320+random(32)*(4-(count mod 4));
        i.ydeep=nyy+800;
        i.x2=nxx;
        i.y2=nyy;
        }
    with rockline
        {if(x<view_xview-2560)
        instance_destroy();}
    with line
        {if(x<view_xview-2560)
        instance_destroy();}
    count+=1;
    }

if (dist<192+16)
    {
    sonic.damaged=1;
    sonic.damagex=x;
    sonic.damagey=y;
    }
    
if (sonic.x<x-16)
    game_over();// I won't have it!
else if(count==24+1 && sonic.y>yMax)
    game_over();// I won't have it!


}
__b__ = action_if(phase==6);
if __b__
{
if (count==0)
    {    
    soundvolume(global.sndMetalScrape,0.9-min(0.9,power(timer/90,2)));
    hspeed=(hspeed*49+40)/50;
    }
if (timer==0)
        {
        instance_create(0,nyy,objDarkDepths);
        
        yMax=0;
        i=instance_create(nxx,nyy,rockline);
        i.ydeep=nyy+1600;
        i.x2=nxx+800;
        i.y2=nyy+800;
        
        j=instance_create(nxx,nyy,line);
        for(a=0; a<20; a+=1)//FIRST
            {
            if (a mod 5 == 4)
                {
                for(b=0; b<8; b+=1)
                    {
                    i=instance_create(nxx,nyy-b*64,objLavaGirder);
                    i.sprite_index=sprDoomGirder;
                    i.image_angle=90;
                    i.depth=3;
                    }
                }
            i=instance_create(nxx,nyy,static);
            i.sprite_index=sprBridgeGirder;
            nxx+=64;
            }
        j.x2=nxx;
        j.y2=nyy;
        
        j=instance_create(nxx,nyy,line);
        for(a=0; a<12; a+=1)//SECOND
            {
            i=instance_create(nxx,nyy,static);
            i.x0=j.x;
            i.y0=j.y;
            i.dist=a*64;
            i.special=1;
            i.sprite_index=sprBridgeGirder;
            nxx+=64;
            }
        j.x2=nxx;
        j.y2=nyy;
        myLine=j;
        
        c=nxx;
        for(a=0; a<10; a+=1)//THIRD
            {
            if (a mod 5 == 4)
                {
                for(b=0; b<8; b+=1)
                    {
                    i=instance_create(nxx,nyy-b*64,objLavaGirder);
                    i.sprite_index=sprDoomGirder;
                    i.image_angle=90;
                    i.depth=3;
                    }
                }
            j=instance_create(nxx,nyy,line);
            i=instance_create(nxx,nyy,static);
            i.sprite_index=sprBridgeGirder;
            nxx+=64;
            j.x2=nxx;
            j.y2=nyy;
            }
        
        i=instance_create(nxx,nyy,line);
        i.x2=nxx;
        i.y2=nyy-32;
        i=instance_create(nxx,nyy,static);
        i.sprite_index=sprBridgeEnd;
        global.tempRingsAllowed=1;
        instance_create(nxx-32,nyy-16,objring);
        global.tempRingsAllowed=0;
        nxx=c;
    }
////////////////////////////////////////////////
timer+=global.time;

if(count<2)
{
if(x>myLine.x)
    {
    //speed=speed/1.02;
    if(count==0)
        {
        SS_StopSound(global.handle);
        SS_FreeSound(global.handle);
        global.time=0.1;
        sonic.lockMovement=-1;
        soundplay(global.sndCrush);
        soundplay(global.sndMetal1);
        repeat(24)
            {
            i=instance_create(nxx,nyy+random(32),objspark);
            i.vspeed=i.vspeed*3;
            }
        count=1;}
    lineDir+=lineDirsp*global.time;
    lineDirsp-=lengthdir_x(global.grav/global.meter*global.time,lineDir)/3.4;
        
    with (static)
        {
        if(special)
            {
            x=other.myLine.x+lengthdir_x(dist,other.lineDir);
            y=other.myLine.y+lengthdir_y(dist,other.lineDir);
            image_angle=other.lineDir;
            }
        }
    with myLine
        {
        l=12*64;
        x2=x+lengthdir_x(l,other.lineDir);
        y2=y+lengthdir_y(l,other.lineDir);
        event_perform(ev_alarm,0);
        }
    if (lineDir<-30)
        {
        count=2;
        with myLine
            instance_destroy();
        with (static)
            {if(special || x<view_xview)
                instance_destroy();}
        with (rockline)
            instance_destroy();
        with (line)
            {if(x<view_xview)
                instance_destroy();}
        }
    }
}

if (x>nxx-192 && hspeed>0)
    {
    if(yMax>0 && random(12)<1)
        {
        i=instance_create(x-192+random(384),y-192+random(384),objsmexp);
        i.depth=-7;
        }
        
    
    hspeed-=global.time*0.1;
    if(falling)
        {soundloop(global.sndMetalScrape);
        soundvolume(global.sndMetalScrape,1);
        soundplay(global.sndBreakDown);
        y+=6;
        vspeed=vspeed/4;}
    //
    falling=0;
    with instance_nearest(x,y,line)
        {if (other.x>=x-192)
            instance_destroy();
        }
    with instance_nearest(x,y,static)
        {
        repeat(3)
            {i=instance_create(other.x+192,y,objspark);
            i.hspeed+=other.hspeed; i.depth=-6;}
        
        if (other.x>=x-192+64)
            {
            
            with objBridgeCut
                instance_destroy();
            i=instance_create(x+64,y,objBridgeCut);
            other.rotsp=other.rotsp/1.25;
            other.x+=other.hspeed/4+4;
            other.hspeed=30-other.yMax*5;
            other.vspeed=max(-2,min(2,(y-other.y)*other.hspeed/128));
            if (other.yMax mod 3 == 0)
                instance_create(0,0,objFinalCrack);
            if(other.yMax<6)
                {
                other.open+=1;
                c=floor(random(3));
                if (c==0) soundplay(global.sndMetal1);
                if (c==1) soundplay(global.sndMetal2);
                if (c==2) soundplay(global.sndMetal3);
                i=instance_create(x+32,y,objbigexp);
                i.depth=-6;
                }
            repeat(2)
                {
                i=instance_create(x+random(64),y,objdebris);
                i.sprite_index=sprlaserdebris;
                i.image_single=random(i.image_number);
                i.hspeed+=other.hspeed/2;
                i.vspeed-=2;
                }
            soundplay(global.sndCrush);
            instance_destroy();
            other.yMax+=1;
            }
        }
    }
    
if (sonic.hspeed<-1)
    sonic.lockMovement=0;
if (hspeed==0)
    {
    vspeed=0;
    if (count==2)
        {
        with instance_nearest(x,y,objLavaGirder)
            sprite_index=sprDoomGirderEnd;
        global.time=0.5;
        rotsp=0;
        soundplay(global.sndClank);
        soundstop(global.sndMetalScrape);
        }
    count+=global.time;
    if (count==60)
        {
        global.handle=SS_LoadSound("Library.ogg");
        with objDoomRack
            {event_user(0);
            spd=2;}
        soundplay(global.sndExtend);
        with (objFinalOuter)
            phase=4;
        }
    if (count>60)
        {
        if (open<45)
            {open+=global.time*50/90;
            if (open>=45)
                {soundstop(global.sndExtend);
                soundplay(global.sndMetal1);}
            }
        }
    if (count==90)
        {soundplay(global.sndElevatorStop);
        i=instance_create(x-24,y+24,objAirOut);
        i.image_angle=225;
        i.depth=-4;
        }
    if (count==100)
        {soundplay(global.sndElevatorStop);
        i=instance_create(x+24,y+24,objAirOut);
        i.image_angle=315;
        i.depth=-4;
        }
    if (count==130)
        {soundplay(global.sndElevatorSetup);
        objEggMid.fixed=0;
        objEggMid.vsp=0.5;
        }
    if (count==150)
        {soundplay(global.sndElevator);
        objEggMid.vspeed=-1;
        objEggMid.phase=1;
        phase=7;
        }
    }
sonic.able=0;
}
lastgnd=gnd;
if (gnd>0)
    gnd-=1;
blink=!blink;
