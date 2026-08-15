action_set_relative(1);
action_create_object(objJaw, 0, 0);
{
action_set_relative(0);
radius = 48;
action_set_relative(1);
}
{
action_set_relative(0);
blink = 0;
action_set_relative(1);
}
{
action_set_relative(0);
image_speed = 0.5;
action_set_relative(1);
}
{
action_set_relative(0);
fourstage = 0;
action_set_relative(1);
}
{
action_set_relative(0);
angle = 0;
action_set_relative(1);
}
{
action_set_relative(0);
thrust = 0.2;
action_set_relative(1);
}
{
action_set_relative(0);
timer = 0;
action_set_relative(1);
}
{
action_set_relative(0);
phase = 0;
action_set_relative(1);
}
{
action_set_relative(0);
goalx = 320;
action_set_relative(1);
}
{
action_set_relative(0);
goaly = 240;
action_set_relative(1);
}
soundloop(global.sndChopper);

goalx=x;
goaly=y;

ib=instance_create(0,0,objJawWeakpoint);
ib.sprite_index=sprWeakChopper;
{
action_set_relative(0);
action_set_alarm(15, 1);
action_set_relative(1);
}
{
action_set_relative(0);
dead = 0;
action_set_relative(1);
}
{
action_set_relative(0);
launchdir = 180;
action_set_relative(1);
}
{
action_set_relative(0);
ik = -1;
action_set_relative(1);
}
{
action_set_relative(0);
ia = -1;
action_set_relative(1);
}
{
action_set_relative(0);
subphs = 0;
action_set_relative(1);
}
{
action_set_relative(0);
atk = -1;
action_set_relative(1);
}
{
action_set_relative(0);
armgoal = -1;
action_set_relative(1);
}
{
action_set_relative(0);
counter = 0;
action_set_relative(1);
}
{
action_set_relative(0);
right = 0;
action_set_relative(1);
}
{
action_set_relative(0);
life = 5;
action_set_relative(1);
}
{
action_set_relative(0);
invulnerable = 0;
action_set_relative(1);
}
{
action_set_relative(0);
explostage = 0;
action_set_relative(1);
}
{
action_set_relative(0);
bouncetimer = 0;
action_set_relative(1);
}
action_set_relative(0);
