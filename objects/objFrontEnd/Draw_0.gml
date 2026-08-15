var __b__;
__b__ = action_if(phase==2);
if __b__
{
draw_background_ext(bgMakeEnd,0,0,1,1,0,image_blend,1);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprHairEnd,0,300,0,2+0.2*sin(timer/100),2.4,-15+1*sin(timer/120),image_blend,1);
draw_set_blend_mode(bm_normal);
if (light>0)
    {
    draw_set_alpha(light);
    draw_set_color(c_white);
    draw_rectangle(0,0,640,480,0);
    draw_set_alpha(1);
    light-=1/120;
    }
draw_set_halign(fa_left);
draw_set_font(foxBoro);
draw_set_color(c_gray);
a=1-min(1,abs(yp1-288)/380)
draw_set_alpha(0.33*a)
draw_text_ext(2,yp1,string_hash_to_newline(txt1),16,-1);
draw_set_alpha(0.67*a)
draw_text_ext(1,yp1,string_hash_to_newline(txt1),16,-1);
draw_set_alpha(1*a)
draw_text_ext(0,yp1,string_hash_to_newline(txt1),16,-1);

a=1-min(1,abs(yp2-288)/380)
draw_set_alpha(0.33*a)
draw_text_ext(2,yp2,string_hash_to_newline(txt2),16,-1);
draw_set_alpha(0.67*a)
draw_text_ext(1,yp2,string_hash_to_newline(txt2),16,-1);
draw_set_alpha(1*a)
draw_text_ext(0,yp2,string_hash_to_newline(txt2),16,-1);
}
else
{
if (light<0)
    {
    draw_set_alpha(-light);
    draw_set_color(c_black);
    draw_rectangle(0,0,640,480,0);
    draw_set_alpha(1);
    }
if (instance_exists(objRainEnd))
    {
    rain=objRainEnd.rain;
    if (rain>0)
        {
        rainmove+=14;
        if (rainmove>=192)
            rainmove-=192;
            
        px=-rainmove-192;
        py=(rainmove*4 mod 192) -192;
        
        draw_set_blend_mode(bm_add);
        while (px<640)
            {
            yy=py;
        
            while (yy<480)
                {
                draw_background_ext(bgRain,px*0.5,yy*0.5,0.5,2*0.5,0,c_white,rain);
                yy+=192;
                }
            px+=192;
            }
        draw_set_blend_mode(bm_normal);
        }
    }
}
__b__ = action_if(phase==0);
if __b__
{
draw_background_ext(bgFrontEnd,0,224,1,1,0,__background_get( e__BG.Blend, 1 ),1);
}
__b__ = action_if(phase==5);
if __b__
{
//draw_set_color(c_white);
//draw_surface(credSurf,0,credY);
yy=0;
draw_background(bgLogo,0,credY);
for(a=0; a<totalCreds; a+=1)
    {
    if(credY+256+yy<480 && credY+256+yy+credH[a]>0)
        {
        draw_set_font(creditFont);
        draw_set_color(make_color_rgb(16,8,8));
        draw_text_ext(2,credY+256+yy,string_hash_to_newline(creds[a]),credSep,credWidth);
        draw_set_color(make_color_rgb(32,16,16));
        draw_text_ext(1,credY+256+yy,string_hash_to_newline(creds[a]),credSep,credWidth);
        draw_set_color(make_color_rgb(64,32,32));
        draw_text_ext(0,credY+256+yy,string_hash_to_newline(creds[a]),credSep,credWidth);
        }
    yy+=credH[a];
    }
}
