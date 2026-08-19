action_set_relative(0);
var __b__;
__b__ = action_if(x<xnull+156 and hem==0);
if __b__
{
{
hem = 1;
with (objStairTails) {
action_set_hspeed(-1);
}
with (objStairTails) {
action_sprite_set(tailsb, 0, 1);
}
soundplay(global.sndFomp);
soundplay(global.sndTails0);
}
}
__b__ = action_if(x<xnull+129 and y>ynull);
if __b__
{
{
__b__ = action_if(hem==1);
if __b__
{
{
objBGStairs.on = 1;
bgP = 1;
action_sound(Spot, 0);
with (objStairTails) {
hem = 1;
}
with (objStairTails) {
qx = current_time;
}
with (objStairTails) {
last = qx;
}
with (objStairTails) {
action_sprite_set(tailsc, 0, 0.5);
}
hem = 2;
with (objStairTails) {
action_set_hspeed(0);
}
with (objStairTails) {
action_set_vspeed(-4);
}
}
}
action_move("000000100", 1);
with (stair) {
action_move("000000100", 1);
}
}
}
__b__ = action_if(bgP<2);
if __b__
{
{
__b__ = action_if(bgP==1);
if __b__
{
{
{
action_set_relative(1);
bgX += 1;
action_set_relative(0);
}
{
action_set_relative(1);
bgY += -1;
action_set_relative(0);
}
}
}
else
{
{
action_set_relative(1);
bgX += -1;
action_set_relative(0);
}
}
}
}
__b__ = action_if(y<ynull+2);
if __b__
{
{
y = ynull;
action_move("000010000", 0);
x = xnull;
}
}
action_set_relative(0);
