var __b__;
__b__ = action_if(x=xnull and instance_number(BottomFloor)=0);
if __b__
{
{
a=240
zzz=480
with stair
{if y<other.zzz
{other.zzz=y
other.ee=id}}
repeat(12)
{
i=instance_create(ee.x+a,ee.y+288,stair)
i.mogen=2
a+=30;}
instance_create(ee.x,ee.y+288,BottomFloor)
with (stair) {
action_move("000000100", 1);
}
with (BottomFloor) {
action_move("000000100", 1);
}
}
}
