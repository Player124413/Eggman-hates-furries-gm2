if (timer>0)
    {
    if (timer<1 || timer>=3)
         {
         f=random(timer mod 60)/10;
         f=0;
         draw_set_alpha(power(alpha,2));
         draw_set_blend_mode(bm_add);
         for(c=0; c<=2; c+=1)
            draw_circle_color(__view_get( e__VW.XView, 0 )*objCloudMaker.scroll+x,__view_get( e__VW.YView, 0 )*objCloudMaker.scroll+y,64+f-c*8,color[0],c_black,0);
         draw_set_blend_mode(bm_normal);
         draw_set_alpha(1);
         }
    else if (timer<2)
        {
        with objCloud
            blendmode=bm_add;
        }
    else        {
        with objCloud
            render=0;
        }
    
    }
