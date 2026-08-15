if (image_index==7 || image_index==8)
    draw_set_blend_mode(bm_add);
draw_sprite(sprite_index,image_index,x,y);
if (image_index==7 || image_index==8)
    draw_set_blend_mode(bm_normal);


