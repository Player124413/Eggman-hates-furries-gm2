f=image_angle+60;
draw_sprite_ext(sprsocket,0,x,y,1,1,f,image_blend,image_alpha);
if(ps)
{xx=x+lengthdir_x(base,f);
yy=y+lengthdir_y(base,f);
psx0=xx;
psy0=yy;
draw_sprite_ext(sproverarm,1,xx,yy,1,1,ps1,image_blend,image_alpha);
xx+=lengthdir_x(ext,ps1);
yy+=lengthdir_y(ext,ps1);
xx+=lengthdir_x(arm,ps2);
yy+=lengthdir_y(arm,ps2);
psx1=xx;
psy1=yy;
draw_sprite_ext(sprsaw,sawimg,xx,yy,1,1,0,image_blend,image_alpha);
xx-=lengthdir_x(arm,ps2);
yy-=lengthdir_y(arm,ps2);
draw_sprite_ext(sprsawholder,0,xx,yy,1,1,ps2,image_blend,image_alpha);}

f=image_angle-60;
draw_sprite_ext(sprsocket,0,x,y,1,1,f,image_blend,image_alpha);
if(ms)
{xx=x+lengthdir_x(base,f);
yy=y+lengthdir_y(base,f);
msx0=xx;
msy0=yy;
draw_sprite_ext(sproverarm,0,xx,yy,1,1,ms1,image_blend,image_alpha);
xx+=lengthdir_x(ext,ms1);
yy+=lengthdir_y(ext,ms1);
xx+=lengthdir_x(arm,ms2);
yy+=lengthdir_y(arm,ms2);
msx1=xx;
msy1=yy;
draw_sprite_ext(sprsaw,3-sawimg,xx,yy,1,1,0,image_blend,image_alpha);
xx-=lengthdir_x(arm,ms2);
yy-=lengthdir_y(arm,ms2);
draw_sprite_ext(sprsawholder,0,xx,yy,1,1,ms2,image_blend,image_alpha);}

f=image_angle+120;
draw_sprite_ext(sprsocket,0,x,y,1,1,f,image_blend,image_alpha);
if(ph)
{xx=x+lengthdir_x(base,f);
yy=y+lengthdir_y(base,f);
phx0=xx;
phy0=yy;
draw_sprite_ext(sproverarm,0,xx,yy,1,1,ph1,image_blend,image_alpha);
xx+=lengthdir_x(ext,ph1);
yy+=lengthdir_y(ext,ph1);
xx+=lengthdir_x(arm,ph2);
yy+=lengthdir_y(arm,ph2);
phx1=xx;
phy1=yy;
draw_sprite_ext(sprsaw,sawimg,xx,yy,1,1,0,image_blend,image_alpha);
xx-=lengthdir_x(arm,ph2);
yy-=lengthdir_y(arm,ph2);
draw_sprite_ext(sprsawholder,0,xx,yy,1,1,ph2,image_blend,image_alpha);}

f=image_angle-120;
draw_sprite_ext(sprsocket,0,x,y,1,1,f,image_blend,image_alpha);
if(mh)
{xx=x+lengthdir_x(base,f);
yy=y+lengthdir_y(base,f);
mhx0=xx;
mhy0=yy;
draw_sprite_ext(sproverarm,0,xx,yy,1,1,mh1,image_blend,image_alpha);
xx+=lengthdir_x(ext,mh1);
yy+=lengthdir_y(ext,mh1);
xx+=lengthdir_x(arm,mh2);
yy+=lengthdir_y(arm,mh2);
mhx1=xx;
mhy1=yy;
draw_sprite_ext(sprsaw,3-sawimg,xx,yy,1,1,0,image_blend,image_alpha);
xx-=lengthdir_x(arm,mh2);
yy-=lengthdir_y(arm,mh2);
draw_sprite_ext(sprsawholder,0,xx,yy,1,1,mh2,image_blend,image_alpha);}
var a,xx,yy,x0,y0,c,h,v,h2,v2;

sawimg+=2*global.time;if(sawimg>=3)sawimg=0;

if (platform>0.1)
{for (i=ceil(platform-0.1); i>=0; i-=1;)
    {
    if(i==ceil(platform-0.1))
        {c=platform-1; a=i-1+floor(plat_tip/8);}
    else
        {c=i-1; a=i-1;}
    xx=x+lengthdir_x(base-16+c*32,image_angle);
    yy=y+lengthdir_y(base-16+c*32,image_angle);
    draw_sprite_ext(sprchargewave,0,xx,yy,1,1+0.5*sin(i/1.5+chargewave/15/pi),image_angle,image_blend,plat_tip/10);
    draw_sprite_ext(sprgunplatform,a,xx,yy,1,1,image_angle,image_blend,image_alpha);
    }
    

robot_cannonlines();
}
else
    {bosul1.on=0; bosul2.on=0; bosul3.on=0;}
if(damaged>0)//risk of stuk
    {bosul1.on=0; bosul2.on=0; bosul3.on=0;}


h=lengthdir_x(64,image_angle);
v=lengthdir_y(64,image_angle);
h2=lengthdir_x(48,image_angle+90);
v2=lengthdir_y(48,image_angle+90);

bosuc.x=x;
bosuc.y=y;
bosuc.hspeed=hspeed;//exact
bosuc.vspeed=vspeed;


bosul4.x=x+h-h2;
bosul4.y=y+v-v2;
bosul4.x2=x+h+h2;
bosul4.y2=y+v+v2;
bosul4.hspeed=hspeed;//approx.
bosul4.vspeed=vspeed;
//bosul4.on=1;
with (bosul4)
    {event_perform(ev_alarm,0);}

bosul5.x=x+h+h2;
bosul5.y=y+v+v2;
bosul5.x2=x+h2;
bosul5.y2=y+v2;
bosul5.hspeed=hspeed;//approx.
bosul5.vspeed=vspeed;
//bosul5.on=1;
with (bosul5)
    {event_perform(ev_alarm,0);}
    
bosul6.x=x+h-h2;
bosul6.y=y+v-v2;
bosul6.x2=x-h2;
bosul6.y2=y-v2;
bosul6.hspeed=hspeed;//approx.
bosul6.vspeed=vspeed;
//bosul6.on=1;
with (bosul6)
    {event_perform(ev_alarm,0);}

    
if(gnd==0 && blink==0)
    {
    if (vspeed>lastvspeed+0.1)
        draw_sprite_ext(sprtinyboost,0,x,y+8,1,1,90,c_white,1);
    if (vspeed<lastvspeed-0.1)
        draw_sprite_ext(sprtinyboost,0,x,y+8,1,1,270,c_white,1);
    }

    
draw_sprite(sprcore,0,x,y);

if(gnd==0 && blink==0)
    {
    if (hspeed>lasthspeed+0.1)
        draw_sprite_ext(sprtinyboost,0,x,y,1,1,180,c_white,1);
    if (hspeed<lasthspeed-0.1)
        draw_sprite_ext(sprtinyboost,0,x,y,1,1,0,c_white,1);
    }
lasthspeed=hspeed;
lastvspeed=vspeed;

draw_sprite_ext(sprbooster,0,x,y,1,1,image_angle,image_blend,image_alpha);
a=0;
if(sequence>0)a=4;
else
{if(reye==0 && leye==1) a=1;
if(leye==0 && reye==1) a=2;
if(reye==0 && leye==0) a=3;}
draw_sprite_ext(spreye,a,x,y,1,1,image_angle,image_blend,image_alpha);



blink=1-blink;
if(blink && boost>-1)
    {
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprboosterflame,boost,x,y,1,1,image_angle,image_blend,image_alpha);
    draw_set_blend_mode(bm_normal);
    }

if(biglazor>0)
    robot_lazor();
    
if(finalcount>=30 && finalcount<90 && finalcount mod 10 < 5)
    draw_sprite(sprtarget,0,x+lengthdir_x(base,image_angle),y+lengthdir_y(base,image_angle));
    
if(finalcount==0 && atk==5 && chargeur>=60 && chargeur<90 && chargeur mod 10 < 5)
    draw_sprite(sprtarget,0,sonic.x,sonic.y);

