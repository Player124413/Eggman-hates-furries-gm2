action_set_relative(1);

soundvolume(global.sndRobot,1-min(1,power(point_distance(x,y,sonic.x,sonic.y)/512,4)));

if(gnd==2)
    {if (uy<0)
        {ux=-ux;
        uy=-uy;}

if(damaged==0&&atk>-3)
    image_angle=point_direction(0,0,ux,uy);
    
    a=floor(random(3));
    if (a==0)
    soundplay(global.sndMetal1);
    else if (a==1)
    soundplay(global.sndMetal2);
    else soundplay(global.sndMetal3);
    repeat(40)
        {
        i=instance_create(x-nx*radius+ux*random(40),y-ny*radius+uy*random(40),objspark);
        i.hspeed+=hspeed/2+nx*4;
        i.vspeed+=vspeed/2+ny*4;
        i.depth=-1;
        }
    if(damaged==0)
        speed=speed/1.02;
    hspeed+=nx*(0.67+random(0.33))*speed/12;
    vspeed+=ny*(0.67+random(0.33))*speed/12;
    }

if(gnd>0)
gnd-=1;

if (boost==1 && lastboost!=1)
    soundplay(global.sndAfterBurner);
if (boost!=1 && lastboost==1)
    {soundplay(global.sndAfterBurnerStop);
    soundstop(global.sndAfterBurner);}
lastboost=boost;

eightstage+=global.time;
if (eightstage>=8)
eightstage=0;

if (eightstage==0 && random(30)<1 && leye==0)
    {if(random(2)<1) soundplay(global.sndElectric1); else soundplay(global.sndElectric2);
    i=instance_create(lgx+hspeed-16+random(32),lgy+vspeed-16+random(32),objelectric);
    i.hspeed=hspeed;
    i.vspeed=vspeed;}
if (eightstage==4 && random(30)<1 && reye==0)
    {if(random(2)<1) soundplay(global.sndElectric1); else soundplay(global.sndElectric2);
    i=instance_create(rgx+hspeed-16+random(32),rgy+vspeed-16+random(32),objelectric);
    i.hspeed=hspeed;
    i.vspeed=vspeed;}
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index += -image_speed*(1-global.time);
if lastfaps!=faps || lastbaps!=baps
    soundplay(global.sndArmChange);
lastbaps=baps;
lastfaps=faps;

if(faps==0)
    {gps1=image_angle+225+90;
    gps2=image_angle-90;
    gms1=image_angle-225-90;
    gms2=image_angle+90;}
if(faps==1)
    {gps1=image_angle+0;
    gps2=image_angle-45;
    gms1=image_angle+0;
    gms2=image_angle+45;}
if(faps==2)//left clock
    {gps1=image_angle+60;
    gps2=image_angle;
    gms1=image_angle+0;
    gms2=image_angle+45;}
if(faps==3)//right
    {gps1=image_angle+0;
    gps2=image_angle-45;
    gms1=image_angle-60;
    gms2=image_angle+0;}
if(faps==4)//back(for cannon)
    {gps1=image_angle+225;
    gps2=image_angle+45;
    gms1=image_angle-225;
    gms2=image_angle-45;}
if(faps==5)//right arm
    {gps1=image_angle+225;
    gps2=image_angle;
    gms1=image_angle+13;
    gms2=image_angle+60;}
            //AFGSNRIGHETJGOWREGU
if(baps==0)
    {
    gph1=image_angle+225+45;
    gph2=image_angle+45;
    
    gmh1=image_angle-225-45;
    gmh2=image_angle-45;
    }

if(baps==1)
    {
    gph1=image_angle+0;
    gph2=image_angle-45;
    gmh1=image_angle+0;
    gmh2=image_angle+45;
    }
if(baps==2)//bogus plus
    {
    gph1=image_angle+60;
    gph2=image_angle+0;
    gmh1=image_angle+0;
    gmh2=image_angle+45;
    }
if(baps==3)//bogus minus
    {
    gph1=image_angle+0;
    gph2=image_angle-45;
    gmh1=image_angle-60;
    gmh2=image_angle+0;
    }
if(baps==4)//protect(for cannon)
    {gph1=image_angle+225;
    gph2=image_angle+45;
    gmh1=image_angle-225;
    gmh2=image_angle-45;}

robot_turn_arms();


lgx=x+lengthdir_x(70,image_angle+28);
lgy=y+lengthdir_y(70,image_angle+28);

rgx=x+lengthdir_x(70,image_angle-28);
rgy=y+lengthdir_y(70,image_angle-28);

var __b__;
__b__ = action_if(phase==1);
if __b__
{
var a,b,c;
if(instance_exists(sonic))
if (point_distance(x,y,sonic.x,sonic.y)>1280)
    game_over();

if(destroyed!=3)
    {__view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*13+x-320)/14 );
    __view_set( e__VW.YView, 0, (__view_get( e__VW.YView, 0 )*13+y-240)/14 );}
else
    {__view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*13+(x-320)/damaged)/(13+1/damaged) );
    __view_set( e__VW.YView, 0, (__view_get( e__VW.YView, 0 )*13+(y-240)/damaged)/(13+1/damaged) );}

if(atk==-1)
    {advance=0;
    robot_boost_sonic();}
    
if(atk==-3)
    {robotrecover();}
    
if(atk==0)
    robotspam();
if(atk==1)
    robotcut();
if(atk==2)
    robotcannon();

if(atk==3)
    robotspam2();
if(atk==4)
    robotsupersaw();
if(atk==5)
    robotfinal();

timer+=global.time;



if (y>nny-1280)
{
if(atk==-1)
    {timer=0;
    counter+=1;
    sparetimer=0;

    if (counter>=4)
        counter=0;
        
    if(counter==0 || counter==2)
        atk=0+sequence*3;
    else if (counter==1)
        atk=1+sequence*3;
    else
        atk=2+sequence*2;
    
    if(ms==0&&ph==0&&mh==0&&atk==4)
        atk=5;
    if (atk==0 && leye==0 && reye==0)
        {
            for(a=-112; a<=112 a+=32)
        instance_create(nnx+a,y+480,objring);
            for(a=-112; a<=112 a+=32)
        instance_create(nnx+a,y+640,objring);
        }
    
    }

b=2560;

if(counter==0)
    a=1024;
else if(counter==2)
    a=-1024;
else
    a=0;
if (atk==1)
    {b=1280;
    a=800*sin((timer+200)*pi/500)}

i=instance_create(nnx+128,nny,metaside);
i.x2=i.x+a;
i.y2=i.y+b;

i=instance_create(nnx-128,nny,metaside);
i.x2=i.x+a;
i.y2=i.y+b;
i.deep=-2560;

with (metaside)
    {
    if (y2<sonic.y-480)
        instance_destroy();
    }

lastnnx=nnx;
lastnny=nny;
nnx+=a;
nny+=b;
}
}
__b__ = action_if(phase==0);
if __b__
{
timer+=global.time;

__view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*(13)+(x-320)*min(1,timer/90))/(13+min(1,timer/90)) );
__view_set( e__VW.YView, 0, (__view_get( e__VW.YView, 0 )*(13)+(y-240)*min(1,timer/90))/(13+min(1,timer/90)) );

if (timer==23)
    {objtails1.sprite_index=stailscared;
    soundplay(global.sndBreakDownBuffer);
    objectfg.flashlight=0.9;}
if (timer==46)
    {soundplay(global.sndBreakDown);
    objectfg.flashlight=0.8;}
//lol

if (timer<=18)
    a=x-128+256*timer/18;
else if(timer<=36)
    a=x+128-256*(timer-18)/18;
else if(timer<=54)
    a=x-128+256*(timer-36)/18;
else if(timer<=72)
    a=x+128-256*(timer-54)/18;
//lol
if(timer<=72)
    {i=instance_create(a-32+random(64),y+96+random(64),objmedexp);
    i.vspeed=random(32);}

if (timer==100)
    {objtails1.sprite_index=stailrun;
    objtails1.phase=2;
    audio_play_sound(OrSmovrBos, 10, true);}
    
if (timer==120)
    {
    instance_create(x-112,y+640,objring);
    instance_create(x-112,y+680,objring);
    instance_create(x-112,y+720,objring);
    
    sonic.able=1;
    with (objtails1)
        instance_destroy();
    {phase=1;
    timer=0;}
    }
robot_boost_sonic();
}
if (y>12800)
    {
    with (all)
        y-=12800;
    with (line)
        {y2-=12800;
        yi-=12800;
        ya-=12800;}
    with movingline
        {y2-=12800;
        yi-=12800;
        ya-=12800;}
    with metaside
        {y2-=12800;
        yi-=12800;
        ya-=12800;}
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (12800) );
    nny-=12800;
    lastnny-=12800;
    }
var fake,a;
if (damaged==1)
    {
    dangerousBlades=0;
    
    fake=1;
    if (destroyed>=3)
        {
        fake=0;
        }
        
    if (sequence==1 && destroyed < 3)
        {
        controlbg.lev=3;//! checkpoint
        fake=0; destroyed=2;
        }
    
    if((reye or leye)&&destroyed<3)
        {
        if(sonic.x<x && reye)
            {fake=0; reye=0; destroyed=1;}
        if(sonic.x>x && leye)
            {fake=0; leye=0; destroyed=0;}
        }
    if(fake==0)
        {
        bosul4.on=0; bosul5.on=0; bosul6.on=0;
        damaged=2;
        atk=-2;
        soundstop(global.sndCharge);
        chargeur=0;
        plat_tip=0;
        soundplay(global.sndCrash);
        motion_add(point_direction(sonic.x,sonic.y,x,y),8);
        }
    else
        {
        with (sonic)motion_add(point_direction(other.x,other.y,x,y),8);
        soundplay(global.sndBlth);
        damaged=0;
        }
    }
    
if (damaged>1)
    {
    if (platform>0)
    platform-=0.2*global.time;
    
    boost=-1;
    vspeed+=0.2*global.time;
    
    if (destroyed==3)
        {advance=0;
        robot_boost_sonic();}
    faps=-1;
    baps=-1;
    rotsp=min(damaged/5,45);
    gps1=image_angle+135;
    gps2=image_angle+45;
    gms1=image_angle-135;
    gms2=image_angle-45;
    gph1=image_angle+45;
    gph2=image_angle+225;
    gmh1=image_angle-45;
    gmh2=image_angle-225;

    visible=1-visible;
    
    image_angle+=30*global.time;//extends to recovery
    damaged+=2*global.time;
    atk=-2;
    a=1;
    if (eightstage mod 4==0)
        {soundstop(global.sndGunstar1);
        soundplay(global.sndGunstar1);
        if(destroyed==0)
            {destroyx=lgx;
            destroyy=lgy;}
        if(destroyed==1)
            {destroyx=rgx;
            destroyy=rgy;}
        if(destroyed==2)
            {destroyx=x+hspeed*random(3);
            destroyy=y+vspeed*random(3);}
        //ARMS
        if(destroyed==3)
            {a=4;
            bosuc.on=0; bosul1.on=0; bosul2.on=0; bosul3.on=0; bosul4.on=0; bosul5.on=0; bosul6.on=0;
            destroyx=x-64+random(128);
            destroyy=y-64+random(128);}
        if(destroyed==4)
            {destroyx=msx0;
            destroyy=msy0;}
        if(destroyed==5)
            {destroyx=phx0;
            destroyy=phy0;}
        if(destroyed==6)
            {destroyx=mhx0;
            destroyy=mhy0;}
            
        repeat(a)
            {
            i=instance_create(destroyx+hspeed,destroyy+vspeed,objmedexp);
            i.hspeed=hspeed/1.2;
            i.vspeed=vspeed/1.2;
            }
        }
    
    if (ps&&((y>sonic.y-320 && (damaged>70+40*sequence) && vspeed>sonic.vspeed) || y<sonic.y-240-480))
        {damaged=0;
        atk=-3;
        timer=0;
        visible=1;
        destroyed=-1;
        rotsp=1;
        if(y<sonic.y-240-480)
            image_angle=270;
        platform=0;
        bosul4.on=1; 
        bosul5.on=1; 
        bosul6.on=1;}
    
    if (damaged==540 && ps==0)
        {
        audio_stop_sound(OrSmovrBos);
        global.time=0.1;
        }
        
    if (damaged>600)
        {
        soundplay(global.sndGunstar2);
        instance_destroy();
        with(bosul1) instance_destroy();
        with(bosul2) instance_destroy();
        with(bosul3) instance_destroy();
        with(bosul4) instance_destroy();
        with(bosul5) instance_destroy();
        with(bosul5) instance_destroy();
        with(bosuc) instance_destroy();
        
        i=instance_create(x,y,objdebris);
        i.sprite_index=sprbooster;
        i.image_single=0;
        i.image_angle=image_angle;
        i.rotation=30;
        i.vspeed=vspeed-2;
        i.hspeed=2;
        i.exploding=1/40;
        
        i=instance_create(x,y,objdebris);
        i.sprite_index=spreye;
        i.image_single=4;
        i.vspeed=vspeed-2;
        i.hspeed=-3;
        i.image_angle=image_angle;
        i.rotation=30;
        i.exploding=0;
        for(a=0; a<4; a+=1)
            {i=instance_create(x,y,objdebris);
            i.sprite_index=sprsocket;
            i.image_single=0;
            if(a<2) i.image_angle=image_angle-120+a*60;
            else    i.image_angle=image_angle-60+a*60;
            i.rotation=30;
            i.hspeed=-4+random(8);
            i.vspeed=vspeed-4;
            i.exploding=0;}
        i=instance_create(x,y,objcore1);
        i.depth=1;
        i.hspeed=hspeed+4;
        i.vspeed=vspeed+4;
        i.nnx=nnx;
        i.nny=nny;
        sonic.acc=remAcc;
        objectfg.flashlight=1;
        soundstop(global.sndRobot);
        }
        
    spawnKillTimer=30;        
    }
__b__ = action_if(vspeed<4);
if __b__
{
{
action_set_relative(0);
action_set_vspeed(4);
action_set_relative(1);
}
}
action_set_relative(0);
