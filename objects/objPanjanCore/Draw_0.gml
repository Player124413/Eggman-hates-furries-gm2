drawsprite();
draw_set_blend_mode(bm_add);
if(blink)
    draw_sprite(sprPanjanBurn,burnStage,x+8,y-40);
draw_set_blend_mode(bm_normal);
blink=!blink;
