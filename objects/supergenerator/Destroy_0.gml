var __b__;
__b__ = action_if(phase==6);
if __b__
{
soundstop(global.handle);
}
__b__ = action_if(phase>3 && phase<7);
if __b__
{
SS_FreeSound(global.handle);
}
