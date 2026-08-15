var __b__;
__b__ = action_if(dependency!=self);
if __b__
{
prog = 1-dependency.prog/2;
}
__b__ = action_if(report2<0);
if __b__
{
game_over();
}
