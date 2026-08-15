draw_set_color(c_white);
if (timer>0)
    {
    draw_set_alpha(min(1,timer/4));
    draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,0);
    }
else
    {
    draw_set_alpha(alpha);
    draw_circle(x,y,radius,0);
    }
draw_set_alpha(1);
