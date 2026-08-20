action_set_relative(1);
action_set_vspeed(global.grav/global.meter*global.time);
image_angle += spin*global.time;
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

if (x>=lastFire+64)
    {
    i=instance_create(x+16,yy,objFireWall);
    i.blink=blinkFire;
    lastFire=x-4;
    }
else
    blinkFire=!blinkFire;


burnStage+=global.time/2;
if (burnStage>=12)
    burnStage=0;
//DIE    
if(y>=yy-49)
    {
    y=yy-48;
    if(vspeed>1.5)
        {
        repeat(16)
            {
            i=instance_create(x-16+random(32),y+64,objspark);
            i.hspeed=hspeed+random(4);
            i.vspeed=-random(4);
            }
            
        vspeed=-vspeed*0.5;
        if(vspeed>-1)
            {
            soundvolume(global.sndMetalScrape,0.9);
            soundloop(global.sndMetalScrape);
            vspeed=0;
            soundplay(global.sndExplosion);
            instance_create(x+40,y-40,objmedexp);
            subphs=1;
            }
        spin=(spin-360*hspeed/(128*pi))/2;
        soundplay(global.sndClank);
        }
    else
        {
        vspeed=0;
        if (hspeed>0)
            {
            if(brakeX==-1)
                brakeX=x+power(hspeed,2);
            hspeed-=global.time/2;
            i=instance_create(x-16+random(32),y+64,objspark);
            i.hspeed=hspeed+random(4);
            i.vspeed=-random(2);
            }
        else
            {
            if (spin!=0)
                soundstop(global.sndMetalScrape);
            hspeed=0;
            }
        spin=-360*hspeed/(128*pi);
        }
    }
if(__view_get( e__VW.XView, 0 )+640>xx)
    {
    if(brakeX==-1)
        {
        i=instance_create(xx,yy,sandline);
        xx+=480;
        i.x2=xx;
        i.y2=i.y;
        }
    else if (brakeX!=-2)
        {
        i=instance_create(xx,yy,sandline);
        xx=brakeX;//That's where we'll stop
        i.x2=xx;
        i.y2=i.y;
        
        instance_create(xx,yy,grassgenerator);
        
        brakeX=-2;
        }
    
    with (objFireWall)
        {
        if(x<min(other.x,__view_get( e__VW.XView, 0 ))-1280)
            instance_destroy();
        }
    with (sandline)
        {
        if(x2<min(other.x,__view_get( e__VW.XView, 0 ))-1280)
            instance_destroy();
        }
    }
var __b__;
__b__ = action_if(instance_exists(sonic) && (point_distance(x,y,sonic.x,sonic.y)<64 || point_distance(x+8,y-40,sonic.x,sonic.y)<40));
if __b__
{
sonic.damaged=1;
sonic.damagex=x;
sonic.damagey=y;
sonic.hspeed=hspeed+12;
}
action_set_relative(0);
