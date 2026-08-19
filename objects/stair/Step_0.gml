action_set_relative(1);
var __b__;
__b__ = action_if(y<makestairs.ynull-48);
if __b__
{
{
__b__ = action_if(mogen==1 or instance_exists(BottomFloor));
if __b__
{
action_kill_object();
}
x += 288;
y += 288;
}
}
with (makestairs) {
__b__ = action_if(x>xnull+128);
}
if __b__
{
action_move_to(makestairs.hspeed, 0);
}
action_set_relative(0);
