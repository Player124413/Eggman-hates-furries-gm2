x=p.x+width*cos(cod);
y=p.y+height*sin(sid)+yoff;

x=xstart*(1-prog)+x*prog;
y=ystart*(1-prog)+y*prog;
draw_set_alpha(0.5);
draw_set_blend_mode(bm_add);
draw_circle_color(x,y,16,image_blend,c_black,0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);

draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,image_blend,image_alpha);
