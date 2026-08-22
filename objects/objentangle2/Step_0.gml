var __b__;
__b__ = action_if(image_index>14 && phase==0);
if __b__
{
{
image_speed = 0;
phase = 1;
}
}
__b__ = action_if(phase>=1);
if __b__
{
action_move_to((x*9+objdoll.x+objdoll.yscale*96)/10, (y*9+objdoll.y)/10);
}
__b__ = action_if(phase==1);
if __b__
{
timer+=1;
if (timer>60)
    {
    phase=2;
    sprite_index=sprblackreveal;
    image_speed=1;
    timer=0;
    }

}
__b__ = action_if(image_index>11 && phase==2);
if __b__
{
{
image_speed = 0;
phase = 3;
}
}
__b__ = action_if(phase==3);
if __b__
{
timer+=1;
if (timer>30)
    {
    phase=4;
    sprite_index=sprblackexplosion;
    image_speed=1;
    timer=0;
    soundplay(global.sndDarkDestroy);
    }

}
__b__ = action_if(image_index>7 && phase==4);
if __b__
{
{
with (objentangle1) {
phase = 1;
}
with (objentangle1) {
timer = 0;
}
__b__ = action_if(caught);
if __b__
{
sonic.damaged=1;
sonic.damagex=objdoll.x;
sonic.damagey=objdoll.y;
}
action_kill_object();
}
}
__b__ = action_if(caught);
if __b__
{
sonic.x=x;
sonic.y=y;
sonic.hspeed=0;
sonic.vspeed=0;
sonic.sprite_index=shurt;
}
else if (i1 != -1 && instance_exists(i1))
{
// movingball owns its motion values in the current runtime.
i1.x=x;
i1.y=y;
with i1
    event_perform(ev_alarm,0);
}
