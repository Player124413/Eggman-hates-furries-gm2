image_index-=(1-global.time)*image_speed;

tailsBlink+=global.time;
if (tailsBlink>=2)
    tailsBlink=0;

x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);

image_angle = direction;
var __b__;
__b__ = action_if(phase==0);
if __b__
{
mytails=stornado;
//Normal
hspeed=(hspeed*39+global.time*(panjan.hspeed+limitize(max(panjan.x+212,sonic.x-64)-x-(hspeed-panjan.hspeed)*24,8)))/(39+global.time);
vspeed=(vspeed*39+global.time*(limitize(objWaterFront.y-192-y-vspeed*14,8)))/(39+global.time);
i1.on=0;

}
__b__ = action_if(phase==1);
if __b__
{
if(y>objWaterFront.y-96)
    {
    if(mytails!=stornadoBack)
        instance_create(0,0,objGetOn);
    mytails=stornadoBack;
    }

//Get to sonic
hspeed=(hspeed*39+global.time*(panjan.hspeed+limitize(max(panjan.x+128,sonic.x-64)-x-(hspeed-panjan.hspeed)*14,8)))/(39+global.time);
vspeed=(vspeed*39+global.time*(limitize(objWaterFront.y-64-y-vspeed*14,8)))/(39+global.time);
if (sonic.y<y-32)
    i1.on=1;
if (sonic.y>y-16)
    i1.on=0;
subphs=0;
}
__b__ = action_if(phase==2);
if __b__
{
mytails=stornado;
//escape

var h1,v1,h2,v2;
h1=lengthdir_x(1,direction);
v1=lengthdir_y(1,direction);

h2=lengthdir_x(1,direction+90);
v2=lengthdir_y(1,direction+90);


hspeed=(hspeed*39+global.time*(panjan.hspeed+limitize(panjan.x+256-x-(hspeed-panjan.hspeed)*8,8)))/(39+global.time);
vspeed=(vspeed*39+global.time*(limitize(objWaterFront.y-288-y-vspeed*8,8)))/(39+global.time);

if(report!=0 && subphs==0)
    {
    remX=sonic.x-x-hspeed;
    subphs=1;
    }
if (subphs==1)
    {
    sonic.able=0;
    sonic.physics=0;
    sonic.sprite_index=scraftsonic;
    sonic.image_index=4;
    sonic.image_speed=0;
    sonic.image_angle=0;
    sonic.hspeed=hspeed;
    sonic.vspeed=vspeed;
    sonic.x=x+remX*0.8*h1+31*h2+hspeed;
    sonic.y=y+remX*0.8*v1+31*v2+vspeed;
    }
}
__b__ = action_if(phase==3);
if __b__
{
if(subphs>0)
    {
    if(backTime<3)
        {
        backTime+=global.time;
    mytails=stornadoHalf;
        }
    else
        mytails=stornadoDown;
    }
else
    {
        if(backTime>0)
        {
        backTime-=global.time;
        if (mytails==stornadoDown)
            mytails=stornadoHalf;
        }
    else if (mytails==stornadoHalf)
        mytails=stornado;
    }
// Hit/follow the support bot only while both controller and bot exist.
if (instance_exists(panjan))
{
    var support_bot = panjan.bot1;
    if (instance_exists(support_bot))
        hspeed = (hspeed * 19 + global.time * (support_bot.lulsp
            + limitize(support_bot.x - 48 - x - (hspeed - support_bot.lulsp) * 11, 14))) / (19 + global.time);
}
}
__b__ = action_if(phase==4);
if __b__
{
var k;
mytails=stornado;
//up up and away
k=56;
hspeed=(hspeed*39+global.time*(+limitize(panjan.x-64-x-(hspeed-k)*14,8)))/(39+global.time);
vspeed=(vspeed*39+global.time*(limitize(objWaterFront.y-1280-y-vspeed*14,8)))/(39+global.time);

if (y<__view_get( e__VW.YView, 0 )-128)
    instance_destroy();//out of sight, out of mind.
}
if(report!=0)
    sonic.airResist=0;
else if(sonic.y>y)
    sonic.airResist=1;
report=0;
