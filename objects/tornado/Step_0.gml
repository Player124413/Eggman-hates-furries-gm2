image_index-=(1-global.time)*image_speed;

// Boss, player and water can be removed independently during phase changes.
// Cache safe references once per Step and make the tornado leave gracefully
// instead of dereferencing deleted singleton objects.
var boss = instance_find(panjan, 0);
var player = instance_find(sonic, 0);
var water = instance_find(objWaterFront, 0);
if (phase < 4 && (!instance_exists(boss) || !instance_exists(player)))
    phase = 4;
var water_y = instance_exists(water) ? water.y : __view_get(e__VW.YView, 0) + 480;

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
hspeed=(hspeed*39+global.time*(boss.hspeed+limitize(max(boss.x+212,player.x-64)-x-(hspeed-boss.hspeed)*24,8)))/(39+global.time);
vspeed=(vspeed*39+global.time*(limitize(water_y-192-y-vspeed*14,8)))/(39+global.time);
if (instance_exists(i1))
    i1.on=0;

}
__b__ = action_if(phase==1);
if __b__
{
if(y>water_y-96)
    {
    if(mytails!=stornadoBack)
        instance_create(0,0,objGetOn);
    mytails=stornadoBack;
    }

//Get to sonic
hspeed=(hspeed*39+global.time*(boss.hspeed+limitize(max(boss.x+128,player.x-64)-x-(hspeed-boss.hspeed)*14,8)))/(39+global.time);
vspeed=(vspeed*39+global.time*(limitize(water_y-64-y-vspeed*14,8)))/(39+global.time);
if (instance_exists(i1))
{
    if (player.y<y-32)
        i1.on=1;
    if (player.y>y-16)
        i1.on=0;
}
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


hspeed=(hspeed*39+global.time*(boss.hspeed+limitize(boss.x+256-x-(hspeed-boss.hspeed)*8,8)))/(39+global.time);
vspeed=(vspeed*39+global.time*(limitize(water_y-288-y-vspeed*8,8)))/(39+global.time);

if(report!=0 && subphs==0)
    {
    remX=player.x-x-hspeed;
    subphs=1;
    }
if (subphs==1)
    {
    player.able=0;
    player.physics=0;
    player.sprite_index=scraftsonic;
    player.image_index=4;
    player.image_speed=0;
    player.image_angle=0;
    player.hspeed=hspeed;
    player.vspeed=vspeed;
    player.x=x+remX*0.8*h1+31*h2+hspeed;
    player.y=y+remX*0.8*v1+31*v2+vspeed;
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
if (instance_exists(boss))
{
    var support_bot = boss.bot1;
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
var departure_target_x = instance_exists(boss) ? boss.x - 64 : x;
hspeed=(hspeed*39+global.time*limitize(departure_target_x-x-(hspeed-k)*14,8))/(39+global.time);
vspeed=(vspeed*39+global.time*limitize(water_y-1280-y-vspeed*14,8))/(39+global.time);

if (y<__view_get( e__VW.YView, 0 )-128)
{
    instance_destroy(); // out of sight, out of mind
    exit;
}
}
if (instance_exists(player))
{
    if (report != 0)
        player.airResist = 0;
    else if (player.y > y)
        player.airResist = 1;
}
report=0;
