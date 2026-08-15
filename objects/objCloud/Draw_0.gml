if(render)
    {
    draw_set_blend_mode(blendmode);
    draw_sprite_ext(sprclouds,img,__view_get( e__VW.XView, 0 )*objCloudMaker.scroll+x,__view_get( e__VW.YView, 0 )*objCloudMaker.scroll+y,1,1,rot,make_color_rgb(c*255,c*255,c*255),1);
    draw_set_blend_mode(bm_normal);
    }
blendmode=bm_subtract;
render=1;
