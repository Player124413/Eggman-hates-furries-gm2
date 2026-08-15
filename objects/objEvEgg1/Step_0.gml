blink = !blink;
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index+=-image_speed*(1-global.time);

eightstage+=1;
if (eightstage>=8)
    eightstage-=8;
view_xview=(view_xview+(x-320)*camtimer)/(1+camtimer)
view_yview=(view_yview+(y-240+40)*camtimer)/(1+camtimer)
var __b__;
__b__ = action_if(phase==0);
if __b__
{
y=(y*19+global.time*(ystart-128))/(19+global.time);
timer+=global.time;

if (timer>80)
    {
    phase=1;
    timer=0;
    }
}
__b__ = action_if(phase==1);
if __b__
{
var gx,gy,d,h,v;
timer+=global.time;

if (timer==30)
    {
    soundplay(global.sndBigGun);
    }
if (timer>30 && width>0)
    {
    if (sonic.invulnerable>0 && instance_exists(line))
        {
        with line
        instance_destroy();
        }
    lazor=1;
    dir+=(global.time*2)
    if (dir>-10)
        width-=global.time/10;
    }
else if(lazor==1)
    {
    i=instance_create(0,0,objCraft2);
    i.visible=0;
    global.time=0.2;
    soundloop(global.sndEngine2);
    soundvolume(global.sndEngine2,0);
    soundplay(global.sndBreakDown);
    objectfg.flashlight=1;
    with line
        instance_destroy();
    
    kx=objLavaGirder.x;
    ky=objLavaGirder.y;
    k=objLavaGirder.id;
    with (objLavaGirder)    
        {
        if (x>other.kx) {other.kx=x;}
        if (y>=other.ky && x==other.kx)
            {
            other.ky=y;
            other.k=id;
            }
        }
    with k
        sprite_index=sprDoomGirderEnd;
    
    lazor=0;
    phase=2;
    timer=0;
    }
//

if(lazor)
    {
    sprite_index=sprEggAtk2;
    if (dir<-1)
        {
        h=lengthdir_x(1,dir);
        v=lengthdir_y(1,dir);
        gy=0;
        d=(gy-yy)/v;
        gx=xx+h*d;
        with (static)
            {
            if(gx>x && (sprite_index==sprBridgeGirder || sprite_index==sprBridgeEnd || sprite_index==sprBridgeCut))
                {
                soundplay(global.sndGunstar1);
                i=instance_create(x+sprite_width/2,y,objbigexp);
                instance_destroy();
                }
            }
        with (objBridgeCut)
            {
            if(gx>x)
                {
                soundplay(global.sndGunstar1);
                i=instance_create(x+sprite_width/2,y,objbigexp);
                instance_destroy();
                }
            }
        }
    }
else
    sprite_index=sprEgg2;
//

}
__b__ = action_if(phase==2);
if __b__
{
var nx,ny;
if (timer>0)
    objCraft2.visible=1;
timer+=global.time;
objectfg.flashlight=max(0,1-timer/60);


if (camtimer>0)
    {camtimer-=global.time/90;
    if(camtimer<=0)
        camtimer=0;
    }
if (timer<=90)
    soundvolume(global.handle,max(0.25,1-power(timer/90,2)));
else if (timer<150)
    {
    soundvolume(global.sndEngine2,max(0,1-power((150-timer)/60,2)));
    }
    
with sonic
    {
    invulnerable=60;
    able=0;
    }

objCraft2.prog=timer/150;
if (timer>150)
    {
    controlbg.on=0;
    controlbg.lev=15;
    soundvolume(global.sndEngine2,1);
    soundvolume(global.handle,1);
    objCraft2.prog=0;
    objCraft2.phase=1;
    global.time=0.5;
    soundplay(global.sndPull);
    soundplay(global.sndLand1);
    sonic.invulnerable=0;
    sonic.able=0;
    sonic.physics=0;
    nx=objCraft2.x;
    ny=objCraft2.y;
    view_xview-=nx;
    view_yview-=ny;
    with all 
        {
        if(object_index!=objCraft2 && object_index!=sonic && object_index!=controlbg && object_index!=objectfg)
            instance_destroy();
        else
            {
            x-=nx;
            y-=ny;
            }
        }
    }

}
