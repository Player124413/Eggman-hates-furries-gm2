draw_set_blend_mode(bm_subtract);
draw_rectangle_color(x,objLava.y-64,x2,max(y+320,__view_get( e__VW.YView, 0 )+480),c_black,c_white,c_white,c_black,0);
draw_set_blend_mode(bm_normal);
draw_set_color(c_black);
draw_rectangle(x2,objLava.y-64,x2+1280,max(y+320,__view_get( e__VW.YView, 0 )+480),0);
