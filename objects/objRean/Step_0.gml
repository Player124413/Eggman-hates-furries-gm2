
x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);
image_index-=image_speed*(1-global.time);


timer+=2*global.time;
if (timer>=60)
    timer-=60;
var __b__;
__b__ = action_if(phase==0);
if __b__
{
var tmpsp;
tima+=global.time;

tmpsp=1;
if(image_angle>0)
    image_angle-=tmpsp*global.time;
if(image_angle<0)
    image_angle+=tmpsp*global.time;

tmpsp=1;
if(wingAngle>0)
    wingAngle-=tmpsp*global.time;
if(wingAngle<0)
    wingAngle+=tmpsp*global.time;

sprite_index=sprReanFloat;

tmpsp=1;

if (speed>0)
    {
    speed-=tmpsp*global.time;
    if(speed<=0)
        speed=0;
    }
    
tmpsp=1;
if(y>ystart)
    y-=tmpsp*global.time;
if(y<ystart)
    y+=tmpsp*global.time;
if(x>xstart+__view_get( e__VW.XView, 0 ))
    x-=tmpsp*global.time;
if(x<xstart+__view_get( e__VW.XView, 0 ))
    x+=tmpsp*global.time;
    
subphs=0;
tima=0;
forceReturn=0;
}
__b__ = action_if(phase==1);
if __b__
{
factor=0.5;
tima+=global.time;
if (subphs==0)
    {if (wingAngle>-38)
        {
        wingAngle-=global.time*1.5;
        }
    if (tima<96*factor)
        {
        if (sonails.y>maxY)
            maxY=sonails.y;
        maxY=max(maxY,minY);
        vspeed+=global.time*limitize(((maxY-32+yplus-vspeed*8-y)/48),1);
        
        }
    if (tima==96*factor)
        {
        for(a=0; a<6; a+=1)
            {
            i=instance_create(x+lengthdir_x(64,a*60),y+lengthdir_y(64,a*60),ult_chargeBalls);
            i.depth=depth+1;
            }
        soundplay(global.sndDarkness);
        sprite_index=sprReanBack;
        hspeed=-1;
        vspeed=0;
        i1.flap=2;
        i2.flap=2;
        }
    if (tima==96*factor+18)
        {
        soundplay(global.sndDash);
        sprite_index=sprReanThrust;
        hspeed=20;
        vspeed=0;
        i1.flap=1;
        i2.flap=1;
        i1.timer=1.66*i1.f;
        i2.timer=1.66*i2.f;
        }
    if (tima>96*factor+8 && (x>__view_get( e__VW.XView, 0 )+320 && x>sonails.x+96))
        {
        subphs=1;
        }
    }
if (subphs==1)
    {
    if(wingAngle<90-38)
        {
        image_angle+=2;
        direction+=2;
        wingAngle+=2;
        }
    if (y<-256)
        {
        subphs=2;
        //i1.flap=1;
        //i2.flap=1;
        y=ystart;
        x=__view_get( e__VW.XView, 0 )-96;
        hspeed=2;
        vspeed=0;
        image_angle=0;
        wingAngle=0;
        sprite_index=sprReanFloat;
        }
    }
if (subphs==2)
    {
    if (x>__view_get( e__VW.XView, 0 )+94)
        {
        x=__view_get( e__VW.XView, 0 )+96;
        hspeed=0;
        subphs=0;
        maxY=0;
        tima=0;
        if (forceReturn)
            phase=0;
        }
    }
}
accumulant+=__view_get( e__VW.XView, 0 )-lastVX;
lastVX=__view_get( e__VW.XView, 0 );

x+=global.time*hacc;
accumulant-=global.time*hacc;

hacc=approach(hacc,50,accumulant-hacc*12,1);
__b__ = action_if(phase==0 || (phase==1 && ((uctrl.phase==6 && uctrl.camLock!=-1) || (uctrl.phase==14 && uctrl.camLock!=-1) || (uctrl.phase==1 && uctrl.camLock!=-1) || uctrl.phase==11)));
if __b__
{
__b__ = action_if(point_distance(x,y+8,sonails.x,sonails.y)<24+sonails.radius);
if __b__
{
ult_die();
}
}
