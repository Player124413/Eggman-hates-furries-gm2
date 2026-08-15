image_blend=make_color_hsv(40+4*cos(hue),255,255);
hue+=0.1;
d3d_sprite();
if (sprite_index==sprSonicUnder)
    {
    sprite_index=sprSonicOver;
    image_blend=c_white;
    d3d_sprite();
    sprite_index=sprSonicUnder;
    }

