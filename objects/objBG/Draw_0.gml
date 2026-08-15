draw_background(bgsky,__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ));
draw_background(bgsky,__view_get( e__VW.XView, 0 )+512,__view_get( e__VW.YView, 0 ));

rainmove+=7*global.time;
if (rainmove>=192*0.8)
    rainmove-=192*0.8;

drawRain(0.8,0.9);
