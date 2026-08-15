var tx;
lastDir=dir;
dir=point_direction(i1.x,i1.y,i2.x,i2.y);

xx=(i1.x+i2.x)/2;
yy=(i1.y+i2.y)/2;

k=sin(degtorad(point_direction(i1.x,i1.y,x,y)-dir));
if(k<0.05)
    {
    motion_set(dir+90,1);
    x=xx+hspeed*4;
    y=yy+vspeed*4;
    hspeed+=(i1.hspeed+i2.hspeed)/2;
    vspeed+=(i1.vspeed+i2.vspeed)/2;
    }

soft(i1,33,0.5,0.8);
soft(i2,33,0.5,0.8);
with i2
    {
    hard(other.i1,56);
    }
//
if(mySonic)
    {
    __view_set( e__VW.XView, 0, x-320 );
    if (introgenerator.maxCam!=-1 || y-320 < __view_get( e__VW.YView, 0 ))
        __view_set( e__VW.YView, 0, y-320 );
    if (introgenerator.maxCam!=-1)
        {
        if (__view_get( e__VW.YView, 0 )>introgenerator.maxCam)
            __view_set( e__VW.YView, 0, introgenerator.maxCam )
        }
    }
if(gnd>0)
    {
    if (correction==0 && lengthdir_x(1,dir-introgenerator.slope)<0 && cos(degtorad(point_direction(0,0,nx,ny)-(dir+90)))<0)
        {correction=1;
        boostgauge=1;}
    }

if (correction)
    {
    if(lengthdir_x(1,dir-introgenerator.slope)>0)
        {
        tx=lengthdir_y(1,dir+(dir-lastDir)*24-introgenerator.slope);
        
        if(tx<0)
            cx=1;
        if (tx>0)
            cx=-1;
        if (abs(dir-lastDir)<1 && abs(tx)<0.3)
            {
            correction=0;
            }
        }
    else 
        {
        if (introgenerator.phase!=7)
            {
            if (haltBoost<=0)
                cb=1;
            if (boostgauge<1/30)
                haltBoost=30;
            }
        cx=1;
        }
    }
if (haltBoost>0)
    haltBoost-=global.time;
var lol,suggear;
boosting=0;

if(cx==-1)
    {
    with i2
        {
        motion_add(other.dir+90,other.lift*global.time);
        }
    }
if(cx==1)
    {
    with i2
        {
        motion_add(other.dir+90,-other.lift*global.time);
        }
    }


if(cy==-1)
    {
    if (idle>0)
        {
        idle=0;
        soundvolume(global.sndIdle,0);
        soundvolume(global.sndRunning,global.maxVolume);
        }
        
    if(i1.gnd>0)
        {
        with i1
            {
            hspeed+=global.time*other.acc*ux;
            vspeed+=global.time*other.acc*uy;
            }
        lol=max(0,-i1.angsp);
        if (lol<15)
            {gear=0; interval=20;}
        if (lol>25 && lol<55)
            {gear=20; interval=40;}
        if (lol>65 && lol < 135)
            {gear=60; interval=80;}
        if (lol>145)
            {gear=140; interval=160;}
        
        freq=power(max(0,min(0.05+gear/1000+0.9*(lol-gear)/(interval*1.5),1)),0.5);
        soundfrequency(global.sndRunning,freq);
        }
    else
        {
        i1.angsp=-43;
        freq=(freq*20+global.time*0.9)/(20+global.time);
        soundfrequency(global.sndRunning,freq);
        }
    }
else
    {
    if (idle<1)
        {
        idle+=global.time/45;
        if (idle>=1)   idle=1;
        soundvolume(global.sndRunning,global.maxVolume*(1-power(idle,5)));
        soundvolume(global.sndIdle,global.maxVolume*(1-power(1-idle,5)));
        }
    freq=(freq*50+global.time*0.05)/(50+global.time);
    soundfrequency(global.sndRunning,freq);
    }
if(cy==1)
    {
    if(i1.gnd>0)
        {
        with i1
            {
            speed=speed/(1+0.4*global.time);
            }
        }
    else
        i1.angsp=0;
    if(i2.gnd>0)    
        {
        with i2
            {
            speed=speed/(1+0.4*global.time);
            }
        }
    else
        i2.angsp=0;
    }
if(cb)
    {
    boostgauge-=2*global.time/maxboost;
    if(boostgauge>0)
        {
        if (pcb==0)
            {
            pcb=1;
            soundplay(global.sndAfterBurner);
            }
        motion_add(dir,global.time*boost*0.4);
        with i1
            motion_add(other.dir,global.time*other.boost*0.6);
        boosting=1;
        }
    }
if(boosting==0 && pcb==1)
    {
    soundplay(global.sndAfterBurnerStop);
    soundstop(global.sndAfterBurner);
    pcb=0;
    }
cx=0;
cy=0;
cb=0;
blink = !blink;
var __b__;
__b__ = action_if(point_distance(x,y,i2.x,i2.y)<32);
if __b__
{
sonicBase=1;
sonicBaseTimer=12;
}
if (sonicBaseTimer>0)
    {
    sonicBaseTimer-=global.time;
    if(sonicBaseTimer<=0)
        {
        sonicBase=0;
        }
    }
if(blinkTimer<2)
    sonicImg=sonicBase*3+2;
else
    {
    if(speed>16)
        sonicImg=sonicBase*3+blink;
    else
        sonicImg=sonicBase*3;
    }
blinkTimer+=global.time;
if (blinkTimer>240)
    blinkTimer=0;
if(mySonic)
    {
    if (y>__view_get( e__VW.YView, 0 )+512)
        {intro_over();
        exit;}
    }
