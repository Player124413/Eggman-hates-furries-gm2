

c=make_color_hsv(0,0,alpha*255);
draw_background_ext(bgOddwarg,x,y,1,1,0,c,1);
draw_sprite_ext(sprite_index,image_index,x+48,y+56,1,1,0,c,1);

draw_set_color(c_white);
if (timer<16)
    {
    draw_set_alpha(1-timer/16);
    draw_rectangle(0,0,640,480,0);
    draw_set_alpha(1);
    }
