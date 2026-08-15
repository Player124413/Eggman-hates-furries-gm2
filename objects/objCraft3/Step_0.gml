gunimg+=gunsp*global.time;
if (gunimg>=3)
gunimg-=3;

tailimg+=global.time;
if (tailimg>=2)
    tailimg-=2;

tailanim+=0.5*global.time;
if (tailanim>=7)
tailanim-=7;

dustTimer-=global.time;
if (dustTimer<=0)
    {
    i=instance_create(x-48-random(48),objSuperGrass.y,objDust);
    i.alpha=max(0,1-(384-16-y)/160);
    dustTimer+=3;
    }
    
blink=!blink;
var __b__;
__b__ = action_if(phase==0);
if __b__
{
{
xx=objSuperSonic.x-192;
yy=objSuperSonic.y-24*(objSuperSonic.y-160)/160;
f=point_distance(x,y,xx,yy)/10;
timer = 0;
}
}
__b__ = action_if(phase==1);
if __b__
{
{
var endT;
endT=300;


xx=objSuperEgg.x-320;
yy=objSuperEgg.y-40;
f=point_distance(x,y,xx,yy)/100;
timer+=global.time;

if (timer==56)
    pull=1;
if (timer==58)
    soundplay(global.sndPull);
if (timer==60)
    soundplay(global.sndSpinUp);
if (timer>60 && gunsp<2 && timer<180)
    {
    gunsp+=2*global.time/27;
    }
if (timer>60 && gunsp>=2 && timer<180)
    {
    if(timer mod 2 == 1)
    objSuperEgg.auraColor=c_black;
    if(timer mod 2 == 0)
        {objSuperEgg.auraColor=c_aqua;
        soundplay(global.sndMiniGun);
        objSuperEgg.spinImpair=1;
        firing=1;}
    else
        {firing=0;}
    if(timer mod 4 == 0)
        {
        soundplay(global.sndHit);
        repeat(2)
            {i=instance_create(objSuperEgg.x-16-random(32),objSuperEgg.y-16+random(32),objSuperHit);
            i.image_angle=random(360);
            i.image_xscale=0.5+random(1);
            i.image_yscale=i.image_xscale;

            }
        }
    }
if (timer==178)
    {
    objSuperEgg.exploding=1;
    soundplay(global.sndRoar);
    }
if (timer==178 || (timer>178 && timer mod 86 == 0 && timer<endT))
    {soundplay(global.sndGunstar3);
    for(k=0; k<360; k+=360/12)
        {
        i=instance_create(objSuperEgg.x,objSuperEgg.y,objSuperExplosion);
        i.direction=k;
        i.speed=12;
        i.hspeed+=6;
        }
    }
    
if (timer==180)
    {soundplay(global.sndSpinDown);
    pull=0;}
if(timer>180)
    {
    if(gunsp>0)
        gunsp-=2*global.time/27;
    objSuperEgg.auraColor=c_black;
    
    xx=-128;
    yy=y;
    f=(f*10+global.time*point_distance(x,y,xx,yy)/32)/(10+global.time);
    }
    
if (timer==endT)
    {
    objSuperEgg.sprite_index=sprSuperEgg2;
    objSuperEgg.alarm[0]=0;
    objSuperEgg.exploding=0;
    objSuperEgg.image_speed=0.2;
    objSuperEgg.lProg=0;
    objSuperEgg.invulnerable=0;
    objSuperEgg.speed=0;
    objSuperEgg.returnTimer=60;
    objSuperEgg.decision=-1;//Might change after a few hits
    
    phase=0;
    }
}
}
soundvolume(global.sndEngine2,0.85);
booster=2;
if (xx<x-4)
    {booster=1;
    //soundvolume(global.sndEngine2,0.83);
    }
if (xx>x+4)
    {booster=3;
    //soundvolume(global.sndEngine2,0.87);
    }
action_move_point(xx, yy, f);
