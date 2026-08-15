action_set_relative(0);
if(fade)
    {
    objMenuCreds.light-=1/120;
    if(objMenuCreds.light<=-1)
        {
        instance_destroy();
        }
    }
var __b__;
__b__ = action_if(hemma=0);
if __b__
{
{
__b__ = action_if(instance_exists(BottomFloor));
if __b__
{
__b__ = action_if(y>BottomFloor.y);
if __b__
{
{
y = BottomFloor.y;
with (all)
{speed=0;}

hspeed=2;
hemma = 1;
action_set_alarm(180, 0);
action_sprite_set(tailse, 0, 0);
action_end_sound(Spot);
objBGStairs.on = 0;
y = BottomFloor.y;
soundplay(global.sndDarkDestroy);
makestairs.bgP=2;
action_set_friction(0.1);
action_set_relative(0);
exit;
}
}
}
__b__ = action_if(current_time-qx>9000 and qx>-1);
if __b__
{
{
action_sprite_set(tailsc, image_index, 0.25);
action_set_vspeed(-4);
{
action_set_relative(1);
qx += 9010;
action_set_relative(0);
}
last = qx;
ouch = 7;
hem = 1;
y = ystart+5;
}
}
__b__ = action_if(hem>0 and current_time>last+9000/16);
if __b__
{
{
if ouch>0
{ouch-=1
hh=floor(random(5))
if hh=0
soundplay(global.sndTails1)
if hh=1
soundplay(global.sndTails2)
if hh=2
soundplay(global.sndTails3)
if hh=3
soundplay(global.sndTails4)
if hh=4
soundplay(global.sndTails5)}
{
action_set_relative(1);
last += 9000/16;
action_set_relative(0);
}
action_sprite_set(tailsc, image_index, 0.25);
action_set_vspeed(-4);
hem = 1;
y = ystart+5;
}
}
__b__ = action_if(hem=1);
if __b__
{
{
{
action_set_relative(1);
action_set_vspeed(0.275);
action_set_relative(0);
}
__b__ = action_if(y>ystart+5);
if __b__
{
{
action_sprite_set(tailsd, image_index+1, 0);
hem = 2;
action_set_vspeed(0);
}
}
}
}
}
}
action_set_relative(0);
