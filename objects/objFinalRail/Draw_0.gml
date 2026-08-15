for(i=0; i<hrepeat; i+=1)
    {
    if(x+32*i>__view_get( e__VW.XView, 0 )-32 && x+32*i<__view_get( e__VW.XView, 0 )+640)
        draw_sprite(sprite_index,0,x+32*i,y);
    }
