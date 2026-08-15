action_set_relative(0);
sc = (sc*9+1)/10;
{
action_set_relative(1);
timer += 1;
action_set_relative(0);
}
var __b__;
__b__ = action_if(timer==120 && phase==0);
if __b__
{
action_create_object(objentangle2, xx, yy);
}
__b__ = action_if(phase==1);
if __b__
{
if(random(2)<1)
    {i=instance_create(x-32+random(64),y,objblackbubble);
    i.depth=-1;}
if(random(2)<1)
    {i=instance_create(objdoll.x-20+random(40),objdoll.y-8+random(48),objblackbubble);
    i.depth=4;}

image_alpha-=1/30;
if (image_alpha<=0)
    {
    instance_destroy();
    soundstop(global.sndDarkHum);
    objdollbot.subphs=1;
    objdollbot.timer=0;
    }
}
__b__ = action_if(timer<120);
if __b__
{
if (random(180)<1)
    {with objTDRoom
    event_user(0);}
}
action_set_relative(0);
