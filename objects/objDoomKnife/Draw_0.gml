var h,v;
h=cos(degtorad(angle));
v=-sin(degtorad(angle));
x=doom.x+extend*h;
y=doom.y+extend*v;
draw_sprite_ext(sprDoomGun1,0,x,y,1,1,image_angle,image_blend,image_alpha);
draw_sprite_ext(sprite_index,image_index,x,y,1,image_yscale,image_angle,image_blend,image_alpha);

draw_set_alpha(0.4);
draw_set_color(c_red);
draw_primitive_begin(pr_trianglefan);
draw_vertex(doom.x,doom.y);
for(n=0; n<=32; n+=8)
    {
    draw_vertex(doom.x+lengthdir_x(extend+32-n,image_angle+image_yscale*n),doom.y+lengthdir_y(extend+32-n,image_angle+image_yscale*n));
    }
draw_primitive_end();
draw_set_alpha(1);
