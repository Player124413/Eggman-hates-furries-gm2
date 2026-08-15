action_set_relative(1);
action_kill_object();
repeat( 6 ){
action_create_object(objElSpark, 0, 0);
{
action_set_relative(0);
action_create_object(objElSpark, x2, y2);
action_set_relative(1);
}
}
action_set_relative(0);
