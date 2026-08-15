xx=objSuperEgg.x;
yy=objSuperEgg.y;
draw_set_blend_mode(bm_add);
if(maximum==360)
    {
    
    if(blink)
        draw_primitive_begin(pr_trianglestrip);
    for(d=0; d<=360; d+=360/(2*pi*r/64))
            {
            
            
            if(blink)
                {
                draw_vertex_color(xx+lengthdir_x(r-f,d),yy+lengthdir_y(r-f,d),c_black,0);
                draw_vertex_color(xx+lengthdir_x(r,d),yy+lengthdir_y(r,d),c_white,1);
                }
            draw_sprite_ext(sprElectricWall,blink+2*(floor(random(4))),xx+lengthdir_x(r-4,d),yy+lengthdir_y(r-4,d),-1,1-2*floor(random(2)),d,c_white,1);
            }
    if(blink)
    draw_primitive_end();
    }
else
    {
    if(blink)
        draw_primitive_begin(pr_trianglestrip);
    for(d=minimum; d<=maximum+0.1; d+=q)
            {
            q=(maximum-minimum)/ceil(2*pi*r/64)
            
            if(blink)
                {
                draw_vertex_color(xx+lengthdir_x(r-f,d),yy+lengthdir_y(r-f,d),c_black,0);
                draw_vertex_color(xx+lengthdir_x(r,d),yy+lengthdir_y(r,d),c_white,1);
                }
            if(d<maximum-0.1)
                draw_sprite_ext(sprElectricWall,blink+2*(floor(random(4))),xx+lengthdir_x(r-4,d+q/2),yy+lengthdir_y(r-4,d+q/2),-1,1-2*floor(random(2)),d+q/2,c_white,1);
            }
    if(blink)
    draw_primitive_end();
    }
draw_set_blend_mode(bm_normal);

