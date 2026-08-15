x=__view_get( e__VW.XView, 0 );//Keep it from getting trashed

if (__view_get( e__VW.YView, 0 )>y-480 && __view_get( e__VW.YView, 0 )<y+height)
    {
    draw_set_blend_mode(bm_subtract);
    draw_rectangle_color(__view_get( e__VW.XView, 0 ),y,__view_get( e__VW.XView, 0 )+640,y+height,c_black,c_black,c_white,c_white,0);
    draw_set_blend_mode(bm_normal);
    }
if (__view_get( e__VW.YView, 0 )>y+height-480)
    {
    draw_set_color(c_black);
    draw_rectangle(__view_get( e__VW.XView, 0 ),max(y+height,__view_get( e__VW.YView, 0 )),__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,0);
    }
