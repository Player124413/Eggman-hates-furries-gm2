draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
draw_clear(c_black);
yy=0;
// The migrated logo can be treated as colour-keyed/transparent by the runner.
// Paint its original black backing explicitly so the title never sits on white.
draw_set_color(c_black);
draw_rectangle(0, credY + 208, 320, credY + 240, false);
draw_background_part(bgLogo,0,208,320,32,0,credY+208);
for(a=0; a<totalCreds; a+=1)
    {
    if(credY+256+yy<480 && credY+256+yy+credH[a]>0)
        {
        draw_set_color(make_color_rgb(16,8,8));
        draw_text_ext(2,credY+256+yy,string_hash_to_newline(creds[a]),credSep,credWidth);
        draw_set_color(make_color_rgb(32,16,16));
        draw_text_ext(1,credY+256+yy,string_hash_to_newline(creds[a]),credSep,credWidth);
        draw_set_color(make_color_rgb(64,32,32));
        draw_text_ext(0,credY+256+yy,string_hash_to_newline(creds[a]),credSep,credWidth);
        }
    yy+=credH[a];
    }
if (light<0)
    {
    draw_set_alpha(-light);
    draw_set_color(c_black);
    draw_rectangle(0,0,640,480,0);
    draw_set_alpha(1);
    }
