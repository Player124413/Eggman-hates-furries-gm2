draw_set_blend_mode(bm_add);
draw_set_alpha(sin(pi*image_index/image_number));
draw_circle_color(x+lengthdir_x(192,image_angle),y+lengthdir_y(192,image_angle),64,c_aqua,c_black,0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);

draw_sprite_ext(sprite_index,image_index,x+lengthdir_x(extend,image_angle),y+lengthdir_y(extend,image_angle),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
