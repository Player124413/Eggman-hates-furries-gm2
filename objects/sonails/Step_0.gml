var __b__;
__b__ = action_if(physics);
if __b__
{
/*if(doomed>0)//Inside wall detection REMOVED
    {
    if (doomed>2)
        game_restart();
    doomed+=1;
    }*/

if (able && keyboard_check(vk_left))
    cx-=1;
if (able && keyboard_check(vk_right))
    cx+=1;
if (able && keyboard_check(vk_up))
    cy-=1;
if (able && keyboard_check(vk_down))
    cy+=1;
if (able && keyboard_check(vk_space) && lastSpace==0)
    cb+=1;
lastSpace=keyboard_check(vk_space);
    
//
vspeed+=g*global.time;
//
speed-=1.1*global.air*global.time*speed*speed;
if (speed<0)  speed=0;
//

if (gnd>0)
    {
    dir=point_direction(0,0,ux,uy);
    if (image_angle<90 && dir>270)
        image_angle+=360;
    if (image_angle>270 && dir<90)
        image_angle-=360;
    image_angle=(dir+image_angle)/2;
    }
else
    {
    if (sin(degtorad(image_angle))<0 || (cos(degtorad(image_angle))<0 && sin(degtorad(image_angle))==0))
        image_angle+=global.time*2;
    if (sin(degtorad(image_angle))>0)
        image_angle-=global.time*2;
    //
    if (standTime>0)
    standTime-=global.time;
    if(standTime==0)
    sprite_index=sprArmJump;
    image_speed=0;
    if (vspeed<0)
        image_index=0;
    else
        image_index=1;
    dir=0;
    nullh=0;
    nullv=0;
    }
//
s=point_distance(nullh,nullv,hspeed,vspeed);
d=point_direction(nullh,nullv,hspeed,vspeed);
tx=lengthdir_x(s,dir-d);

ff=acc;

if (gnd>0)
    {
    frict=fdefault;
        
    if (standTime<2)
    standTime+=global.time;
    
    if (abs(tx)<1.5 && cx==0)
        {
        frict=fdefault*2;
        
        if(cx==0 && cy==1)
            sprite_index=sprArmDuck;
        else
            sprite_index=sprArmStand;
        image_speed=0;
        image_index=0;
        if(standTime<2)
            image_index=1;
        }
    else
        {
        if(cx*tx<=-2 && ny<=-0.66 && global.time>0)//trying to stop and it is not too steep and time hasn't stopped
            {
            if (sprite_index!=sprArmStop && image_speed!=1/10 && image_xscale!=cx)
                soundplay(global.sndStop);
            hspeed-=nx*0.25*global.time;
            vspeed-=ny*0.25*global.time;
            sprite_index=sprArmStop;
            ff=1;
            image_speed=1/10;
            }
        else
            {
            sprite_index=sprArmWalk;
            image_speed=abs(tx)/10;
            }
        }
    if (cb==1 && global.time!=0)
        {
        soundplay(global.sndJump);
        hspeed+=nx*4/5*jump;
        vspeed+=(ny*4/5-1/5)*jump;
        standTime=0;
        gnd=0;
        }    
    gnd-=1;
    }
//
if(cx!=0 && tx!=0)//pressing a key
    {
    image_xscale=sign(tx);
    frict=0.05;
    }
//
factor=minAcc/acc+(1-minAcc/acc)*max(0,-ny);
if (tx*cx>6)
    factor=factor*max(0,1-(speed-6)/2);
motion_add(dir,factor*ff*cx*global.time);

x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);
image_index-=image_speed*(1-global.time);
//
cx=0;
cb=0;
cy=0;
/* */
}
__b__ = action_if(x<__view_get( e__VW.XView, 0 )-16 || y>496);
if __b__
{
ult_die();
/* */
}
/*  */
