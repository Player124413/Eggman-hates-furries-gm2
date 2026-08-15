action_set_relative(1);
blink=1-blink;
fourstage+=1;
if (fourstage>=4)
fourstage=0;

x+=hspeed*(2*global.time-1);
y+=vspeed*(2*global.time-1);
var __b__;
__b__ = action_if(phase==2 && atk==4 && subphs==1);
if __b__
{
var yy,d;
speed=0;

goal=point_direction(objJaw.x,y,sonic.x,sonic.y)-90;
thrust=4*(1-power(abs((timer-150)/150),1));

goal = goal mod 360;
while (goal>180) goal-=360;
if (goal<-130)
    goal=-130;
if (goal>130)
    goal=130;
while angle>=180 angle-=360;

angle=(angle*49+goal)/50;
  
soundvelocity(global.sndChopper,40*sin(angle),-400*(thrust-0.2));

d=1+point_distance(x,y,sonic.x,sonic.y)/1024;
sonic.hspeed-=global.time*lengthdir_x(thrust/12.5,angle+90)/d;
yy=lengthdir_y(thrust/4,angle+90)/d;
sonic.vspeed-=yy*global.time;

with (objfallring)
    {hspeed-=global.time*lengthdir_x(other.thrust/16,other.angle+90);
    vspeed-=global.time*lengthdir_y(other.thrust/16,other.angle+90);}
with (objFlashG2)
    {hspeed-=global.time*lengthdir_x(other.thrust/16,other.angle+90);
    vspeed-=global.time*lengthdir_y(other.thrust/16,other.angle+90);}

if(yy>0.4 && sonic.gnd==2)
    sonic.y-=yy*16;
global.mogen=yy;

with (supergenerator.thefloor.ik)
    {
    //if (sonic.gnd==0)
    frict=1;
    //else
    //    frict=1+abs(other.thrust*10);
    hspeed=-lengthdir_x(other.thrust*16,other.angle+90);
    x-=hspeed*global.time;
    x2-=hspeed*global.time;
    xi-=hspeed*global.time;
    xa-=hspeed*global.time;
    }
}
else
{
{
__b__ = action_if(life>0);
if __b__
{
{

a=goalx-x;
b=goaly-y;
if (abs(a)>150)
    a=sign(a)*150;
if (abs(b)>150)
    b=sign(b)*150;
    
vthrust=min(-0.1,(b-vspeed*40)/400-0.2);//gravity
hthrust=(a-hspeed*37)/400;

if (phase==1)
    {
    if (x<sonic.x+300)
        hthrust=(sonic.hspeed+6-hspeed)/30;
    else
        hthrust=(sonic.hspeed-6-hspeed)/20;
    if (hthrust<0 && hspeed<0)
        hthrust=0.25;
    }

if (point_distance(0,0,hthrust,vthrust)>0.27)//HARD LIMITER
    {hthrust=lengthdir_x(0.27,point_direction(0,0,hthrust,vthrust));
    vthrust=lengthdir_y(0.27,point_direction(0,0,hthrust,vthrust));}


if (abs(hthrust)>abs(vthrust)/2)
    hthrust=sign(hthrust)*abs(vthrust)/2;

    goal=point_direction(0,0,hthrust,vthrust)-90;
thrust=point_distance(0,0,hthrust,vthrust);

goal = goal mod 360;
    angle= angle mod 360;
    
    while (angle>270 && goal<90)
    angle-=360;
    while (angle<90 && goal>270)
    angle+=360;
    
    angle=(angle*9+goal)/10;
  
soundvelocity(global.sndChopper,40*sin(angle),-400*(thrust-0.2));
action_set_motion(angle+90, thrust*global.time*2);
}
}
__b__ = action_if(dead==1);
if __b__
{
{
__b__ = action_if(timer mod 30 <1 && random(2)<0.3);
if __b__
{
i=instance_create(x+26,y-22,objelectric);
i.depth=-6;
if (random(2)<1)
    soundplay(global.sndElectric1);
else
    soundplay(global.sndElectric2);
//mogen
}
}
}
else
{
action_set_vspeed(0.2*global.time*2);
}
}
}
__b__ = action_if(phase==1);
if __b__
{
if (x<__view_get( e__VW.XView, 0 )+480)
    x=__view_get( e__VW.XView, 0 )+480;
    
timer+=global.time;
}
__b__ = action_if(phase==2);
if __b__
{
if (invulnerable>0)
    {
    explostage+=global.time;
    if (explostage>=4)
        {
        explostage=0;
        soundstop(global.sndGunstar1);
        soundplay(global.sndGunstar1);
        i=instance_create(x-48+random(96),y-48+random(96),objmedexp);
        }
    visible=blink;
    invulnerable-=global.time;
    }
else
    {invulnerable=0;
    visible=1;}


if (atk==0)
    chopper_init();

if (atk==1)
    chopper_idle();

if (atk==5)
    chopper_flash();

if (atk==3)
    chopper_sweep();
    
if (atk==4)
    chopper_wind();

if (atk==6)
    chopper_die();
if (atk==2)
    {chopper_dangle();
    if(timer>150)
        {
        with objbouncer
            {
            if (on==0)
                {if(sonic.x>other.refX)
                    x=other.refX-256;
                else
                    x=other.refX+256;
                soundplay(global.sndShortDark);}
            on=1;
            y=(y*7+ystart)/8;
            }
        }
    }
else//HIDE BOUNCER
    {
    with objbouncer
        {
        if (on==1)
                soundplay(global.sndShortDark);
        on=0;
        }
    }
    
launchdir=launchdir mod 360;

while(gld>launchdir+180)
    gld-=360;
while(gld<launchdir-180)
    gld+=360;
        
if (launchdir<gld)
    {launchdir+=rotsp*global.time;}
    
if (launchdir>gld)
    {launchdir-=rotsp*global.time;}
    
if(armgoal!=-1 && dead==0)
    {
    armgoal+=180;
    with(objJaw)
        {
        
        dir[0]=dir[0] mod 360;
        
        while(other.armgoal>dir[0]+180)
            other.armgoal-=360;
        while(other.armgoal<dir[0]-180)
            other.armgoal+=360;
                
        if (dir[0]<other.armgoal)
            {dir[0]+=other.rotsp2*global.time;}
            
        if (dir[0]>other.armgoal)
            {dir[0]-=other.rotsp2*global.time;}
            
        if(other.atk==4 && other.subphs==1)
            {
            other.x=x+lengthdir_x(dist,dir[0]);
            other.y=y+lengthdir_y(dist,dir[0]);
            }
        else
            {
            goal=dir[0]+180;
            
            goal = goal mod 360;
            final= final mod 360;
            
            while (final>270 && goal<90)
            final-=360;
            while (final<90 && goal>270)
            final+=360;
            final=(final*9+goal)/10;
            }
        }
    }
    
//try to prevent the jaw from tossing sonic out of the level
if(dead==0)
    {if (sonic.x<refX-128-256)
       sonic.x=refX-128-256+16;
    if (sonic.x>refX+128+256)
        sonic.x=refX+128+256-16;}
    
if (dead==0)    
    chopper_crashwalls();

//Sloppy attempt to prevent outside walls stuka:
if (objJaw.x<=refX-128-256+32 && objJaw.xprevious<=refX-128-256+32 && objJaw.gnd!=0)
    {objJaw.x=refX-128-256+32;
    other.x=objJaw.x+lengthdir_x(objJaw.dist,objJaw.dir[0]);
    other.hspeed=-other.hspeed;}
if (objJaw.x>=refX+128+256-32 && objJaw.xprevious>=refX+128+256-32 && objJaw.gnd!=0)
    {objJaw.x=refX+128+256-32;
    other.x=objJaw.x+lengthdir_x(objJaw.dist,objJaw.dir[0]);
    other.hspeed=-other.hspeed;}

with objbouncer
        {
        if (on==0)
                y=(y*7+ystart+8)/8;
        }
}
__b__ = action_if(ik!=-1);
if __b__
{
ik.x=x;
ik.y=y;
with (ik)
    event_perform(ev_alarm,0);
ik.hspeed=hspeed;
ik.vspeed=vspeed;
}
__b__ = action_if(ia!=-1);
if __b__
{
ia.x=x+lengthdir_x(60,angle+90);
ia.y=y+lengthdir_y(60,angle+90);
ia.image_xscale=1.66;
ia.image_angle=angle;
}
if (ib!=-1)
    {
    ib.x=x+hspeed+lengthdir_x(72,angle+90);
    ib.y=y+vspeed+lengthdir_y(72,angle+90);
    ib.image_angle=angle;
    }
__b__ = action_if(instance_exists(objassessment) && phase!=1);
if __b__
{
objassessment.x=ib.x;
objassessment.y=ib.y;
}
action_set_relative(0);
