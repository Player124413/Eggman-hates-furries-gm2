action_set_relative(1);

// The destroyed spotter remains as a harmless controller until Sonic exits
// the loop. Respawn it after loopTrigger reaches 2, matching the next Panjan
// phase instead of leaving the battle without its drone.
if (instance_exists(bot1) && variable_instance_exists(bot1, "dead")
    && bot1.dead && loopTrigger >= 2)
    {
    with (bot1) instance_destroy();
    bot1=noone;
    }

// The support bot can be removed by broad phase clean-ups while Panjan keeps
// running. Recreate it before any goal/shield fields are updated.
if (!instance_exists(bot1))
{
    bot1 = instance_create(x - 128, y - 128, objBot);
    bot1.kind = 1;
}

if(lightEmUp!=-1)
    {
    if (x>lightEmUp.x2)
        {
        for(a=lightEmUp.x+18; a<lightEmUp.x2-16; a+=60)
            {
            i=instance_create(a,lightEmUp.y,objFireWall);
            i.blink=blinkFire;
            blinkFire=!blinkFire;
            }
        lightEmUp=-1;
        }
    }
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

burnStage+=global.time/2;
if (burnStage>=12)
    burnStage=0;
action_set_vspeed(global.grav/global.meter*global.time);
angle+=spin*global.time;
if (angle>=360)
    angle-=360;
if (angle<0)
    angle+=360;
    
    
soundfrequency(global.sndTurbulence,min(1,abs(spin/60)));
soundvolume(global.sndTurbulence,1-power(max(0,1-abs(spin/60)),2));
var __b__;
__b__ = action_if(invulnerable>0);
if __b__
{
fukTimer-=global.time;
if (fukTimer<=0 && invulnerable>60)
    {
    fukTimer=4;
    soundplay(global.sndGunstar1);
    i=instance_create(x+hspeed*2-64+random(128),y+vspeed*2-64+random(128),objmedexp);
    i.hspeed=hspeed/2;
    i.vspeed=vspeed/2;
    }
invulnerable-=global.time;
if (invulnerable<=0)
    {
    invulnerable=0;
    }
}
{
action_set_relative(0);
obj = objWaterFront;
action_set_relative(1);
}
__b__ = action_if(y>obj.y-56);
if __b__
{
vspeed-=global.time*max(56-obj.y+y,56)/56;
if(abs(y-obj.y)<48 && random(1)<global.time)
    {
    instance_create(x+hspeed+random(128),obj.y,objSplash2);
    soundplay(global.sndWetLand);
    }
//if(y>obj.y-48)
vspeed=vspeed*31/(32+global.time)
}
__b__ = action_if(phase!=3);
if __b__
{
splashTimer-=global.time;
if(splashTimer mod 2 == 0 || splashTimer<0)
    {
    i=instance_create(x-32+random(96),objWaterFront.y,objSplash2);
    i=instance_create(x+64+random(96),objWaterFront.y,objSplash2);
    i.image_yscale=(1-min(1,abs(y-objWaterFront.y)/128))*min(1,(speed+objWaterFront.hspeed)/50);
    i.image_xscale=i.image_yscale;
    soundfrequency(global.sndWetFall,0.2+0.01*splashTimer)
    soundplay(global.sndWetFall)
    if(splashTimer<=0)
        splashTimer+=4;
    }

if ((y>=objWaterFront.y and yp<objWaterFront.y) or (y<objWaterFront.y and yp>=objWaterFront.y))
    {
    i=instance_create(x,objWaterFront.y,objSplash);
    i.hspeed=(hspeed)*0.25;
    i.image_xscale=2;
    soundplay(global.sndSplash);
    }
    yp=y;
}
__b__ = action_if(phase==1);
if __b__
{
if(subphs==0)
    {
    if (timer==0)
        {
        soundplay(global.sndArmChange);
        }
    if(angle2<60)
        angle2+=global.time;
    if (timer==60)
        {
        dangerRadius=80;
        pri=2;
        soundplay(global.sndAfterBurnerLong);
        sec=2;
        }
    if (sec==2)
        {
        if(y>obj.y-70)
            vspeed-=1.2*global.time*global.grav/global.meter;
        else
            vspeed-=0.9*global.time*global.grav/global.meter;
        
            spin-=global.time/4;
        }
    if (spin<-45)
        {
        tornado.phase=2;
        pri=1;
        soundstop(global.sndAfterBurnerLong);
        soundplay(global.sndAfterBurnerStop2);
        sec=0;
        subphs=1;
        soundplay(global.sndArmChange);
        }
    }
timer+=global.time;
if (subphs>0 && subphs<=2 && angle2>-15)
    angle2-=global.time*5;
    
if (subphs==1)//falling
    {
    if (y>obj.y-56)
        {
        soundplay(global.sndAfterBurnerLong);
        sec=2;
        subphs=2;
        hspeed+=4;
        vspeed=vspeed/1.5;
        spin+=2;
        i=instance_create(x,obj.y,objSplash);
        i.image_xscale=2;
        soundplay(global.sndBigSplash)
        }
    }
if (subphs==2)//speeding
    {
    if (spin<stdSpin)
        spin+=global.time/8;
    else
        spin=stdSpin;
    hspeed+=global.time;
    vspeed+=global.time/4;
    if (x>__view_get( e__VW.XView, 0 )+800)
        {
        dangerRadius=64;
        phase=0;
        subphs=0;
        timer=0;
        spin=stdSpin;
        angle2=0;
        soundstop(global.sndAfterBurnerLong)
        soundplay(global.sndAfterBurnerStop2);
        sec=0;
        }
    }

bot1.goalx=x-32+hspeed;
bot1.goaly=y-128;
with (bot1)
    {
    a=point_direction(x,y,sonic.x,sonic.y)+1;
    if (a>180)
        a-=360;
    mainDir=approach(mainDir,15,a,1);
    }

if(phase==1)
    {
    if (hasHit)
        {
                soundplay(global.sndMercury);
        i=instance_create((sonic.x+x)/2,(sonic.y+y)/2,objmedexp);
        i.hspeed=hspeed/2;
        i.vspeed=vspeed/2;
        hspeed=sonic.hspeed-4;
        vspeed=-2;
        dangerRadius=64;
        phase=0;
        subphs=0;
        timer=0;
        spin=stdSpin;
        soundstop(global.sndAfterBurnerLong)
        soundplay(global.sndAfterBurnerStop2);
        sec=0;
        
        //hard cancel the standing on tornado thing
        sonic.physics=1;
        sonic.able=1;
        tornado.phase=0;
        tornado.subphs=0;

        }
    }
}
__b__ = action_if(phase==3);
if __b__
{
{
__b__ = action_if(firstCrash);
if __b__
{
var k;
if (x>=lastFire+64)
    {
    k=32;
    if (x>rx+384)
        k=0;
    else if (x>rx+192)
        k=32-32*(x-rx-192)/192;
    i=instance_create(x+16,yy+k,objFireWall);
    i.blink=blinkFire;
    lastFire=x-4;
    }
else
    blinkFire=!blinkFire;

if(invulnerable<120 && subphs<2)
    {
    if (vspeed>0 && global.time<0.5)
        global.time=0.5;
    
    if(y>=ry-64)
        {
        y=ry-64;
        if(vspeed>1.5)
            {
            repeat(16)
                {
                i=instance_create(x-16+random(32),y+64,objspark);
                i.hspeed=hspeed+random(4);
                i.vspeed=-random(4);
                }
            hspeed=hspeed*0.75;
            vspeed=-vspeed*0.6;
            if(vspeed>-2)
                {hspeed=20;
                vspeed=0;
                soundplay(global.sndExplosion);
                instance_create(x+40,y-40,objmedexp);
                subphs=1;}
            spin=-360*hspeed/(128*pi);
            soundplay(global.sndClank);
            }
        else
            {
            vspeed=0;
            if(hspeed>8)
                hspeed-=global.time/4;
            spin=-360*hspeed/(128*pi);
            }
        }
    }
bot1.goalx=x-96;
bot1.goaly=y-32;
with (bot1)
    {
    a=-90;
    if (a>180)
        a-=360;
    mainDir=approach(mainDir,15,a,1);
    a=0;
    if (a>180)
        a-=360;
    secDir=approach(secDir,15,a,1);

    }
    
if(sonic.x>mx-24 && loopTrigger==0)
    {
    loopTrigger=1;

    // At the loop entrance the flat sand collision overlaps the curved path.
    // Disable only that floor segment while Sonic is inside the loop so the
    // circular collision is selected instead of behaving like a wall.
    if (instance_exists(loopFloor) && variable_instance_exists(loopFloor, "i"))
        {
        var floorCollision=loopFloor.i;
        if (instance_exists(floorCollision))
            floorCollision.on=0;
        }
    sonic.x=mx-12;
    sonic.y=my+112;
    sonic.speed=max(40,sonic.speed);
    sonic.direction=0;
    sonic.roll=1;

    with sandline
        {
        if(loopside!=0)
            i.on=1;
        }
    with upsand
        {
        if(loopside!=0)
            i.on=1;
        }
    }
if(((sonic.x<mx-16 && sonic.y<my) || sonic.x>mx+136) && loopTrigger==1)
    {
    loopTrigger=2;
    if (instance_exists(loopFloor) && variable_instance_exists(loopFloor, "i"))
        {
        var exitFloorCollision=loopFloor.i;
        if (instance_exists(exitFloorCollision))
            exitFloorCollision.on=1;
        }
    with sandline
        {
        if(loopside==2)
            i.on=0;
        }
    with upsand
        {
        if(loopside==2)
            i.on=0;
        }
    }
if (subphs>0)    
    {vspeed=0;//!
    if(angle2>0)
        angle2-=global.time;
    }

if(x>=fx-56 && subphs==1)
    {
    x=fx-56;
    if(hspeed>0)
        {
        soundplay(global.sndClank);
        instance_create(x+48,y,objbigexp);
        }
    hspeed=0;
    spin=0;
    subphs=2;
    }
    
if(subphs==2 && sonic.y>yy-32 && sonic.x>fx)
    {
    subphs=3;
    soundplay(global.sndChopperScream);
    soundplay(global.sndAfterBurner);
    pri=2;
    }
if(subphs>=3)
    {
    if(hspeed<8)
        hspeed+=global.time/10;
    else
        {
        if(pri==2 && subphs==3)
            {
            pri=1;
            soundstop(global.sndAfterBurner);
            soundplay(global.sndAfterBurnerStop2);
            }
        }
    spin=-360*hspeed/(128*pi);
    if(x+64>muLine.x)
        muLine.y2=yy-128;
    if(x+64>muRine.x)
        muRine.y2=yy-128;
    if (instance_exists(muPad) && muPad!=-1)
        {with muPad
            instance_destroy();
        }
    if (instance_exists(muSand))
        {
        if(burnStage mod 4 == 0)//stable counter thingy right there...
            soundplay(global.sndCrush);
        repeat(ceil(hspeed*global.time/2))
            {
            i=instance_create(muSand.x+8,yy-random(128),objdebris);
            i.sprite_index=sprSandShred;
            i.image_single=random(i.image_number);
            i.hspeed=hspeed+random(10);
            i.vspeed=-3+random(9);
            i.image_blend=merge_color(c_white,c_gray,(440-(yy-i.y))/440);
            }
        muSand.x=x+56;
        with (muSand)
            {
            if (x>=x2)
            instance_destroy();
            }
        }
    if(sonic.x>mx+136)
        {
        if(subphs == 3)
            {
            pri=2;
            soundplay(global.sndAfterBurnerLong);
            subphs=4;
            }
        hspeed+=global.time*limitize((limitize(sonic.x-480-x,48)/240+(48-hspeed)/30)/2,0.5);
        if(hspeed>sonic.hspeed+2)
            hspeed=sonic.hspeed+2;
        if (x>sonic.x && hspeed>sonic.hspeed-8 && phase!=1)
            hspeed-=global.time/2;
        if (x<__view_get( e__VW.XView, 0 )-128)
            hspeed+=global.time/4;    
        }
    if(x>lx-10)
        {
        soundplay(global.sndMetal1);
        soundplay(global.sndClank);
        repeat(16)
            {
            i=instance_create(x+16,y+60,objspark);
            i.hspeed+=hspeed;
            i.vspeed+=vspeed;
            }
        hspeed=(hspeed+sonic.hspeed)/2;
        vspeed=-hspeed*32/128
        phase=0;
        spin=stdSpin;
        timer=0;
        subphs=0;
        i=instance_create(__view_get( e__VW.XView, 0 )-256,__view_get( e__VW.YView, 0 )-192,tornado);
        i.hspeed=sonic.hspeed+8;
        i.vspeed=i.hspeed/16;
        pri=1;
        soundstop(global.sndAfterBurnerLong);
        soundplay(global.sndAfterBurnerStop2);
        firstCrash=0;
        }
    }
}
else
{
var k;
if (x>=lastFire+64)
    {
    k=32;
    if (x>rx+384)
        k=0;
    else if (x>rx+192)
        k=32-32*(x-rx-192)/192;
    i=instance_create(x+16,yy+k,objFireWall);
    i.blink=blinkFire;
    lastFire=x-4;
    }
else
    blinkFire=!blinkFire;

//DIE
if(invulnerable<120 && subphs<2)
    {
    invulnerable=119;
    hspeed+=global.time*limitize((limitize(sonic.x-300-x,48)/120+(47-hspeed)/30)/2,0.5);

    if (vspeed>0 && global.time<0.5)
        global.time=0.5;
    
    if(y>=ry-64)
        {
        y=ry-64;
        if(vspeed>1.5)
            {
            repeat(16)
                {
                i=instance_create(x-16+random(32),y+64,objspark);
                i.hspeed=hspeed+random(4);
                i.vspeed=-random(4);
                }
            
            vspeed=-vspeed*0.6;
            if(vspeed>-2)
                {
                vspeed=0;
                soundplay(global.sndExplosion);
                instance_create(x+40,y-40,objmedexp);
                subphs=1;}
            spin=-360*hspeed/(128*pi);
            soundplay(global.sndClank);
            }
        else
            {
            vspeed=0;
            spin=-360*hspeed/(128*pi);
            }
        }
    }
if (subphs>0)    
    {vspeed=0;//!
    if(angle2>0)
        angle2-=global.time;
    timer+=global.time;
    if (timer>60)
        {         
        zerogenerator.win=1;                      //EXPLODE//
        with (tornado) //just makin' sure
            instance_destroy();
        instance_destroy();
        draw_clear(c_white);
        
        SS_FreeSound(global.handle);
        global.handle=SS_LoadSound("FeistyOne1.ogg");
        i=instance_create(x,y,objbigexp);
        i.hspeed=hspeed;
        i.vspeed=vspeed;
        soundplay(global.sndGunstar2);
        soundplay(global.sndGunstar3);
        i=instance_create(x,y,objPanjanCore);
        i.hspeed=hspeed;
        i.lastFire=lastFire-x;//OMG
        i.blinkFire=blinkFire;
        i.depth=1;
        i.vspeed=vspeed-1;
        i.xx=xx-x;//OMG
        i.yy=yy;
        objectfg.flashlight=1;
        
        movX=x;
        with all
            {
            x-=other.movX;
            if (object_index==line || object_index==sandline || object_index==verySpecialLine)
                {
                x2-=other.movX;
                xi-=other.movX;
                xa-=other.movX;
                }
            }
        __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) - (movX) );
        
        }
    }
if(__view_get( e__VW.XView, 0 )+640>lx)
    {
    zerogenerator.phase=2;
    zerogenerator.timer=0;
    i=instance_create(xx,yy,sandline);
    xx+=1280;
    i.x2=xx;
    i.y2=i.y;
    lx=xx;
    with (sandline)
        {
        if(x2<__view_get( e__VW.XView, 0 )-320)
            instance_destroy();
        }
    }
}
}
}
__b__ = action_if(phase==2);
if __b__
{
if(subphs<2)
    { 
    
    if (timer==0)
        {
        soundplay(global.sndArmChange);
        }
    if(angle2<60)
        angle2+=global.time;
    
    if(timer==nextRock && subphs==0)
        {
        soundplay(global.sndSnipe);
        bot1.excl=30;
        }
    if (timer==nextRock+10*(1-2*firstRock))
        {i=instance_create(0,0,objRockWarning);
        i.timer=-1;}
    
    if (timer==nextRock+8 && subphs==0)
        {
        dangerRadius=80;
        soundplay(global.sndAfterBurnerLong);
        sec=2;
        }
    if(timer==nextRock+30 && subphs==1)
        {
        subphs=2;
        }
    if (timer == nextRock + 31 && subphs == 0 && instance_exists(firstGrass))
    {
        if (variable_instance_exists(firstGrass, "i"))
        {
            var grass_collision = firstGrass.i;
            if (instance_exists(grass_collision) && variable_instance_exists(grass_collision, "i1"))
            {
                var grass_endpoint = grass_collision.i1;
                if (instance_exists(grass_endpoint))
                {
                    with (grass_endpoint)
                        instance_destroy();
                    grass_collision.i1 = -1;
                }
            }
        }
    }
    if(timer==nextRock+30 && subphs==0) ////////NORMAL TINY ISLAND
        {
        if (tornado.phase!=3)
            tornado.subphs=0;
        tornado.phase=3;
        
        xx=__view_get( e__VW.XView, 0 )+640;
        yy=objWaterFront.y-40;
        i=instance_create(xx,yy,verySpecialLine);
        i.x2=i.x;
        i.y2=yy+800;
        
        i=instance_create(xx,yy,sandline);
        xx+=192;
        firstGrass=i;
        lightEmUp=i;
        i.x2=xx;
        i.y2=yy;
        i.RH=1;
        i.LH=1;
        
        i=instance_create(xx,yy,line);
        i.x2=i.x;
        i.y2=yy+800;
        }
    if (sec==2)
        {
        if(y>obj.y-96)
            vspeed-=1.2*global.time*global.grav/global.meter;
        else
            vspeed-=0.9*global.time*global.grav/global.meter;
        }
    if (timer>nextRock+45 && subphs==0)
        {
        firstRock=0;
        tornado.subphs=1;
        nextRock=timer+150+ceil(random(30))
        soundstop(global.sndAfterBurnerLong);
        soundplay(global.sndAfterBurnerStop2);
        sec=0;
        }
    with (objRockWarning)
        {
        x=640;
        y=objWaterFront.y-32-__view_get( e__VW.YView, 0 );
        }
    }
timer+=global.time;
if(subphs<1)
    {
    bot1.goalx=x+320+hspeed;
    bot1.goaly=obj.y-160;
    with (bot1)
        {
        a=point_direction(x,y,__view_get( e__VW.XView, 0 )+960,objWaterFront.y)+1;
        if (a>180)
            a-=360;
        mainDir=approach(mainDir,15,a,1);
        }
    }
else
    {
    bot1.goalx=x-32;
    bot1.goaly=y-96;
    with (bot1)
        {
        a=point_direction(x,y,other.x,other.y)+1;
        if (a>180)
            a-=360;
        mainDir=approach(mainDir,15,a,1);
        }
    }

if (subphs==2)
    {
    tornado.phase=4;
    subphs=3;
    
    if(firstCrash)
    {
    xx=__view_get( e__VW.XView, 0 )+640;
    rx=xx;
    yy=objWaterFront.y-40;
    i=instance_create(xx,yy,verySpecialLine);
    i.visible=1;
    firstLine=i;
    
    i.x2=i.x;
    i.y2=yy+800;
      
    i=instance_create(xx,yy,sandline);
    xx+=192;
    i.x2=xx;
    i.y2=yy;
    firstGrass=i;
    
    i=instance_create(xx,yy,sandline);
    xx+=192;
    yy-=32;
    i.x2=xx;
    i.y2=yy;
    ry=yy;
    
        
    i=instance_create(xx,yy,sandline);
    xx+=2560;
    i.x2=xx;
    i.y2=yy;
                                                    //ThE TOwER
    i=instance_create(xx-16,yy,objbouncer);//BOUNCER
    i.amount=18;
    i.image_angle=90;
    
    i=instance_create(xx,yy-48,objBoostPad);//SPEEDER
    i.amount=20;
    i.image_angle=90;
    muPad=i;
        
    i=instance_create(xx,yy-240,line);
    muLine=i;
    i.x2=i.x;
    i.y2=yy;
    i=instance_create(xx,yy-400,sandline);
    i.c3=c_white;
    i.c4=merge_color(c_white,c_gray,((400-128)/400));
    i.x2=xx+128;
    i.y2=i.y;
    i.deep=400-128;
    i=instance_create(xx+128,yy-400,line);
    muRine=i;
    i.x2=i.x;
    i.y2=yy;
    i=instance_create(xx,yy-128,greatbrown2);
    muSand=i;
    i.c3=merge_color(c_white,c_gray,((400-128)/400));
    i.c4=c_gray;
    i.tex=background_get_texture(bgSand)
    i.x2=xx+128;
    i.y2=yy;
    
    i=instance_create(xx-16,yy-240-32,upsand);
    i.c4=c_white;
    i.c3=merge_color(c_white,c_gray,0.5);
    i.x2=i.x+16;
    i.y2=yy-240;
    i.ydeep=yy-400;
    i=instance_create(xx-48,yy-240-64,upsand);
    i.c4=c_white;
    i.c3=merge_color(c_white,c_gray,0.5);
    i.x2=i.x+32;
    i.y2=yy-240-32;
    i.ydeep=yy-400;
    i=instance_create(xx-80,yy-240-80,upsand);
    i.c4=c_white;
    i.c3=merge_color(c_white,c_gray,0.5);
    i.x2=i.x+32;
    i.y2=yy-240-64;
    i.ydeep=yy-400;
    i=instance_create(xx-96,yy-240-80,upsand);
    i.c4=c_white;
    i.c3=merge_color(c_white,c_gray,0.5);
    i.x2=xx-80;
    i.y2=yy-240-80;
    i.ydeep=yy-400;
    i=instance_create(xx-96,yy-400,sandline);
    i.x2=xx;
    i.y2=i.y;
    i.deep=0;
    i=instance_create(xx-96,yy-400,line);
    i.x2=i.x;
    i.y2=yy-240-80;
    
    i=instance_create(xx-320,yy-128,greatbrown2);
    i.tex=background_get_texture(bgSand);
    i.c3=c_dkgray;
    i.c4=c_dkgray;
    i.x2=xx-192;
    i.y2=yy;
    i.depth=6;
    i=instance_create(xx-320,yy-480,sandline);
    i.c4=merge_color(c_white,c_gray,(480-128)/480)
    i.x2=xx-256;
    i.y2=i.y;
    i.deep=yy-128-i.y;
    i=instance_create(xx-256,yy-224,sandline);
    i.c3=merge_color(c_white,c_gray,(480-224)/480)
    i.c4=merge_color(c_white,c_gray,(480-128)/480)
    i.x2=xx-192;
    i.y2=i.y;
    i.deep=yy-128-i.y;
    i=instance_create(xx-256+16,yy-224,objbouncer);
    i.amount=16;
    i.image_angle=90;
    //left side
    i=instance_create(xx-320,yy-480,line);
    i.x2=i.x;
    i.y2=yy-128;
    //right side
    i=instance_create(xx-192,yy-224,line);
    i.x2=i.x;
    i.y2=yy-128;
    //right top side
    i=instance_create(xx-256,yy-480,line);
    i.x2=i.x;
    i.y2=yy-224;
    //bottom;
    i=instance_create(xx-320,yy-128,line);
    i.visible=1;
    i.x2=xx-192;
    i.y2=yy-128;
    
    i=instance_create(xx-256,yy-440,objbouncer);
    i.image_angle=0;
    i.amount=14;
    
    i=instance_create(xx+384,yy-640,sandline);
    i.x2=xx+480;
    i.y2=i.y;
    i.deep=640-128;
    i.c3=c_white;
    i.c4=c_gray;
    i=instance_create(xx+384,yy-128,greatbrown2);
    i.depth=3;
    i.tex=background_get_texture(bgSand);
    i.c3=c_dkgray;
    i.c4=c_dkgray;
    i.x2=xx+480;
    i.y2=yy;
    i=instance_create(xx+384,yy-128,line);
    i.visible=1;
    i.x2=xx+480;
    i.y2=i.y;
    i=instance_create(xx+384,yy-128,line);
    i.x2=i.x;
    i.y2=yy-640;
    i=instance_create(xx+480,yy-128,line);
    i.x2=i.x;
    i.y2=yy-640;
    
    instance_create(xx+448,yy-1,objBoostPad);
    instance_create(xx+448-16,yy-24,objring);
    instance_create(xx+448,yy-24,objring);
    instance_create(xx+448+16,yy-24,objring);
    
    fx=xx;
    
    i=instance_create(xx,yy,sandline);
    xx+=640;
    i.x2=xx;
    i.y2=yy;
    i.depth=-3;
    //o_0 OMG a loop:
    //bounds
    i=instance_create(xx-32,yy-288,sandline);
    i.LH=1;
    i.x2=i.x+32;
    i.y2=i.y;
    i.deep=288;
    i.c3=c_white;
    i.c4=c_white;
    i.depth=2;
    i=instance_create(xx+256,yy-288,sandline);
    i.x2=i.x+32;
    i.y2=i.y;
    i.deep=288;
    i.c3=c_white;
    i.c4=c_white;
    i.RH=1;
    i.depth=-2;
    //R
    mx=xx+128;
    my=yy-128;
    b=6;
    for(a=0; a<b; a+=1)
        {
        i=instance_create(mx+lengthdir_x(128,270+a*90/b),my+lengthdir_y(128,270+a*90/b),sandline);
        i.x2=mx+lengthdir_x(128,270+(a+1)*90/b)
        i.y2=my+lengthdir_y(128,270+(a+1)*90/b)
        i.deep=128;
        i.loopside=2;
        i.c3=c_white;
        i.c4=c_white;
        i.depth=-2;
        }
    //R!
    for(a=0; a<b; a+=1)
        {
        i=instance_create(mx+lengthdir_x(128,a*90/b),my+lengthdir_y(128,a*90/b),upsand);
        i.x2=mx+lengthdir_x(128,(a+1)*90/b)
        i.y2=my+lengthdir_y(128,(a+1)*90/b)
        i.loopside=2;
        i.ydeep=yy-288;
        i.c3=c_white;
        i.c4=c_white;
        i.depth=-2;
        }
    //L
    for(a=0; a<b; a+=1)
        {
        i=instance_create(mx-lengthdir_x(128,270+a*90/b),my+lengthdir_y(128,270+a*90/b),sandline);
        i.loopside=1;
        i.x2=mx-lengthdir_x(128,270+(a+1)*90/b)
        i.y2=my+lengthdir_y(128,270+(a+1)*90/b)
        i.deep=128;
        i.c3=c_white;
        i.c4=c_white;
        i.depth=2;
        }
    //L!
    for(a=0; a<b; a+=1)
        {
        i=instance_create(mx-lengthdir_x(128,a*90/b),my+lengthdir_y(128,a*90/b),upsand);
        i.x2=mx-lengthdir_x(128,(a+1)*90/b)
        i.y2=my+lengthdir_y(128,(a+1)*90/b)
        i.loopside=1;
        i.ydeep=yy-288;
        i.c3=c_white;
        i.c4=c_white;
        i.depth=2;
        }
    //top;
    i=instance_create(xx,yy-288,sandline);
    i.y2=i.y;   
    i.deep=0;
    i.x2=xx+256;
    i.depth=-32;
    
    i=instance_create(xx,yy,sandline);
    loopFloor=i;
    xx+=480;
    i.x2=xx;
    i.y2=yy;
    i.depth=-3;    
    
    i=instance_create(xx,yy,sandline);//CONTINUE
    xx+=480;
    i.x2=xx;
    i.y2=yy;
    lx=xx;
    
    i=instance_create(xx-32,yy-1,objBoostPad);
    i.amount=48;
    
    i=instance_create(xx,yy,sandline);//CONTINUE
    xx+=128;
    yy-=32;
    i.x2=xx;
    i.y2=yy;
        
    i=instance_create(xx,yy,line);
    i.visible=1;
    i.x2=i.x;
    i.y2=yy+800;
    
    yy+=32;
    }
    else
    {
    xx=__view_get( e__VW.XView, 0 )+640;
    rx=xx;
    yy=objWaterFront.y-32;
    i=instance_create(xx,yy,verySpecialLine);
    firstLine=i;
    i.visible=1;
    
    i.x2=i.x;
    i.y2=yy+800;
      
    i=instance_create(xx,yy,sandline);
    xx+=192;
    firstGrass=i;
    i.x2=xx;
    i.y2=yy;
    
    i=instance_create(xx,yy,sandline);
    xx+=192;
    yy-=32;
    i.x2=xx;
    i.y2=yy;
    ry=yy;
        
    i=instance_create(xx,yy,sandline);
    xx+=2560;
    i.x2=xx;
    i.y2=yy;
    lx=xx;
    }
    }
if(subphs==3 && sonic.x>rx-40)
    {/*
    if(firstLine.i1!=-1)
        {
        //Destroy some endpoints to prevent flying high in the sky.
        with (firstLine.i1)
            instance_destroy();
        firstLine.i1=-1;
        }*/
    if (instance_exists(firstGrass) && variable_instance_exists(firstGrass, "i"))
    {
        var grass_collision = firstGrass.i;
        if (instance_exists(grass_collision) && variable_instance_exists(grass_collision, "i1"))
        {
            var grass_endpoint = grass_collision.i1;
            if (instance_exists(grass_endpoint))
            {
                with (grass_endpoint)
                    instance_destroy();
                grass_collision.i1 = -1;
            }
        }
    }
    }
    
if (subphs==3 && x>rx-40)
    {
    if (!firstCrash)
        soundstop(global.handle);
    invulnerable=150;
    phase=3;
    subphs=0;
    timer=0;
    if(sprite_index==sprcoredest)
        sprite_index=sprcorewreck;
    else
        sprite_index=sprcoredest;
    pri=0;
    i=instance_create(x+hspeed,y,objbigexp);
    i.image_angle=10;
    i.image_xscale=2;
    i.image_yscale=2;
    i.hspeed=20;
    i.vspeed=-10;
    i.depth=-2;
    soundplay(global.sndGunstar3);
    vspeed=-10;
    hspeed=48;
    dangerRadius=64;
    global.time=0.1;
    with sandline
        {
        if(loopside==1)
            i.on=0;
        }
    with upsand
        {
        if(loopside==1)
            i.on=0;
        }
    }
/* */
}
__b__ = action_if(phase==0 );
if __b__
{
var ok;
if (x<__view_get( e__VW.XView, 0 )-256)
    x=__view_get( e__VW.XView, 0 )-256;

if (angle2>0)
    angle2-=global.time*5;
else if (angle2<0)
    angle2+=global.time*5;
if (timer>180)
    {
    event_user(counter);
    counter=1-counter;
    }

ok=0;
if(instance_exists(tornado))
    {
    if (tornado.subphs==1 && x<tornado.x)
        {
        sonic.physics=1;
        sonic.able=1;
        tornado.subphs=2;
        }
    if (sonic.y>obj.y-64 && tornado.phase==2)
        {
        tornado.phase=0;
        tornado.subphs=0;
        }
    if(sonic.y<tornado.y)
        ok=1;
    }
if(ok)
    {
    bot1.goalx=sonic.x;
    bot1.goaly=sonic.y;
    }   
else
    {
    timer+=global.time;
    bot1.goalx=x-32+hspeed;
    bot1.goaly=y-128;
    }   
with (bot1)
    {
    a=point_direction(x,y,sonic.x,sonic.y)+1;
    if (a>180)
        a-=360;
    mainDir=approach(mainDir,15,a,1);
    a=-90;
    if (a>180)
        a-=360;
    secDir=approach(secDir,15,a,1);
    }
/* */
}
__b__ = action_if(phase<3);
if __b__
{
if (sonic.able==0 && phase==0)
    {
    if(hspeed>sonic.hspeed-8)
        hspeed-=global.time/4;
    }
else
    {
    hspeed+=global.time*limitize((limitize(sonic.x-480-x,48)/240+(48-hspeed)/30)/2,0.5);
    if (x>sonic.x && hspeed>sonic.hspeed-8 && phase!=1)
        hspeed-=global.time/2;
    if (x<__view_get( e__VW.XView, 0 )-128)
        hspeed+=global.time/4;
    }
/* */
}
__b__ = action_if(point_distance(x+hspeed*global.time,y/1.35+vspeed*global.time,sonic.x,sonic.y/1.35)<dangerRadius && sonic.able);
if __b__
{
hasHit=1;
if(sonic.invulnerable==0)
    {
    sonic.invulnerable=0;
    sonic.damaged=1;
    sonic.damagex=x;
    sonic.damagey=y;
    sonic.hspeed=hspeed+10;
    if(phase!=3 || subphs>=2)
        hspeed-=4;
    if(hspeed<0)
        hspeed=0;
    }
/* */
}
__b__ = action_if(phase==3);
if __b__
{
if(sonic.x>rx && sonic.x<lx && sonic.y>yy+32)
    {
    game_over();//You have been crushed
    }
/* */
}
action_set_relative(0);
/*  */
