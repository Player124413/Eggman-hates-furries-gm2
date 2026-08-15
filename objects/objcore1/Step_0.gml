action_set_relative(1);
speed-=global.air*speed*speed*global.time;

x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
var __b__;
__b__ = action_if(instance_exists(sonic));
if __b__
{
vspeed=(vspeed*999+(sonic.y-y))/1000;
}
action_set_vspeed(global.grav/global.meter*global.time);
if(gnd==2)
    {

    if (uy<0)
        {ux=-ux;
        uy=-uy;}
        
    if(ny<-0.25)
        {
        soundplay(global.sndClank);
        a=instance_create(x,y,objcore2);
        a.nnx=nnx;
        a.nny=a.y;
        instance_destroy();
        }
    else
        {
        a=floor(random(3));
        if (a==0)
        soundplay(global.sndMetal1);
        else if (a==1)
        soundplay(global.sndMetal2);
        else soundplay(global.sndMetal3);
        repeat(40)
            {
            i=instance_create(x-nx*radius+ux*random(40),y-ny*radius+uy*random(40),objspark);
            i.hspeed+=hspeed/2+nx*4;
            i.vspeed+=vspeed/2+ny*4;
            i.depth=-1;
            }
        }
    //speed=speed/1.01;
    hspeed+=nx*(0.5)*speed/12;
    vspeed+=ny*(0.5)*speed/12;
    }
    
if(gnd>0)
    {gnd-=1;}
__b__ = action_if(phase==0);
if __b__
{
var a,b;

if (y>nny-1280)
{
counter+=1;

a=0;
b=1280;

i=instance_create(nnx+128,nny,metaside);
i.x2=i.x+a;
i.y2=i.y+b;
    
i=instance_create(nnx-128,nny,metaside);
i.x2=i.x+a;
i.y2=i.y+b;
i.deep=-2560;

with (metaside)
    {
    if (y2<__view_get( e__VW.YView, 0 )-320)
        instance_destroy();
    }

lastnnx=nnx;
lastnny=nny;
nnx+=a;
nny+=b;
}

}
__b__ = action_if(phase==1);
if __b__
{
var a,b,hh;

hh=256;

phase=2;
counter+=1;

a=0;
b=y+9600;

i=instance_create(nnx+128,nny,metaside);
i.x2=i.x;
i.y2=b-hh;

i=instance_create(nnx+128,b-64,metaside);
i.x2=i.x;
i.y2=b;
    
i=instance_create(nnx-128,nny,metaside);
i.x2=i.x;
i.y2=b;
i.deep=-2560;
//pynt:
i=instance_create(nnx-128,b,greatside);
i.x2=i.x-2560;
i.y2=b+1280;
i=instance_create(nnx+128,b,greatside);
i.x2=i.x+2560;
i.y2=b+1280;
i=instance_create(nnx-128,b,greatbrown);
i.x2=nnx+128;
i.y2=b+1280;
i.c3=make_color_rgb(16,24,32);
i.c4=i.c3;
//OK:
i=instance_create(nnx+128,b-64,metaline);
i.x2=nnx+512;
i.y2=b-64;
i.deep=0;
i.c3=c_black;
//OK:
i=instance_create(nnx+512,b-64,finalgenerator);
i.hh=hh-64;
//OK:
i=instance_create(nnx+128,b-hh,metaline);
i.x2=nnx+512;
i.y2=b-hh;
i.deep=0;
i.c3=c_black;
//OK:
i=instance_create(nnx-128,b,metaline);
i.x2=nnx+128;
i.y2=b;
i.deep=0;
i.c3=c_black;
}
timer += global.time;
__b__ = action_if(timer<60);
if __b__
{
{
action_set_relative(0);
visible = 1-visible;
action_set_relative(1);
}
}
else
{
{
action_set_relative(0);
visible = 1;
action_set_relative(1);
}
}
image_angle += roll;
action_set_relative(0);
