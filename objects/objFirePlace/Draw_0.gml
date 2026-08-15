draw_sprite(sprFirePlace,1,x,y);
if(burning)
{
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprite_index,image_index,x,y-16,1,1,0,c_white,0.5);
draw_sprite_ext(sprite_index,image_index+0.5,x,y-16,1,1,0,c_white,0.5);

draw_set_blend_mode(bm_normal);
draw_sprite(sprFirePlace,0,x,y);
draw_set_blend_mode(bm_subtract);
draw_circle_color(x,y-24,320+random(64),c_black,c_white,0);
draw_set_blend_mode(bm_normal);
}
