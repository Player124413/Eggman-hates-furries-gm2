ax=192*(__view_get( e__VW.XView, 0 ) div 192);
ax+=((__view_get( e__VW.XView, 0 )*1.1) mod 192)-192;
while (ax<__view_get( e__VW.XView, 0 )-192)
    ax+=192;
while (ax<__view_get( e__VW.XView, 0 )+640)
    {
    draw_background(bgDustBottom,ax,288);
    ax+=192;
    }
if(instance_exists(objUltima) && rA>0)
    {
    if(global.time==0)
        rA-=1/60;
    draw_sprite_ext(sprEvilRings,0,__view_get( e__VW.XView, 0 )+488+24,__view_get( e__VW.YView, 0 )+17,1,1,0,c_white,rA);
    
    draw_set_alpha(rA);
    draw_set_color(c_black);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_font(ringfont);
    draw_text(__view_get( e__VW.XView, 0 )+488+112,__view_get( e__VW.YView, 0 )+17,string_hash_to_newline(string(floor(objUltima.myRings))));
    draw_set_color(make_color_rgb(56,16,48));
    draw_text(__view_get( e__VW.XView, 0 )+488+110,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(string(floor(objUltima.myRings))));
    draw_set_color(c_white);
    draw_set_alpha(1);
    }
if(whiteNoise>0)
    {
    h=round(random(1));
    v=round(random(1));
    draw_background_ext(bgWhiteSurf, __view_get( e__VW.XView, 0 )+h*640,__view_get( e__VW.YView, 0 )+v*480,2*sign(0.5-h),2*sign(0.5-v),0,c_white,1);
    
    whiteNoise-=1;//NOT GLOBAL.TIME!!!
    if(whiteNoise<=0)
        soundstop(global.sndWhitenoise);
    }
if(light>0)
    {
    draw_set_alpha(light);
    draw_set_color(c_white);
    draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,0);
    draw_set_alpha(1);
    }
