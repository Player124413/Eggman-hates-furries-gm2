draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,image_blend,0.6);
draw_sprite_ext(sprite_index,image_index,x+16+random(4),y,1,1,image_angle,image_blend,0.4);
draw_sprite_ext(sprite_index,image_index,x+32+random(8),y,1,1,image_angle,image_blend,0.2);
draw_set_blend_mode(bm_normal);
