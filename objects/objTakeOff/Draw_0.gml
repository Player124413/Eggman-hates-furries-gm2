draw_set_color(c_white);
draw_background(bgLand,0,0);
if(surface_exists(surf))
    draw_surface(surf,0,288);
else
    draw_background(fgLand,0,288);

h1=lengthdir_x(1,angle);
v1=lengthdir_y(1,angle);
h2=lengthdir_x(1,angle+270);
v2=lengthdir_y(1,angle+270);

draw_set_blend_mode(bm_add);
draw_sprite_ext(sprPropeller,image_index,x+48*h1*sc-96*h2*sc,y+48*v1*sc-96*v2*sc,image_xscale*1.5,image_yscale*1.5,image_angle+prop,image_blend,image_alpha);
draw_set_blend_mode(bm_normal);
    
ox=sprite_get_xoffset(sprite_index)*sc;
oy=sprite_get_yoffset(sprite_index)*sc;
sx=sprite_get_width(sprite_index)*sc-ox;
sy=sprite_get_height(sprite_index)*sc-oy;

t=sprite_get_texture(sprite_index,image_index);
draw_primitive_begin_texture(pr_trianglestrip,t);
draw_vertex_texture(x-h1*ox-h2*oy,y-v1*ox-v2*oy,0,0);
draw_vertex_texture(x+h1*sx-h2*oy,y+v1*sx-v2*oy,1,0);
draw_vertex_texture(x-h1*ox+h2*sy,y-v1*ox+v2*sy,0,1);
draw_vertex_texture(x+h1*sx+h2*sy,y+v1*sx+v2*sy,1,1);
draw_primitive_end();

draw_sprite_ext(sprCockpitTails,tailImg,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
