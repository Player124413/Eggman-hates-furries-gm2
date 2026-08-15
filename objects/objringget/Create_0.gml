action_set_relative(0);
image_speed = 1;
action_set_alarm(16, 0);
soundplay(global.sndRing);
{
action_set_relative(1);
sonic.rings += 1;
action_set_relative(0);
}
action_set_relative(0);
