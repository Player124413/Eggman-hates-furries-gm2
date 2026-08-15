var __b__;
__b__ = action_if(phase==4 || phase==5);
if __b__
{
var al;
al=1;
if (phase==5)
    al=max(0,1-timer/60);
draw_set_alpha(al/2);
draw_set_color(c_black);
draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,0);
draw_set_alpha(1);
draw_background_ext(bgFlashy1,__view_get( e__VW.XView, 0 )+fx,__view_get( e__VW.YView, 0 )+fy,1,1,0,c_white,al);
if(bling)
    {
    draw_background_ext(bgFlashy3,__view_get( e__VW.XView, 0 )+fx+128,__view_get( e__VW.YView, 0 )+fy,1,1,0,c_white,al);
    draw_set_blend_mode(bm_add);
    draw_background_ext(bgFlashy2,__view_get( e__VW.XView, 0 )+fx,__view_get( e__VW.YView, 0 )+fy,1,1,0,c_white,al);
    draw_set_blend_mode(bm_normal);
    }

}
