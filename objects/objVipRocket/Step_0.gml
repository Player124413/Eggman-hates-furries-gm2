bigBoom = 0;
timer+=global.time;

if (obj>-1)
    {
    t=4*point_distance(x,y,obj.x,obj.y)/(1+speed);
    gx=obj.x+xx+obj.hspeed*t;
    gy=obj.y+yy+obj.vspeed*t;
    }
else
    {
    gx=xx;
    gy=yy;
    }
dir=point_direction(x,y,gx,gy);
if (timer<20)
    {
    speed-=global.time/5;
    if (speed<0)
        speed=0;
    vspeed+=0.5*global.time;
    }

if (timer>5)
    {
    ia=image_angle;
    if (lengthdir_x(1,image_angle-dir)<0 || lengthdir_y(1,image_angle-dir)<0)
        image_angle-=turnsp*global.time;
    if (lengthdir_y(1,image_angle-dir)>0)
        image_angle+=turnsp*global.time;
    if (ia==image_angle)
        image_angle=dir;
    }
if (timer==20)
    {
    image_speed=2;
    bigBoom=1;
    soundplay(global.sndGunFast);
    }
if (timer>=20)
    {
    d=image_angle;
    s=20+timer/2;
    hspeed=approach(lengthdir_x(s,d),32,hspeed,1);
    vspeed=approach(lengthdir_y(s,d),32,vspeed,1);
    }
    
fixSpeeds();
if (point_distance(x,y,gx,gy)<speed || gnd>0)
    {
    i=instance_create(x+hspeed,y+vspeed,objbigexp);
    i.hspeed=hspeed*0.5;
    i.vspeed=vspeed*0.5;
    if(obj>-1)
        vspeed-=6;
    
    soundplay(global.sndGunstar1)
    
    if (instance_number(objVipRocket)==1 && instance_exists(objIntroSonic))
        {
        global.time=0.1;
        with (objIntroSonic)
            {
            soundplay(global.sndLoseRing);
            visible=0;

            i=instance_create(x,y,objIntroHurt);
            i.hspeed=hspeed-16;
            i.vspeed=vspeed-4;
            j=instance_create(x,y,objIntroRing);
            j.hspeed=i.hspeed+4;
            j.vspeed=i.vspeed-1;
            }
        }
    
    instance_destroy();
    }
