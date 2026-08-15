var __b__;
__b__ = action_if(txt!="");
if __b__
{
{
action_font(creditFont, 1);
var c;
draw_set_color(make_color_rgb(192,32,16));
draw_set_alpha(0.66);
for(c=-1; c<=1; c+=1)
    draw_text(__view_get( e__VW.XView, 0 )+320+c,__view_get( e__VW.YView, 0 )+448,string_hash_to_newline(txt));
draw_set_alpha(1);
draw_set_halign(fa_left);
}
}
