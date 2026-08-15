action_set_relative(1);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

image_index-=(1-global.time)*image_speed;

eightstage+=1;
if (eightstage>=8)
    eightstage-=8;
    
dustTimer-=global.time;
if (dustTimer<=0)
    {
    i=instance_create(x-random(32),objSuperGrass.y,objDust);
    i.alpha=max(0,1-(384-16-y)/160);
    dustTimer+=3;
    }
var __b__;
__b__ = action_if(invulnerable>0);
if __b__
{
{
__b__ = action_if(spinImpair<=0);
if __b__
{
image_angle += (-16+lengthdir_x(4,image_angle-45))*4*global.time;
}
{
action_set_relative(0);
sprite_index = sprSuperEgg3;
action_set_relative(1);
}
spinImpair += -global.time;
{
action_set_relative(0);
action_set_alarm(2, 0);
action_set_relative(1);
}
}
}
__b__ = action_if(invulnerable<=0);
if __b__
{
{
__b__ = action_if(makeShock>=0);
if __b__
{
if (makeShock==0)
    i=instance_create(x,y,objElectricWarning);
makeShock+=global.time;
sprite_index=sprSuperEgg7;

if (makeShock<7)
    {
    d=random(360);
    s=32+random(32);
    instance_create(x+lengthdir_x(s,d),y+lengthdir_y(s,d),objEvilChargeBalls);
    }

if (makeShock==32)
    {
    i=instance_create(x,y,objElectricWall);
    soundplay(global.sndShockWave);
    }
if (makeShock>31)
    {
    sprite_index=sprSuperEgg6;
    
    gy=objSuperSonic.y;
    if (gy<y-8 && y >32)
        y-=global.time*sp;
    if (gy>y+8 && y < 384-32)
        y+=global.time*sp;
    }
if (makeShock>60)
    {
    sprite_index=sprSuperEgg1;
    }
if (makeShock>105 || (makeShock>50 && objSuperSonic.hit>0))
    {
    makeShock=-1;
    decision=0;
    lProg=0;
    }
}
else
{
var obj;
obj=objSuperSonic;

if (cos(degtorad(image_angle))<0.8)
    image_angle+=(-16+lengthdir_x(4,image_angle-45))*4*global.time;
else
    image_angle=0;

timer+=global.time;

if(counter mod 2 == 1 && returnTimer==0 && (decision==-1 || lProg>=30))
    {
    if(lProg>12)
        sprite_index=sprSuperEgg7;
    if (obj.x<=36)
        sprite_index=sprSuperEgg1;
    if(lProg>35-counter*5 && obj.x>36 && obj.x<=x-172)
        {
        if(objSuperSonic.hit==0)
            {
            sprite_index=sprSuperEgg6;
            i=instance_create(x,y,objElectricWall);
            i.minimum=170+(25*(1+sin(timer/(43-(counter-1)*8))));
            i.maximum=i.minimum+330;
            }
        lazor=0;
        decision=-1;
        lProg=0;
        }
    }
if(lProg>25 || decision==-1)// && counter mod 2 == 0)
    {
    if(obj.x>x-172)
        makeShock=0;
    }


lProg+=global.time;

if(lProg==60)
    {
    instance_create(x,y-16+random(32),objSparkly);
    }
if (lProg>90)
    {
    lazor=0;
    decision=-1;
    lProg=0;
    if(obj.x>36)
        {
        if (obj.y>384-96 && counter==4)
            {
            decision=1;
            }
        else 
            {
            decision=0;
            }
        }
    }
    
if (x<xs-4)
    x+=global.time*sp;
else if (x>xs+4)
    x-=global.time*sp;
else
    {
    if(returnTimer>0)
        {
        if (returnTimer==60)
            sprite_index=sprSuperEgg1;
        lProg=60;
        decision=-1;
        if (returnTimer==45)
            {
            alarm[0]=0;
            sprite_index=sprSuperEgg6;
            soundplay(global.sndRoar2);
            objSuperFG.light=0.5;
            soundplay(global.sndGunstar3);
            auraColor=c_white;
            }
        returnTimer-=global.time;
        if (returnTimer<=0)
            {
            objSuperSonic.able=1;
            objSuperSonic.stayBack=0;
            
            sprite_index=sprSuperEgg1;
            if(counter mod 2 == 0 && counter>0)
                {
                i=instance_create(x,y,objProxyEgg);
                i.upper=1;
                i.nextY=32;
                i=instance_create(x,y,objProxyEgg);
                i.upper=0;
                i.nextY=384-32;
                }
            }
        }
    else
        {
        if(counter mod 2 == 0)
            gy=obj.y;
        else
            gy=240;
        if (gy<y-8 && y >32)
            y-=global.time*sp;
        if (gy>y+8 && y < 384-32)
            y+=global.time*sp;
        }
    }

if(decision>=0)
    event_user(decision);
}
}
}
{
action_set_relative(0);
blink = !blink;
action_set_relative(1);
}
__b__ = action_if(point_distance(x,y,objSuperSonic.x,objSuperSonic.y)<radius+16);
if __b__
{
    if(invulnerable<=0)
        {
        counter+=1;
        makeShock=-1;
        soundplay(global.sndBreakDown);
        decision=-1;
        lazor=0;
        lProg=0;
        invulnerable=1;
        objSuperFG.light=0.5;
        objSuperFG.lightDim=20;
        
        objCraft3.phase=1;
        auraColor=c_black;
        
        with objProxyEgg
            event_user(0);
        //objSuperSonic.able=0;
        objSuperSonic.stayBack=1;
        
        repeat(12)
            {
            i=instance_create(x,y,objSparkly);
            i.direction=random(360);
            i.speed=8;
            i.image_speed=0.3;
            }
            
        if(counter==5)
            {goToLast();
            exit;}
        }
superHit();
}
__b__ = action_if(exploding);
if __b__
{
var ok;
if(random(4/global.time)<1)
    {
    hspeed=-4+random(8);
    vspeed=-4+random(8);
    motion_add(point_direction(x,y,720,192),4);
    soundplay(global.sndHit);
    i=instance_create(x-64+random(128),y-64+random(128),objSuperExplosion);
    }
ok=0;
if(objCraft3.timer mod 4 == 0 && (global.zeroRingMode==0 || objSuperSonic.rings<20))
    ok=1;
if(objSuperSonic.rings<40-global.zeroRingMode*33 && objCraft3.timer mod 2 == 0)
    ok=1;
if(objSuperSonic.rings<20-global.zeroRingMode*17)
    ok=1;
if(ok)
    {
    i=instance_create(x,y,objSuperRing);
    i.hspeed=-spd-6+random(12);
    i.vspeed=6-random(12);
    }


}
speed-=global.time/15;
if(speed<0)
    speed=0;
action_set_relative(0);
