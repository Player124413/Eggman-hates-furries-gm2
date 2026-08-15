if (light>0)
    {
    draw_set_color(c_white);
    draw_set_alpha(light);
    draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,0);
    draw_set_alpha(1);
    light-=global.time/lightDim;
    }
