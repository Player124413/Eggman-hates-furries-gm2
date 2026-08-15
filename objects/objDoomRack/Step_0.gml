var __b__;
__b__ = action_if(charging);
if __b__
{
var c;
c=sin(pi*timer/30);
if (charge<2)
    charge+=global.time*spd*2/1350;

rackAngle+=(0.2+charge*(16+2*c))*global.time;

soundfrequency(global.sndDarkO,0.15+0.4*charge+0.05*c);

soundvolume(global.sndChopper,charge/2);

second+=global.time/30;
if (second>=1)
    {second-=1;
    if (chargeSeconds>0)
        chargeSeconds-=1;
    else
        {
        if (!instance_exists(objInstaDie) && doom.phase<3)
            instance_create(x,y,objInstaDie);
        }
    }
}
else
{
rackAngle+=(0.2+charge*(16))*global.time;
if (charge>0)
    charge-=global.time/8;
else
    charge=0;
}

if (rackAngle>=360)
    rackAngle-=360;
    
timer+=(1+5*power(charge,2))*global.time;
if (timer>=60)
    {
    timerReset=1;
    timer-=60;
    }
else
    timerReset=0;
    
fourstage+=1;
if (fourstage>=4)
    fourstage-=4;
__b__ = action_if(doom.phase==2);
if __b__
{
var t;
lastlazor=lazor;
t=0;

lazortime+=global.time;
if (lazortime>150)
    lazortime-=150;

if (doom.life<2)    //THIS STUFF IS COPIED TO DUCKING OBJECTFG
    {
    if ((lazortime>60 && lazortime<140))
        t=1;
    }
else if (doom.life<3)
    {
    if ((lazortime>20 && lazortime<60) || (lazortime>70 && lazortime<120))
        t=1;
    }
else if (doom.life<4)
    {
    if ((lazortime>13 && lazortime<37) || (lazortime>40 && lazortime<77) || (lazortime>80 && lazortime<107))
        t=1;
    }
else if (doom.life<5)
    {
    if ((lazortime>10 && lazortime<50) || (lazortime>60 && lazortime<67) || (lazortime>125))
        t=1;
    }

if (doom.invulnerable>0)
    {t=0; timer=0; lazortime=0;}

    if(t)
        {
        if (lazor<1)
            {
            if(random(3)<1)
                {
                a=random(360);
                i=instance_create(x,y,objElArc);
                i.x2=x+lengthdir_x(128,a);
                i.y2=y+lengthdir_y(128,a);
                }
            if(lazor==0)
                soundplay(global.sndFastCharge);
            lazor+=global.time/15;
            if(lazor>=1)
                {soundplay(global.sndBigGun);
                soundstop(global.sndFastCharge);
                lazor=1;}
            }
        }
    else
        {
        if(lazor>0)
            {
            soundstop(global.sndBigGun);
            soundplay(global.sndAfterBurnerStop);
            repeat(8)
                {
                a=random(360);
                i=instance_create(x,y,objElArc);
                i.x2=x+lengthdir_x(128,a);
                i.y2=y+lengthdir_y(128,a);
                }
            }
        lazor=0;
        }
}
else
{
lazor = 0;
}
