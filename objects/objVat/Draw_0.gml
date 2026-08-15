var yy;
drawsprite();

draw_set_blend_mode(bm_subtract);


if (prog<1)
    {yy=(prog)*48;
    draw_sprite(sprvatglass,0,x,y);    
    draw_sprite_part(sprvatglass,1,0,yy,48,48-yy,x,y+yy);
    yy=1;}
else
    {yy=(prog-1)*48;
    draw_sprite_part(sprvatglass,0,0,yy,48,48-yy,x,y+yy);}
draw_set_blend_mode(bm_add);
draw_sprite_part(sprvatglass,2,0,yy,48,48-yy,x,y+yy);
draw_set_blend_mode(bm_normal);

draw_sprite_ext(sprvat,0,x,y,1,1,0,c_white,1);
draw_sprite_ext(sprvat,0,x,y+48,1,-1,0,c_white,1);
