var __b__;
__b__ = action_if(txt!="");
if __b__
{
{
action_font(tutorialFont, 1);
var c;
if(tutorialBlink)
    draw_set_color(make_color_rgb(96+32*cos(timer/100),112+16*sin(timer/100),64));
else
    draw_set_color(make_color_rgb(48+16*cos(timer/100),56+8*sin(timer/100),32));
draw_set_blend_mode(bm_add);
for(c=-1; c<=1; c+=1)
    draw_text(__view_get( e__VW.XView, 0 )+320+c,__view_get( e__VW.YView, 0 )+224+yOff,string_hash_to_newline(txt));
draw_set_blend_mode(bm_normal);

draw_set_halign(fa_left);
}
}
