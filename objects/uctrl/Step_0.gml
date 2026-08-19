objRean.forceReturn=1;

eightstage+=1;
if (eightstage>=8)
    eightstage=0;

__view_set( e__VW.YView, 0, 0 );
if(shaking>0)
    {
    shaking-=1;
    if (eightstage==5)
        __view_set( e__VW.YView, 0, -shakeInt );
    if (eightstage==6)
        __view_set( e__VW.YView, 0, shakeInt );
    soundvolume(global.sndQuake,0.85);
    }
else
    soundvolume(global.sndQuake,0.75);

if(__view_get( e__VW.XView, 0 )+648>xx)
    {
    if instance_exists(objRean)
        objRean.minY=0;
    //ultJumpBack();
    //These are not in order of phase.
    if (count==-1)
        ultBeginning();
    if (count==0)
        ultBridge();
    if (count==1)
        ultSparse1();
    if (count==2)
        ultSparse2();
    if (count==3)
        ultFlat();
    if (count==4)
        ultBreak();
    if (count==5)
        ultJumpBack();
    if (count==6)
        ultJump();
    if (count==7)
        ultStairs();
    if (count==8)
        ultRotate();
    if (count==9)
        ultPillars();
    if (count==10)
        ultBouncers();
    if (count==11)
        ultThrow();
    if (count==12)
        ultRotate2();
    if (count==13)
        ultCrunch();
    
    
    if (count>=14)
        {
        if(phase<16)    
            ultTerminal();
        else
            ultNaught();
        }
    count+=1;
    with (rotBlock)
        {
        if (x<__view_get( e__VW.XView, 0 )-wr-64)
            instance_destroy();
        }
    }
    
if(sonails.x+160>fx)
    {
    fxSpeedup=22;
    }
if (fxSpeedup>0)
    {
    fx+=(10+sonails.hspeed/2)*global.time;
    fxSpeedup-=global.time;
    }

with (rotBlock)
    {
    if (x<other.fx+128 && adjust==0)
        {
        adjust=1;
        }
    if (x<other.fx && adjust==1)
        {
        adjust=2;
        }
    }
var __b__;
__b__ = action_if(phase<16);
if __b__
{
if(camLock!=-1)
    {
    ok=0;
    if (sonails.x>camLock-64)
        {
        viewX+=max(0,sonails.hspeed)+8*global.time;
        if(viewX>=sonails.x-288)
            camLock=-1;
        }
    else if (viewX<camLock-640)
        viewX=max(viewX+global.time,sonails.x-288);
    }
if(camLock==-1)
    {
    global.mogen=viewX;
    viewX=max(viewX+global.time,sonails.x-288+viewPlus);
    if (nextCamLock!=-1)
        {
        camLock=nextCamLock;
        nextCamLock=-1;
        }
    }
    
__view_set( e__VW.XView, 0, viewX );
}
__b__ = action_if(phase==1);
if __b__
{
if instance_exists(hema1)
    {
    if(sonails.x>hema1.x-192)
        trigger=1;
    }

if(trigger)
    {
    objRean.phase=1;
    objRean.forceReturn=0;
    }
    
}
__b__ = action_if(phase==3);
if __b__
{
//sparse land1
if instance_exists(hema1)
{
if(hema1.adjust>0 && (hema1.rot>-10))
    {
    hema1.rotsp=-1;
    }
else
    hema1.rotsp=0;
}
}
__b__ = action_if(phase==4);
if __b__
{
//sparse land2

if instance_exists(hema2)
{    
if(hema2.adjust>0 && hema2.rot<10)
    {
    hema2.rotsp=1;
    }
else
    hema2.rotsp=0;
}
}
__b__ = action_if(phase==6);
if __b__
{
//pillars?

if instance_exists(hema1)
{   
if(sonails.x>hema1.x+64 || trigger==1) 
    {
    if(trigger==0)//Genial logikk her
        {
        hema1.yG=ubgline.y-16;
        hema2.yG=ubgline.y+64;
        hema1.adjust=2;
        hema2.adjust=2;
        trigger=1;
        
        objRean.up=22;
        }

    if(hema1.rot<3)
        hema1.rotsp=0.5;
    else
        {
        hema1.rotsp=0;
        if(hema3.x>hema3.xstart-32)
            hema3.hspeed=-1;
        else
            {objRean.phase=1;
            objRean.forceReturn=0;
            hema3.hspeed=0;
            hema3.x=hema3.xstart-32;}
        }
    }
else
    {
    hema1.adjust=0;
    hema2.adjust=0;
    
    hema1.y=hema1.ystart;
    hema2.y=hema2.ystart;
    hema3.y=hema3.ystart;
    }
hema3.adjust=0;
hema3.y=hema2.y-hema2.hr+16;
}
}
__b__ = action_if(phase==8);
if __b__
{
////LAUNCHER

if instance_exists(hema1)
{   
if (hema1.rot>-45)
    hema1.rotsp=-0.5;
else 
    {
    hema1.rotsp=0;
    if(sonails.x>hema1.x-32+(480-sonails.y) && trigger==0) 
        {
        with hema1
            spawnTopRocks(10,3);
        soundplay(global.sndCrush);
        trigger=1;
        objRean.up=22;
        }
    }
if(trigger>0)
    {
    if(trigger<1+2)
        {
        hema1.hspeed+=8*global.time;
        hema1.vspeed+=-8*global.time;
        with (hema1)
                event_user(0);
        shaking=1;
        }
    else if(hema1.hspeed>0 && sonails.hspeed>16)
        {
        hema1.hspeed-=8*global.time;
        hema1.vspeed-=-8*global.time;
        with (hema2)
                event_user(0);
        shaking=1;
        }
    if (hema1.hspeed<0)
        hema1.speed=0;
    trigger+=global.time;
    }
hema1.yG=hema1.y;
}
}
__b__ = action_if(phase==11);
if __b__
{
if instance_exists(hema1)
    {
    if(sonails.x>hema1.x)
        trigger=1;
    }

if(trigger)
    {
    objRean.phase=1;
    objRean.forceReturn=1;
    }
if (viewPlus>-192)
viewPlus-=global.time*3;
}
else
{
if (viewPlus<0)
viewPlus+=global.time*3;
}
__b__ = action_if(phase==12);
if __b__
{
//rotating central block

if instance_exists(hema2)
{
if(sonails.x>hema2.x-hema2.wr+16 || trigger>0) 
    {
    if(trigger==0)//Fremdeles genial logikk her
        {
        hema1.yG=ubgline.y+480;
        hema3.yG=ubgline.y+480;
        hema1.adjust=2;
        hema3.adjust=2;
        trigger=1;
        objRean.up=60;
        }
    if(hema2.rot<66)
        {
        hema2.rotsp=0.25;
        with (hema2)
            event_user(0);
        shaking=1;
        }
    else
        hema2.rotsp=0;
    
    }
else if (instance_exists(hema1))
    {
    
    hema1.adjust=0;
    hema2.adjust=0;
    
    hema1.y=hema1.ystart;
    hema2.y=hema2.ystart;
    }
}
}
__b__ = action_if(phase==13);
if __b__
{
//rotating central block

if instance_exists(hema2)
{
if(sonails.x>hema2.x-hema2.wr+16 || trigger>0) 
    {
    if(trigger==0)//Fremdeles genial logikk her
        {
        hema1.yG=ubgline.y+480;
        hema3.yG=ubgline.y+480;
        hema1.adjust=2;
        hema3.adjust=2;
        trigger=1;
        objRean.up=-60;
        }
    if(hema2.rot>-66)
        {    
        hema2.rotsp=-0.25;
        with (hema2)
            event_user(0);
        shaking=1;
        }
    else
        hema2.rotsp=0;
    
    }
else if (instance_exists(hema1))
    {
    
    hema1.adjust=0;
    hema2.adjust=0;
    
    hema1.y=hema1.ystart;
    hema2.y=hema2.ystart;
    }
}
}
__b__ = action_if(phase==14);
if __b__
{
if instance_exists(hema1)
{
if(sonails.x>hema2.x-hema2.wr+16 || trigger>0) 
    {
    if(trigger==0)//Fremdeles genial logikk her
        {
        hema1.yG=ubgline.y+128-96;
        hema3.yG=ubgline.y+128-96;
        hema1.adjust=2;
        hema3.adjust=2;
        
        with hema1
            {preadjust=2;
            spawnTopRocks(4,2);}
        with hema3
            {preadjust=2;
            spawnTopRocks(4,2);}
        objRean.up=22;
        trigger=1;
        }
    if(trigger==1)
        {
        if(hema1.y<hema1.yG+1)
            trigger=2;
        }
    if(trigger==2)
        {
        if(hema2.y-hema2.hr-80>hema1.y-hema1.hr)
            {
            if(sonails.y>hema2.y-hema2.hr-64)
                {objRean.phase=1;
                objRean.forceReturn=1;}
            
            if(hema5.x>hema5.xstart-32)
                {hema5.hspeed=-1;
                hema4.hspeed=1;}
            else
                {hema5.hspeed=0;
                hema5.x=hema3.xstart-48;
                hema4.hspeed=0;
                hema4.x=hema1.xstart+48;}
            
            hema2.vspeed=-0.25;
            with (hema2)
                event_user(0);
            shaking=1;
            }
        else
            hema2.vspeed=0;
        hema2.adjust=0;
        }
    }
hema4.adjust=0;
hema4.y=hema1.y-hema1.hr+16;
hema5.adjust=0;
hema5.y=hema3.y-hema3.hr+16;
}
}
__b__ = action_if(phase==15);
if __b__
{
shaking=1;
if(random(2)<global.time)
    instance_create(sonails.x-random(32),ubgline.y,objUltSmoke);
with (rotBlock)
    {
    if (sonails.x+8>x)
        {
        adjust=2;
        yG=720;
        }
    }
if(objRean.phase==0)
    {
    if(trigger==0)
        {
        instance_create(0,0,objUltima);
        trigger=1;
        }
    objRean.up=4;
    }
}
__b__ = action_if(phase==16);
if __b__
{
if (trigger>=3)
    {
    trigger+=global.time;
    if (trigger>60)
        {sonails.sprite_index=sprArmLookBack;
        sonails.physics=0;
        sonails.speed=0;}
    if(trigger>150)
        goToCreds();
    
    }
if (trigger==2)
    {
    sonails.cx=-1;
    if (sonails.hspeed<0.5)
        trigger=3;
    }
if(trigger==0)
    {
    soundloop(global.sndWind);
    trigger=1;
    }
    
if(windVol<1)
    {
    windVol+=global.time/150;
    if (windVol>=1)
        windVol=1;
    soundvolume(global.sndWind,0.8*(1-power(1-windVol,2)));
    }
    
if (trigger==1)
    {
    sonails.cx=1;
    if (sonails.x>__view_get( e__VW.XView, 0 )+420)
        trigger=2;
    }

}
blink = !blink;


if(__view_get( e__VW.XView, 0 )+660>tinyX && tinyX>-1)
    {
    instance_create(tinyX,ubgline.y,tinyBlock);
    tinyX+=32;
    }
