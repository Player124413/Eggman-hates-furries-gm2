draw_set_alpha(0.5);
draw_set_blend_mode(bm_add);
draw_circle_color(x,y,64+random(16)*sin(2*pi*cRot),image_blend,c_black,0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
script_execute(drawsprite,0,0,0,0,0);
