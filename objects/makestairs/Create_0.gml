xnull = 320;
ynull = 120;
x = xnull+304;
y = ynull+128;
action_create_object(objBGStairs, 0, 0);
action_create_object(objStairTails, xnull+144+48, ynull+128);
a=0
repeat(12)
{a+=30;
i=instance_create(x-a,y,stair)
i.mogen=1}

a=0 b=0
repeat(13)
{instance_create(x+a,b+y,stair)
a+=24;
b+=24;}

__view_set( e__VW.XView, 0, 0 );
__view_set( e__VW.YView, 0, 0 );
action_set_alarm(60, 0);
hem = 0;
bgX = 0;
bgY = 0;
bgP = 0;
