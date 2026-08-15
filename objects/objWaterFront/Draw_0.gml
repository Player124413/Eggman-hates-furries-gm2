top=y;

draw_set_color(make_color_rgb(8,12,32));
draw_set_alpha(0.45);
draw_rectangle(__view_get( e__VW.XView, 0 ),top,__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,0);
draw_set_alpha(1);

left=(__view_get( e__VW.XView, 0 )-(__view_get( e__VW.XView, 0 ) mod 64))-64;
c=blink;
while (left<__view_get( e__VW.XView, 0 )+640)
    {
    draw_sprite_ext(sprite_index,image_index,left,top,2,1,0,c_white,0.5-0.25*c);
    left+=64;
    c=!c;
    }
blink=!blink;
lastVX=__view_get( e__VW.XView, 0 );
var __b__;
__b__ = action_if(drownSeconds<11 && frac(drownSeconds)<0.3 && drownSeconds>0);
if __b__
{
draw_set_font(ringfont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_maroon);
draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+242,string_hash_to_newline(string(floor(drownSeconds))));
draw_set_color(c_red);
draw_text(__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+238,string_hash_to_newline(string(floor(drownSeconds))));
draw_set_halign(fa_left);
draw_set_valign(fa_top);

}
