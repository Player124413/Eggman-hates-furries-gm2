var __b__;
__b__ = action_if(phase==-1);
if __b__
{
{
sx=x;
sy=y;
xx=x;
yy=y;

a=240;
b=0;
i=instance_create(xx,yy,greatbrown3);
i.tex=background_get_texture(bgSand);
i.x2=xx+a+48;
i.y2=yy+2560;
i.c1=c_white;
i.c2=c_white;
i.c3=c_black;
i.c4=c_black;
i.depth=7;
event_user(2);
i.depth-=1;
i.deep=0;

rx=xx;

xx+=48;

a=128;
b=0;
i=instance_create(xx,yy,greatbrown2);
i.tex=background_get_texture(bgSand);
i.depth=7;
i.c3=c_white;
i.c4=c_black;
i.x2=xx+a+2560;
i.y2=yy+2560;

event_user(2);
i.depth-=1;
i.deep=0;
muLine=i;

i=instance_create(xx+2560,yy,greatbrown2);
i.tex=background_get_texture(bgSand);
i.depth=7;
i.c3=c_white;
i.c4=c_black;
i.x2=xx+5120;
i.y2=yy+2560;

i=instance_create(xx,yy-2560,greatbrown2);
i.depth=8;
i.c4=i.c3;
i.x2=xx+640;
i.y2=yy;
i=instance_create(xx,yy,line);
i.x2=i.x;
i.y2=yy-2560;
phase=0;
xx=rx+24;

instance_create(xx-48,yy+128,objFish);

lx1=xx+24;
ly1=yy;
lx2=xx-24;
ly2=yy;

r=24;
len=512;
dir=270;
event_user(4);
dir-=5;
len=64;
event_user(4);
r=32;
dir-=5;
event_user(4);
dir+=90;
r=64;
lx1=lx2;
ly1=ly2;
lx2=lx1-16;
ly2=ly2+128;
xx=lx1;
yy=ly1+64;
len=64*cos(degtorad(10))-r*tan(degtorad(10));
event_user(4);
i.tex=background_get_texture(bgTunnelT);
i.left=0;
i.down=1;
len=64;
dir+=5;
event_user(4);
dir=0;
len=64;
instance_create(xx-16,yy-32,objring);
instance_create(xx-40,yy-34,objring);
instance_create(xx-64,yy-36,objring);
event_user(4);
i=instance_create(xx-32,yy+r,objBubbler);
event_user(4);
i.up=1;
i.tex=background_get_texture(bgTunnelT2);
i.right=0;

xx=lx2-32;
yy=ly2;
lx1=lx2;
ly1=ly2;
lx2=lx1-64;
r=24;
dir=270;
len=64;
event_user(4);
len=128;
event_user(4);

// Entry to the large Water loop. Put the assisted pad before the first curved
// segment so Sonic crosses the converted cap instead of hitting it as a wall.
var water_loop_entry = instance_create((lx1 + lx2) / 2, (ly1 + ly2) / 2, objBoostPad);
water_loop_entry.amount = 48;
water_loop_entry.image_angle = 270;
water_loop_entry.entryAssist = true;

len=48;
for(dir=270; dir<360+30; dir+=10)
    {
    ppx=lx2;
    ppy=ly2;
    event_user(4);
    if (dir==330)
        {
        i=instance_create((lx2+ppx)/2,(ly2+ppy)/2,objBoostPad);
        i.amount=48;
        i.image_angle=dir;
        i.entryAssist=true;
        }
    }
while(dir>360)
    {
    event_user(4);
    dir-=10;
    }
len=128;
r=32;
event_user(4);
len=64;
event_user(4);
i.tex=background_get_texture(bgTunnelT);
i.left=0;
rx=lx1;
ry=ly1;
len=96;
event_user(4);
len=64;
event_user(4);
r=24;
event_user(4);
i.up=1;
i=instance_create(xx,yy,objSpike);
i.image_angle=180;

xx=rx-32;
yy=ry;
lx1=xx-32;
ly1=yy;
lx2=xx+32;
ly2=yy;
r=32;
len=16;
dir=90;
event_user(4);

rx=lx1;
ry=ly1;
xx=rx;
yy=ry-32;
lx1=xx;
lx2=xx;
ly1=ry;
ly2=ry-64;

r=24;
dir=180;
len=48;
event_user(4);
i.up=1;

xx=rx;
yy=ry-32;
lx2=xx;
lx1=xx;
ly2=ry;
ly1=ry-64;

r=32;
dir=0;
len=64;
event_user(4);
i.tex=background_get_texture(bgTunnelT2);
i.right=0;

r=24;
len=96;
event_user(4);

len=128;
event_user(4);
len=32;
for(dir=360; dir>270; dir-=22.5)
    {
    event_user(4);
    }
dir=270;
len=64;
event_user(4);

for(dir=270; dir<360; dir+=10)
    {
    event_user(4);
    }
len=256;
event_user(4);

len=112;
event_user(4);

len=80;
event_user(4);
i.tex=background_get_texture(bgTunnelT);
i.left=0;
rx=lx1;
ry=ly1;

len=96;
event_user(4);

i=instance_create(xx-32,yy+r,objBoostPad);
i.amount=40;

len=32;
for(dir=10; dir<180; dir+=10)
    {
    event_user(4);
    }
len=64;
event_user(4);
fx=lx2;
fy=ly2;
i.tex=background_get_texture(bgTunnelT2);
i.right=0;
len=32;
for(dir=190; ly2<ry-16; dir+=10)
    {
    event_user(4);
    }
i.x3=rx;
i.y3=ry;
i.x4=rx-80;
i.y4=ry;

//sonic.x=fx;
//sonic.y=fy;

xx=fx+32;
yy=fy;
lx1=xx-32;
ly1=yy;
lx2=xx+32;
ly2=yy;

dir=90;
len=32;
r=32;
event_user(4);

rx=lx1;
ry=ly1;

xx=rx;
yy=ry-32;
lx2=xx;
lx1=xx;
ly2=ry;
ly1=ry-64;

r=32;
dir=0;
len=64;
event_user(4);
i.tex=background_get_texture(bgTunnelT2);
i.right=0;
i.up=1;

dir=180;
xx=rx;
yy=ry-32;
lx1=xx;
lx2=xx;
ly1=ry;
ly2=ry-64;
r=24;
event_user(4);

i=instance_create(xx-32,yy+r,objBoostPad);
i.image_xscale=-1;

len=128;
event_user(4);
len=32;
for(dir=180; dir>=90; dir-=22.5)
    {event_user(4);
    if(r<32) r+=4;}
r=32;

dir=90;
event_user(4);

len=64;
xx=lx1;
yy=ly1-64;
dir=0;
lx1=xx;
ly1=yy-64;
lx2=xx;
ly2=yy+64;
r=64;
event_user(4);
i.right=0;
i.tex=background_get_texture(bgTunnelT2);
i.down=1;
dir+=5;
event_user(4);
dir+=5;
ppx=lx2;
ppy=ly2;
event_user(4);
i=instance_create((lx2+ppx)/2,(ly2+ppy)/2,objBubbler);
i.image_angle=dir;
dir-=5;
event_user(4);
dir=0;
event_user(4);
i.up=1;
i.left=0;
i.tex=background_get_texture(bgTunnelT);

i=instance_create(xx-32,yy+64,objbouncer);
i.image_angle=90;
i.amount=62;

xx=xx-32;
yy=yy-64;
lx1=xx-32;
ly1=yy;
lx2=xx+32;
ly2=yy;

dir=90;
len=32;
r=24;
event_user(4);

len=yy-objWaterFront.y+64;
event_user(4);
lastTunnel=i;
muLine.x2=xx-r;
i=instance_create(xx+r,yy,sandline);
i.depth-=1;
i.deep=0;
i.x2=xx+r+2560;
}
}
__b__ = action_if(phase==0);
if __b__
{
if(sonic.y>yy)
    {
    soundloop(global.handle);
    phase=1;
    }
}
__b__ = action_if(phase==1);
if __b__
{
if(sonic.y<yy+480 && sonic.x>xx-48)//in the tunnel
    {
    event_user(10);
    phase=2;
    }
}
__b__ = action_if(phase==3);
if __b__
{
if(closeSand!=-1)
    {
    if(closeSand.x2<closeSand.x+48)
        {
        closeSand.x2+=8*global.time;
        if (closeSand.x2>=closeSand.x+48)
            {
            closeSand.x2=closeSand.x+48;
            soundplay(global.sndClosePush);
            }
        with closeSand
            event_perform(ev_alarm,0);
        }
    }
timer+=global.time;
}
__b__ = action_if(phase==3);
if __b__
{
if(tempWall!=-1)//Yay, 1-frame hole bug solved
    {
    with (tempWall)
        instance_destroy();
    tempWall=-1;
    }

xx=drillX;//MAKE DRILL!
yy=drillY;
if(sonic.x>xx-512)
    {
    controlbg.lev=-3;
    with (all)
        {
        if (object_index==sandline || object_index==grassline || object_index==line || object_index==greatbrown2)
            {
            if (max(x,x2)<other.xx-1280)
                instance_destroy();
            }
        else if(object_index==objTunnel)
            instance_destroy();
        else if(object_index!=controlbg && object_index!=objectfg && object_index!=grassgenerator)
            {    
            if(x<other.xx-1280)
                instance_destroy();
            }
        }
    
    
    instance_create(xx-608,yy,objTotem);
    instance_create(xx-208,yy-72,objring);
    instance_create(xx-192,yy-72,objring);
    instance_create(xx-224,yy-72,objring);
    instance_create(xx-200,yy-96,objring);
    instance_create(xx-216,yy-96,objring);
    
    i=instance_create(xx,yy-292,upground);
    i.y2=yy-1280;
    i.x2=xx-480;
    
    i=instance_create(xx,yy-1280,greatbrown2);
    i.x2=xx+1280;
    i.y2=closeY-yy;
    i.c4=i.c3;
    i.depth=10;
    
    i=instance_create(xx,yy,line)
    i.visible=1;
    i.x2=i.x;
    i.y2=yy-1280;
    drillLine=i;
    phase=4;
    timer=0;
    instance_create(xx,yy-48,drill);
    }
}
__b__ = action_if(phase==2);
if __b__
{
if(sonic.y<=closeY-15)//over the tunnel
    {
    with (all)
        {
    
        if (object_index==sandline || object_index==grassline || object_index==line || object_index==greatbrown2)
            {
            if (max(x,x2)<other.closeX-640 || min(y,y2)>other.closeY+320)
                instance_destroy();
            }
        else if(object_index==objTunnel)
            {
            if (id!=other.lastTunnel)
                instance_destroy();
            }
        else if(object_index!=controlbg && object_index!=objectfg && object_index!=grassgenerator)
            {    
            if(x<other.closeX-640 || y>other.closeY+480)
                instance_destroy();
            }
        }
    
    soundplay(global.sndRedWave);
    i=instance_create(closeX,closeY,line);
    i.x2=i.x+48;
    closeSand=instance_create(closeX,closeY,sandline);
    closeSand.x2=i.x+4;
    closeSand.c4=c_white;
    closeSand.deep=32;
    phase=3;
    timer=0;
    controlbg.lev=-4;
    event_user(11)
    }
}
__b__ = action_if(phase==4);
if __b__
{
xx=drillX;
yy=drillY;
if(sonic.y>yy+320)
    {
    
    with (all)
        {
        if(object_index!=controlbg && object_index!=objectfg && object_index!=grassgenerator 
             && object_index!=sonic && object_index!=drill && object_index!=dLine 
             && object_index!=objCaveDrawer && object_index!=objTri)
            {    
            instance_destroy();
            }
        }
    controlbg.visible=0;
    objectfg.visible=0;
    phase=5;
    }
}
__b__ = action_if(phase==4 || phase==5);
if __b__
{
timer+=global.time;

if (timer<180)
    soundvolume(global.handle,1-power(timer/180,2));
if(timer==180)
        {
        soundvolume(global.handle,1);
        soundstop(global.handle);
        SS_FreeSound(global.handle);
        }
}
__b__ = action_if(phase==6);
if __b__
{
if(sonic.x>x-480)
    {
    controlbg.lev=-2;
    soundloop(global.handle);
    
    with (objTri)
        if(x2<x-1600)
            instance_destroy();
    with (dLine)
        if(x2<x-1600)
            instance_destroy();
    i=instance_create(drill.remRX,drill.remRY-256,line);
    i.x2=i.x;
    i.y2=i.y-2560;
            
    event_user(13);
    phase=7;
    }
}
__b__ = action_if(phase==7);
if __b__
{
if(sonic.x>xmark1)
    {
    phase=8;
    i=instance_create(xmark1-128,ymark1-128,objtornado1);
    }
}
__b__ = action_if(phase==8);
if __b__
{
if(sonic.y>ry0+480)
    {
    with (all)
        {
        if(object_index==line)
            {
            if(max(x,x2)<other.rx0-640 || y<other.ry0-128)
                instance_destroy();
            }
        else if(object_index==grassline || object_index==greatbrown2)
            {
            if(max(x,x2)<other.rx0-640)
                instance_destroy();
            else
                depth=11;
            }
        else if (object_index!=objectfg && object_index!=controlbg && object_index!=sonic && object_index!=grassgenerator 
            && object_index!=objTunnel)
            {
            if(x<other.rx0-640 || y<other.ry0-128)
                instance_destroy();
            }
        }
    event_user(14);
    phase=9;
    timer=0;
    }
}
__b__ = action_if(phase==9);
if __b__
{
if(sonic.x>xmark3)
    {
    phase=10;
    }
}
__b__ = action_if(phase==10);
if __b__
{
sonic.able=0;
sonic.lockMovement=1;
}
__b__ = action_if(phase==11);
if __b__
{
if (sonic.vspeed>0)
{
objtornado2.follow=1;
objtornado2.goaly=__view_get( e__VW.YView, 0 )+512;
phase=12;
}

}
__b__ = action_if(phase>=10);
if __b__
{
timer+=global.time;
if (timer<180)
    soundvolume(global.handle,1-power(timer/180,2))
if (timer==180)
    {
    soundvolume(global.handle,1);
    SS_StopSound(global.handle);
    SS_FreeSound(global.handle);
    }
}
