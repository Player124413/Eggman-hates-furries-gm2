var h,v;

if(active && timer<50)
{
draw_set_alpha(0.4);
draw_set_color(c_red);
draw_primitive_begin(pr_trianglefan);
draw_vertex(doom.x,doom.y);
for(n=image_angle-60; n<=image_angle+60; n+=20)
    {
    draw_vertex(doom.x+lengthdir_x(192+64,n),doom.y+lengthdir_y(192+64,n));
    }
draw_primitive_end();
draw_set_alpha(1);
}

h=cos(degtorad(angle));
v=-sin(degtorad(angle));
x=doom.x+extend*h;
y=doom.y+extend*v;
draw_sprite_ext(sprDoomGun1,0,x,y,1,1,image_angle,image_blend,image_alpha);
draw_sprite_ext(sprite_index,image_index,x,y,1,image_yscale,image_angle,image_blend,image_alpha);

