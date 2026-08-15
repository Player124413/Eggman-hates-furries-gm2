action_set_relative(0);
action_set_alarm(16, 0);
image_speed = 1;
soundplay(global.sndRing);
{
action_set_relative(1);
objSuperSonic.rings += 1;
action_set_relative(0);
}
sprite_index = sprringget;
action_set_relative(0);
