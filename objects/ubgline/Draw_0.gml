c=make_color_rgb(8,8,8);
draw_rectangle_color(__view_get( e__VW.XView, 0 ),y,__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,c,c,c_black,c_black,0);
b=floor(__view_get( e__VW.XView, 0 )/8);
ff=__view_get( e__VW.XView, 0 )*0.1 mod 80;
for(xx=ff-80+8*floor(__view_get( e__VW.XView, 0 ) / 8); xx<__view_get( e__VW.XView, 0 )+640; xx+=8)
    {
    if (b mod 2 == 0) a=c1; else a=c2;
    draw_sprite_ext(sgrass2SMALL,b mod 5,xx+4,y,1,1,0,a,1);
    b+=1;
    }

