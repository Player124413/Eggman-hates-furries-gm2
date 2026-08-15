draw_set_blend_mode(bm_add);
drawsprite();
for(i=1; i<4; i+=1)
    {
    draw_sprite_ext(sprite_index,image_index,x-(hspeed*i/4),y-(vspeed*i/4),image_xscale,image_yscale,image_angle,image_blend,image_alpha/(1+i));
    }

draw_set_blend_mode(bm_normal);
