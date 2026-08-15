var __b__;
__b__ = action_if(active==1);
if __b__
{
{
action_draw_line(x, y, x2, y2);
action_draw_arrow(x, y, x+hspeed*8, y+vspeed*8, 5);
action_draw_arrow(x2, y2, x2+hspeed2*8, y2+vspeed2*8, 5);
}
}
