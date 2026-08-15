if(blink)
    draw_sprite(sprEggAura,0,x,y);
drawsprite();


if (lazor)
    {
    xx=x+36;
    yy=y+14;
    if(instance_exists(sonic))
        {
        d=point_distance(xx,yy,sonic.x,sonic.y);
        e=point_distance(xx+lengthdir_x(d,dir),yy+lengthdir_y(d,dir),sonic.x,sonic.y);
        if (e<46*width)
            {
            sonic.damaged=1;
            }
        }

    
    draw_set_blend_mode(bm_add);
    drawLazor(xx,yy,dir,800,eightstage,width);
    draw_sprite_ext(sprbigout,eightstage,xx,yy,1,1,dir,c_white,1);
    draw_set_blend_mode(bm_normal);
    }
