action_draw_gradient_vert(__view_get( e__VW.XView, 0 ), y, __view_get( e__VW.XView, 0 )+640, max(y+320,__view_get( e__VW.YView, 0 )+480), 255, 65535);
draw_set_blend_mode(bm_add);
c=make_color_rgb(64,32,0)
draw_rectangle_color(__view_get( e__VW.XView, 0 ),y,__view_get( e__VW.XView, 0 )+640,y-64,c_black,c_black,c,c,0);
draw_set_blend_mode(bm_normal);

action_color(0);
