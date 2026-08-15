drawsprite();
draw_set_blend_mode(bm_subtract);
draw_sprite_ext(sprBubbler2,blink,x,y,1,1,image_angle,image_blend,image_alpha);
blink=!blink;
draw_set_blend_mode(bm_normal);
