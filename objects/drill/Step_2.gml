var __b__;
__b__ = action_if(phase==0);
if __b__
{
if(sonic.x>x-256)
    {
    soundloop(global.sndRobot);
    soundvolume(global.sndRobot,0);
    timer=0;
    phase=1;
    }
}
__b__ = action_if(phase==1);
if __b__
{
var m;
m=40;
if(subphs==0)
    {
    if (sp==0)
        {
        soundloop(global.sndQuake);
        with grassgenerator.drillLine
            {
            soundplay(global.sndCrush);
            y-=96;
            event_perform(ev_alarm,0);
            }
        }
    
    if (sp<m) sp+=global.time/2;
    if (x>xstart+512 && dir>-100)
        {
        dir-=global.time*5;
        }
    if (y>ystart+1280)
        {
        soundvolume(global.sndQuake,0);
        subphs=1;
        }
    else if(y>ystart+320)
        soundvolume(global.sndQuake,1-power(1-(ystart+1280-y)/960,2));
    }
if(subphs==1)
    {
    if(dir<0)
        dir+=global.time*20;
    else 
        {dir=0;
        if (sp>0) sp-=global.time;}
    if (((__view_get( e__VW.XView, 0 )+640>xx-80 && sonic.speed>10) || __view_get( e__VW.XView, 0 )+480>xx-80) && dir==0 && sonic.y>y-96)
        {
        audio_play_sound(game, 10, true);
        subphs=2;
        sp=max(0,sonic.speed-6);
        soundvolume(global.sndQuake,0.9);
        }
    }
if(subphs==2)
    {
    m=20;
    if (sp<m) sp+=global.time/2; 
    if (sp>m) sp-=global.time/2;
    if(abs(sp-m)<1) sp=m;
    if (sp==m)
        {
        phase=2;
        timer=-180;
        timer2=0;
        counter=0;
        subphs=0;
        i=instance_create(0,0,objassessment);
        i.txt="WEAK POINT# #Attack when#shields are down";
        }
    }

hspeed=lengthdir_x(sp,dir);
vspeed=lengthdir_y(sp,dir);

}
__b__ = action_if(phase==2);
if __b__
{
var m;
if(sonic.x<x-512)
    m=12;
else
    m=22;
if (sp>m)
    sp-=global.time/2;
if (sp<m)
    sp+=global.time/2;

timer+=global.time;
timer2+=global.time;
closeX=x-800;
hspeed=lengthdir_x(sp,dir);
vspeed=lengthdir_y(sp,dir);
if(timer>0)
{
if (timer mod 50 == 10 && sonic.x>xx-288 && destined==0 && invulnerable==0)
    {
    signal=0;
    destined=1;//down
    }
if (timer mod 50 == 30 && destined==1)
    {signal=1;
    soundplay(global.sndTargetConfirm);}

if (timer mod 50 == 40 && destined==1)
    {
    i=instance_create(mineX,mineY,objSmallMine);
    i.vspeed=4;
    i.targY=ry;
    destined=0;
    }
    
if (timer mod 200 == 50 && sonic.x>xx-288 && invulnerable==0)
    {
    signal=0;
    destined=2;//up
    }
if (timer mod 200 == 70 && destined==2)
    {signal=1;
    soundplay(global.sndTargetConfirm);}
if (timer mod 200 == 80 && destined==2)
    {
    i=instance_create(mineX,mineY,objSmallMine);
    i.image_yscale=-1;
    i.vspeed=-4;
    i.targY=ly;
    destined=0;
    }
}
    
if(timer==300 && layerExists)
    {
    soundplay(global.sndShieldFailure);
    shield=0;
    }
if (timer==390)
    {
    soundplay(global.sndShieldFailure);
    shieldWarn=1;
    }
    
if(timer==420)
    {
    if(layerExists)
        soundplay(global.sndForceBounce);
    shield=1;
    timer=0;
    if(invulnerable>0)
        {
        timer2=0;
        if(damageCounter==1)
            phase=4;
        if(damageCounter==2)
            phase=5;
        if(damageCounter==3)
            phase=6;

        subphs=0;
        destined=0;
        counter=0;
        }
    }
if (invulnerable<60)
dir=approach(dir,8,15*sin(timer2/50),1);

}
__b__ = action_if(phase==3);
if __b__
{
var m;
m=8;
closeX=x-800;
if (sp>m)
    sp-=global.time/4;
if (sp<m)
    sp+=global.time/4;

timer+=global.time;
if(abs(sp-m)>1)
    dir=approach(dir,8,0,1);
else
    {
    timer2+=global.time;
    if (timer2>30+150)
        dir=approach(dir,8,0,1);    
    else if (timer2<30)
        dir-=global.time*4.5;
    else if ((timer2-30) mod 120 <60)
        dir+=global.time*4.5;
    else
        dir-=global.time*4.5;
    }   

hspeed=lengthdir_x(sp,dir);
vspeed=lengthdir_y(sp,dir);
}
__b__ = action_if(phase==4);
if __b__
{
var m;
timer+=global.time;

if(subphs==0)
    {closeX=x-800;
    m=30;
    dir=approach(dir,12,0,1);
    if (sp>m)
        sp-=global.time/5;
    if (sp<m)
        sp+=global.time/5;
    
    if (sp>=m && sonic.x>x-440 && sonic.speed>=sp-1)
        {
        subphs=1;
        sp=m;
        timer2=0;
        remX=x;
        }
    }
else
    closeX+=global.time*8;

if(subphs==1)
    {
    precision=32;
    m=360/70;
    timer2+=global.time*(1+timer2/22);
    dir=timer2*m;
    sp-=global.time/10;
    
    if (dir>=360)
        {
        timer2=0;
        respawn=1;
        precision=128;
        timer2=0;
        subphs=2;
        dir=2;
        }
    }
if(subphs==2)
    {
    timer2+=global.time;
    dir=approach(dir,4,0,1);
    if(timer2>10)
        precision=48;
    
    if (x>remX+360)
        {
        if (sp>0) 
            {
            sp-=global.time/2;
            soundvolume(global.sndQuake,0.9*(1-power(1-min(1,sp/24),2)));
            }
        if (((__view_get( e__VW.XView, 0 )+640>xx-80 && sonic.speed>10) || __view_get( e__VW.XView, 0 )+480>xx-80) && sonic.y>y-96)
            {
            sp=max(0,sonic.speed-6);
            soundvolume(global.sndQuake,0.9);
            subphs=0;
            phase=2;
            timer=0;
            timer2=0;
            counter=0;
            destined=0;
            precision=48;
            }
        }
    }


hspeed=lengthdir_x(sp,dir);
vspeed=lengthdir_y(sp,dir);
}
__b__ = action_if(phase==5);
if __b__
{
var m;
timer+=global.time;

if(subphs<2)//closing
    closeX=x-800;
else
    {
    if(closeProggy<1 && subphs>2)
        {closeProggy+=global.time/120;
        with dLine
            {
            if(x2<other.remMX+80 && y<other.remUY+other.closeProggy*(other.remDY+80-other.remUY))
                forceClose=1;
            if(other.closeProggy>=1 && x2<other.remMX+80 && y2<other.remDY-480)
                validDeletion();
            }
        }
    else if(closeProggy<2 && subphs>5)
        {
        closeProggy+=global.time/120;
        with dLine
            {
            if((x>other.remRX-80 || y<other.remRY-800) && y<other.remRY-32-1280*(2-other.closeProggy))//cuz it's 1-2, not 0-1
                forceClose=1;
            if(other.closeProggy>=2 && y2<other.remDY-640)
                validDeletion();
            }
        }
    else if(closeProggy<3 && subphs>=7)
        {
        closeProggy+=global.time/240;
        with dLine
            {
            if(x<other.remRX+80 && y<other.remDY-640+1280*(other.closeProggy-2))
                forceClose=1;
            }
        }
    }
if(subphs==0)//stabilizing
    {
    m=24;
    dir=approach(dir,12,0,1);
    if (sp>m)
        sp-=global.time/2;
    if (sp<m)
        sp+=global.time/2;
    
    if (sp>=m && sonic.x>x-440 && sonic.speed>=sp-1)
        {
        remUY=y+64;
        precision=64;//96
        subphs=1;
        sp=m;
        timer2=0;
        }
    }
if(subphs==1)//going down
    {
    dir-=global.time*5;
    if (dir<=-90)
        {
        dir=-90;
        respawn=1;
        remLX=x;
        subphs=2;
        }
    }
if(subphs==2)//going right
    {    
    if (y>remUY+480)
        {
        precision=48;//64
        dir+=global.time*5;
        if (dir>=0)
            {
            dir=0;
            respawn=1;
            remMX=x;
            remDY=y;
            subphs=3;
            }
        }
    }
if(subphs==3)//going up
    {
    precision=80;//96
    if (x>remLX+480)
        {
        dir+=global.time*5;
        if (dir>=90)
            {
            respawn=1;
            dir=90;
            remRX=x;
            remRY=y;
            subphs=4;
            counter=0;
            }
        }
    }
if(subphs==4)//turn around
    {precision=48;
    if(y<remDY-960 || counter>0)
        {
        if(counter==2)
            {
            dir-=5*global.time;
            if(dir<=270)
                {
                x=remRX-2;
                dir=270;
                subphs=5;
                }
            }    
        if(counter==1)
            {
            dir+=5*global.time;
            if(dir>=330)
                {
                dir=330;
                counter=2;
                }
            }    
        if(counter==0)
            {
            dir-=5*global.time;
            if(dir<=30)
                {
                dir=30;
                counter=1;
                }
            }
        }
    else if(y>remDY-640 && sp>8)
        sp-=global.time/4;
    else if(sp>8)
        sp-=global.time/2;
    }
if(subphs==5)//go left and up again
    {
    precision=70;
    if(y>remDY+256 && dir>180)
        {
        precision=48;
        dir-=5;
        if(dir<=180)
            {
            dir=180;
            }
        }
    if(y<remDY)
        {
        if(sp<24)
            sp+=global.time/3;
        if (sp<16 && stableCycle>4)
            warning=1;
        }
    else if(sp>8)
        sp-=global.time/2;
    if(x<remLX+480)
        {
        if (dir==180)
            respawn=1;
        precision=64;//naught
        dir-=9*global.time;
        if(dir<=90)
            {
            precision=64;//80
            dir=90;
            if(sp<8 && stableCycle>4)
                warning=1;
            sp-=global.time/3.5;
            if(sp<=1)
                {
                subphs=6;
                counter=0;
                }
            }
        }
    }
if(subphs==6)
    {
    if(y>remDY-72)
        sp+=global.time;
    else
        {
        if(sp>8)
            sp-=global.time;
        else
            {
            dir-=global.time*5;
            if(dir<-90)
                {
                dir=-90;
                if(sp<8 && stableCycle>4)
                    warning=1;
                sp-=global.time/3.5;
                if(sp<=1)
                    subphs=7;
                }
            }
        }
    }
    
if(subphs==7)
    {
    if(y<remDY+320)
        {
        if(sp<24)
            sp+=global.time;
        }
    else
        {
        dir+=global.time*5;
        if(dir>=0)
                {
                if(closeX<x-800)
                closeX+=global.time*11;
                dir=0;
                
                if(x<remRX+128)
                    {
                    if(sp<24)
                        sp+=global.time/2;
                    }
                else
                    {
                    if (sp>0) 
                        {
                        sp-=global.time/2;
                        soundvolume(global.sndQuake,0.9*(1-power(1-min(1,sp/24),2)));
                        }
                    if (((__view_get( e__VW.XView, 0 )+640>xx-80 && sonic.speed>10) || __view_get( e__VW.XView, 0 )+480>xx-80) && sonic.y>y-96)
                        {
                        sp=max(0,sonic.speed-6);
                        soundvolume(global.sndQuake,0.9);
                        precision=48;
                        subphs=0;
                        phase=2;
                        timer=0;
                        timer2=0;
                        counter=0;
                        destined=0;
                        closeProggy=0;
                        }
                    }
            }
        }
    }

hspeed=lengthdir_x(sp,dir);
vspeed=lengthdir_y(sp,dir);
}
__b__ = action_if(phase==6);
if __b__
{
var m;
timer+=global.time;

if(subphs<2)
    closeX=x-800;
else
    {
    if(closeProggy<1)
        {
        if(sonic.y<remRY+48)
            closeProggy+=global.time/60;
        else
            closeProggy+=global.time/450;
        with dLine
            {
            if (x<64+other.remLX+other.closeProggy*(other.remRX-other.remLX) && y>other.remLY-64-other.closeProggy*(other.remLY-other.remRY))
                forceClose=1;
            }
        }
    else if(closeProggy<2 && subphs<4)
        {
        closeProggy+=global.time/200;
        closeX=remRX+(closeProggy-1)*1024;
        }
    }

if(subphs==0)//stabilizing
    {
    m=20;
    dir=approach(dir,12,0,1);
    if (sp>m)
        sp-=global.time/2;
    if (sp<m)
        sp+=global.time/2;
    
    if (sp>=m && sonic.x>x-440 && sonic.speed>=sp-1)
        {
        precision=64;//96
        subphs=1;
        sp=m;
        timer2=0;
        remLX=x;
        remLY=y;
        }
    }
if (subphs==1)
    {
    timer2+=global.time;
    precision=32;
    if (counter mod 4 ==0)
        {
        dir+=global.time*10;
        if(dir>=90)
            {
            dir=90;
            counter+=1;
            timer2=0;
            }
        }
    if (counter mod 2 ==1)
        {if(timer2>5*(1+counter div 4))counter+=1;}
    if (counter mod 4 ==2)
        {
        dir-=global.time*10;
        if(dir<=0)
            {
            dir=0;
            counter+=1;
            timer2=0;
            }
        }
    if (counter==7)
        {
        subphs=2;
        timer2=0;
        remRX=x;
        remRY=y;
        }

    }
if(subphs==2)
    {
    timer2+=global.time;
    dir=approach(dir,4,0,1);
    precision=48;
    //
    if (sp>0) 
        {
        sp-=global.time/6;
        soundvolume(global.sndQuake,0.9*(1-power(1-min(1,sp/24),2)));
        }
    else
        {sp=0;
        if (((__view_get( e__VW.XView, 0 )+640>xx-80 && sonic.speed>10) || __view_get( e__VW.XView, 0 )+480>xx-80) && sonic.y>y-96)
            {
            sp=max(0,sonic.speed-6);
            soundvolume(global.sndQuake,0.9);
            subphs=3;
            timer=0;
            timer2=0;
            counter=0;
            destined=0;
            dir=0;
            }
        }
    }
if(subphs==3)
    {
    precision=32;
    m=24;
    if (sp>m)
        sp-=global.time/2;
    if (sp<m)
        sp+=global.time/2;
    if(x>remRX+1400 || dir>0)
        {
        dir+=global.time*10;
        if(dir>270)
            {
            closeX=remRX+440;
            subphs=4;
            dir=-90;
            timer2=0;
            }
        }
    }
if(subphs==4)
    {
    precision=64;
    m=13;
    if (sp>m)
        sp-=global.time/2;
    if (sp<m)
        sp+=global.time/2;
    if(y>remRY+192)
        {
        precision=48;
        dir+=global.time*10;
        if(dir>=0)
            {precision=64;
            timer2+=global.time;
            dir=0;
            if(timer2>60)
            closeX+=(sp+12)*global.time;
            if(closeX>x-800)
                {
                precision=48;
                subphs=0;
                timer=-120;
                phase=2;
                timer2=0;
                counter=0;
                destined=0;
                closeProggy=0;
                }
            }
        }
    }

hspeed=lengthdir_x(sp,dir);
vspeed=lengthdir_y(sp,dir);
}
__b__ = action_if(phase==7);
if __b__
{
var m,mx,my;
timer+=global.time;

if(subphs==0)
    {
    if(sp<24)
        sp+=global.time/2;
    if(sp>24)
        sp-=global.time/2;
    m=90;
    closeX=x-800;
    invulnerable=80;
    dir=approach(dir,12,0,1);
    if(timer>m && layerExists)
        {
        layerExists=0;
        i=instance_create(mineX,mineY,objbigexp);
        i.hspeed=hspeed/1.5;
        i.image_xscale=2;
        i.image_yscale=2;
        i.vspeed=vspeed/1.5;
        i.image_angle=10;
        soundplay(global.sndGunstar3);
        audio_stop_sound(game);
        
        draw_clear(c_white);
        
        global.handle=SS_LoadSound("FeistyOne2.ogg");
        
        objectfg.flashlight=1;
        controlbg.lev=-2;
        
        mx=x;//attn! varred
        my=y-2000;
        
        for(a=0; a<9; a+=1)
            {
            px[current]-=mx;
            py[current]-=my;
            }
        xx-=mx;
        yy-=my;
        lx-=mx;
        ly-=my;
        rx-=mx;
        ry-=my;
        xp-=mx;
        yp-=my;
        closeX-=mx;
        with all
            {
            if(object_index==objTri)
                {
                x-=mx;
                y-=my;
                x2-=mx;
                y2-=my;
                x3-=mx;
                y3-=my;
                }
            else if(object_index==dLine)
                {
                x-=mx;
                y-=my;
                x2-=mx;
                y2-=my;
                fx-=mx;
                fy-=my;
                fx2-=mx;
                fy2-=my;
                on=2;
                event_user(0);
                }
            else
                {
                x-=mx;
                y-=my;
                }
            }
        
        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (mx) );
        __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (my) );
        controlbg.visible=1;
        objectfg.visible=1;
        i=instance_create(x,y,objWaterFront);
        remRX=x+480;
        remRY=i.y-256;
        dir=0;
        
        event_user(0);
        
        grassgenerator.phase=6;
        grassgenerator.x=remRX+2560;
        grassgenerator.y=remRY;
        
        i=instance_create(remRX,y-1280,dLine);//lower<- are you completely retarded? It's upper.
        i.visible=1;
        i.right=0;
        i.x2=i.x;
        i.y2=y;
        i.special=1;
        with i event_user(0);
        j=instance_create(remRX,remRY-256,dLine);//
        j.visible=1;
        j.right=1;
        j.x2=j.x;
        j.y2=y;
        j.special=1;
        with j event_user(0);
        
        i=instance_create(remRX,remRY,grassline);
        i.x2=remRX+1559-56;
        i.y2=remRY;
        i.deep=0;
        i=instance_create(remRX+1559-56,remRY,grassline);
        i.x2=remRX+1559+120;
        i.y2=remRY;
        i.deep=0;
        muLine=i;
        i=instance_create(remRX+1559+120,remRY,grassline);
        i.x2=remRX+2560;
        i.y2=remRY;
        i.deep=0;
        
        i=instance_create(remRX,remRY,greatbrown2);
        i.c4=i.c3;
        i.depth=11;
        i.x2=remRX+2560;
        i.y2=remRY+1280;
        sp=24;
        }
    
    if(timer>m)
        {
        if(x>remRX+48)
            {
            repeat(8)
                {
                i=instance_create(x-32,y-32+random(64),objdebris);
                i.sprite_index=sprlaserdebris;
                i.image_single=random(i.image_number);
                i.rotation=-5+random(10);
                i.hspeed+=sp;
                i.vspeed-=2;
                i.depth=15;
                }
            soundplay(global.sndCrush);
            soundstop(global.sndQuake);
            subphs=1;//fall
            }
        }
    hspeed=lengthdir_x(sp,dir);
    vspeed=lengthdir_y(sp,dir);
    }
else
    closeX=min(x-800,remRX+32);//special is immune so don't worry
if (subphs==1)
    {
    if(direction>180 && dir<180)
        dir+=360;
    dir=approach(dir,16,direction,1);
    vspeed+=global.grav/global.meter*global.time;
    speed-=global.air*speed*speed*global.time;
    if(y+lengthdir_y(52,dir)>remRY)
        {
        invulnerable=0;
        i=instance_create(xx,yy,objbigexp);
        i.hspeed=hspeed/2;
        i.image_xscale=2;
        i.image_yscale=2;
        i.vspeed=vspeed/2;
        i.image_angle=-10;
        coreSprite=sprcoredest;
        
        soundplay(global.sndGunstar1);
        soundplay(global.sndGunstar2);
        soundloop(global.sndMetalScrape);
        soundloop(global.sndQuake);
        soundvolume(global.sndQuake,1);
        precision=80;
        lastRight=-2;
        lastLeft=-2;
        lx=x+120;
        ly=remRY;
        rx=x-56;
        ry=remRY;
        subphs=2;
        global.time=0.1;
        direction=dir;
        speed=speed*0.8;
        with muLine.i
            instance_destroy();
        with muLine
            instance_destroy();
        }
    }
if(subphs==2)
    {
    if(speed>0)
        {
        if(random(0.5)<global.time)
            {i=instance_create(xx+lengthdir_x(48,dir+90),yy+lengthdir_y(48,dir+90),objspark);
            i.depth=depth-1;
            i.hspeed+=hspeed*2;
            i.vspeed+=vspeed*2;}
        if(random(0.5)<global.time)
            {i=instance_create(xx+lengthdir_x(48,dir-90),yy+lengthdir_y(48,dir-90),objspark);
            i.depth=depth-1;
            i.hspeed+=hspeed*2;
            i.vspeed+=vspeed*2;}
        speed-=global.time;
        soundvolume(global.sndQuake,1-power(1-min(1,speed/16),2));
        if(speed<=0)
            {
            global.time=0.5;
            speed=0;
            soundstop(global.sndMetalScrape);
            soundvolume(global.sndQuake,1);
            soundstop(global.sndQuake);
            dead=1;
            myBouncer=instance_create(xx,yy,objbouncer);
            myBouncer.image_angle=dir+180;
            myBouncer.amount=14;
            }
        }
    sp=speed;
    if(speed==0)
        {
        instance_create(xx-32,yy-32,objsmoke);
        if (myBouncer != -1 && instance_exists(myBouncer))
        {
            myBouncer.x=approach(myBouncer.x,15,xx-32,1);
            myBouncer.y=approach(myBouncer.y,15,yy-32,1);
            myBouncer.depth=depth+1;
        }
        }
    }
}
__b__ = action_if(layerExists);
if __b__
{
if(shield)
    {
    if(point_distance(xx,yy,sonic.x,sonic.y)<80 && cos(degtorad(layerAngle-point_direction(xx,yy,sonic.x,sonic.y)))>0.4)
        {
        sonic.damaged=1;
        sonic.damagex=x;
        sonic.damagey=y;
        if (sonic.invulnerable==0)
            {
            with sonic
                motion_add(point_direction(x,y,other.x,other.y),4);
            }
        }
    }
else if(point_distance(sonic.x,sonic.y,(xx+mineX)/2,(yy+mineY)/2)<48)
    {
    damaged=1;
    }
}
__b__ = action_if(damaged);
if __b__
{
if (invulnerable==0)
    {
    sonic.hspeed=hspeed-1;
    sonic.vspeed=vspeed;
    soundplay(global.sndBreakDown);
    i=instance_create(mineX,mineY,objbigexp);
    i.hspeed=hspeed/2;
    i.vspeed=vspeed/2;
    destined=0;
    invulnerable=120;
    sp+=12;
    damageCounter+=1;
    if(damageCounter==4)
            {
            timer=0;
            timer2=0;
            counter=0;
            destined=0;
            subphs=0;
            phase=7;
            }
    }

damaged=0;

}
__b__ = action_if(invulnerable>0);
if __b__
{
if (invulnerable>60 && stableCycle mod 4==0)
    {
    i=instance_create(xx-48+random(96),yy-48+random(96),objmedexp);
    soundplay(global.sndGunstar1);
    if(damageCounter<4)
        dir+=-1+random(2);
    }
invulnerable-=global.time;
if (invulnerable<=0)
    invulnerable=0;
}
with objassessment
    {
    x=other.xx+lengthdir_x(48,other.layerAngle);
    y=other.yy+lengthdir_y(48,other.layerAngle);
    }
ok=0;
if(phase>1)
    {
    if (phase<7)
        ok=1;
    else if(subphs==0)
        ok=1;
    else if(sonic.x<remRX && sonic.y<remRY-256)
        ok=1;
    }
__b__ = action_if(ok);
if __b__
{
var j;
j=instance_nearest(sonic.x,sonic.y,objTri);
if(point_distance(sonic.x,sonic.y,j.x,j.y)>96)
    game_over();
}
