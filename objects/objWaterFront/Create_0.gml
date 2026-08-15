action_set_relative(0);
image_speed = 0.15;
blink = 0;
{
action_set_relative(1);
action_create_object(objWaterBack, 0, 0);
action_set_relative(0);
}
action_move_to(0, 3200);
lastVX = __view_get( e__VW.XView, 0 );
yp = sonic.y;
splashTimer=0;
drownTimer = 0;
drownCounter = 0;
drownDanger = 5;
upTimer = 0;
drownSeconds = 11;
action_set_relative(0);
