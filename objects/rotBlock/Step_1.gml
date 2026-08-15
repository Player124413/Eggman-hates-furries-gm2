var __b__;
__b__ = action_if(x<__view_get( e__VW.XView, 0 )+640+wr+hr && x>__view_get( e__VW.XView, 0 )-wr-hr);
if __b__
{
{
__b__ = action_if(rot!=0);
if __b__
{
h1=lengthdir_x(wr,rot);
v1=lengthdir_y(wr,rot);

h2=lengthdir_x(hr,rot-90);
v2=lengthdir_y(hr,rot-90);

x1=x-h1-h2;
y1=y-v1-v2;

x2=x+h1-h2;
y2=y+v1-v2+yskew;

x3=x-h1+h2+xskew;
y3=y-v1+v2;

x4=x+h1+h2+xskew;
y4=y+v1+v2+yskew;

nh1=lengthdir_x(wr,rot+rotsp*global.time);
nv1=lengthdir_y(wr,rot+rotsp*global.time);

nh2=lengthdir_x(hr,rot+rotsp*global.time-90);
nv2=lengthdir_y(hr,rot+rotsp*global.time-90);

nx1=x-nh1-nh2;
ny1=y-nv1-nv2;

nx2=x+nh1-nh2;
ny2=y+nv1-nv2+yskew;

nx3=x-nh1+nh2+xskew;
ny3=y-nv1+nv2;

nx4=x+nh1+nh2+xskew;
ny4=y+nv1+nv2+yskew;

h1=hspeed+nx1-x1;
v1=vspeed+ny1-y1;
h2=hspeed+nx2-x2;
v2=vspeed+ny2-y2;
h3=hspeed+nx3-x3;
v3=vspeed+ny3-y3;
h4=hspeed+nx4-x4;
v4=vspeed+ny4-y4;

it.x=x1;
it.y=y1;
it.x2=x2;
it.y2=y2;

it.hspeed=h1;
it.vspeed=v1;
it.hspeed2=h2;
it.vspeed2=v2;

ib.x=x4;
ib.y=y4;
ib.x2=x3;
ib.y2=y3;

ib.hspeed=h4;
ib.vspeed=v4;
ib.hspeed2=h3;
ib.vspeed2=v3;

il.x=x3;
il.y=y3;
il.x2=x1;
il.y2=y1;

il.hspeed=h3;
il.vspeed=v3;
il.hspeed2=h1;
il.vspeed2=v1;

ir.x=x2;
ir.y=y2;
ir.x2=x4;
ir.y2=y4;

ir.hspeed=h2;
ir.vspeed=v2;
ir.hspeed2=h4;
ir.vspeed2=v4;

rot+=rotsp*global.time;
}
else
{
x1=x-wr;
y1=y-hr;

x2=x+wr;
y2=y-hr+yskew;

x3=x-wr+xskew;
y3=y+hr;

x4=x+wr+xskew;
y4=y+hr+yskew;

it.x=x1;
it.y=y1;
it.x2=x2;
it.y2=y2;

ib.x=x4;
ib.y=y4;
ib.x2=x3;
ib.y2=y3;

il.x=x3;
il.y=y3;
il.x2=x1;
il.y2=y1;

ir.x=x2;
ir.y=y2;
ir.x2=x4;
ir.y2=y4;

rot+=rotsp*global.time;
}
}
}
active = 1;
x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);
image_index-=image_speed*(1-global.time);

destroy_outside();
__b__ = action_if(adjust>0);
if __b__
{
if (adjust==1 && uctrl.blink && (y!=yG || yskew!=yskewG))
    {
    uctrl.shaking=1;
    event_user(0);
    if (y<yG)
        y+=global.time*3;
    if (y>yG)
        y-=global.time*3;
    if (yskew<yskewG)
        yskew+=global.time*3;
    if (yskew>yskewG)
        yskew-=global.time*3;
    }
if (adjust==2)
    {
    if (preadjust!=2 && x>__view_get( e__VW.XView, 0 )+32 && x<__view_get( e__VW.XView, 0 )+640 && (y!=yG || yskew!=yskewG))
        {
        if(yG<y-64)
            {
            if (true)
                objRean.up=22;
            soundplay(global.sndCrush);
            spawnTopRocks(6,1.5);
            }
        else
            {
            j=floor(random(2));
            if(j==1)
                soundplay(global.sndRedWave);
            if(j==0)
                soundplay(global.sndDarkDestroy);
            }
        }
    if(yG<640)
        {
        y=approach(y,5,yG,1);
        yskew=approach(yskew,5,yskewG,1);
        }
    else
        vspeed+=sonails.g*global.time;
    }
if (adjust==3)
    {
    y=yG;
    yskew=yskewG;
    }
preadjust=adjust;
}
