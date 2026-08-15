if(blink)
    {
    draw_set_blend_mode(bm_add);
    drawsprite();
    draw_set_blend_mode(bm_normal);
    }

blink=!blink;
