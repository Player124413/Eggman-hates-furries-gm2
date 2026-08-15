image_blend=make_color_hsv(0,0,255*alpha);
draw_set_blend_mode(bm_subtract);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
draw_set_blend_mode(bm_normal);
