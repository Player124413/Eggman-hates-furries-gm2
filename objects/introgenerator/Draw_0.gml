var ok;
rainmove+=9*global.time;
if (rainmove>=192)
    rainmove-=192;

drawRain(1,1.1);
ok=1;
if(instance_exists(objBolt))
    {
    if(objBolt.timer>=1 && objBolt.timer<2)
        ok=0;
    }
if(ok)
    {
    draw_set_blend_mode(bm_subtract);
    if(surface_exists(surf))
        draw_surface(surf,__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ));
    else
        surfaceError();
    draw_set_blend_mode(bm_normal);
    }

var ok;
ok=0;
if (phase==0 && timer>220 && timer<230+44*30)
    {ok=1;
    if(txt=="")
        {txt=mono_0;
        newText=true;}
    textTime=10+44*30;
    }
if (phase==3 && timer<10+19*30)
    {ok=1;
    if(txt=="")
        {txt=mono_1;
        newText=true;}
    textTime=10+19*30;
    }
if (phase==5 && timer<10+26*30)
    {ok=1;
    if(txt=="")
        {txt=mono_2;
        newText=true;}
    textTime=10+26*30;
    }
if(ok)
    {
    if(txtAlpha<1)
        txtAlpha+=global.time/30;
    }
else if (txtAlpha>0)
    {
    txtAlpha-=global.time/30;
    if (txtAlpha<=0)
        {
        textProg=0;
        txt="";
        }
    }
if (txtAlpha>0)
    {
    draw_set_blend_mode(bm_add);
    if(surface_exists(textSurf))
        draw_surface(textSurf,__view_get( e__VW.XView, 0 )+160,__view_get( e__VW.YView, 0 ));
    else
        surfaceError();
    draw_set_blend_mode(bm_normal);
    }

var __b__;
__b__ = action_if(tutorialText!="");
if __b__
{
{
action_font(tutorialFont, 1);
var c;
if(tutorialBlink)
    draw_set_color(make_color_rgb(96+32*cos(timer/100),112+16*sin(uninterruptableTimer/100),64));
else
    draw_set_color(make_color_rgb(48+16*cos(timer/100),56+8*sin(uninterruptableTimer/100),32));
draw_set_blend_mode(bm_add);
for(c=-1; c<=1; c+=1)
    draw_text(__view_get( e__VW.XView, 0 )+320+c,__view_get( e__VW.YView, 0 )+224,string_hash_to_newline(tutorialText));
draw_set_blend_mode(bm_normal);

draw_set_halign(fa_left);
}
}
__b__ = action_if(white>0);
if __b__
{
draw_set_alpha(white);
draw_set_color(c_white);
draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,0);
draw_set_alpha(1);
}
var j,c;
if(instance_exists(bike))
    {
    if(bike.able)
        {
        for(j=0; j<10; j+=1)
            {
            if(j<bike.boostgauge*10)
                c=make_color_hsv(96*j/10,192,96);
            else
                c=make_color_rgb(16,16,16);
            draw_sprite_ext(sprBoostGauge,0,1+__view_get( e__VW.XView, 0 )+j*9,__view_get( e__VW.YView, 0 )+471,1,1,0,c,1);
            }
        }
    }
__b__ = action_if(0);
if __b__
{
{
action_font(undefined, 0);
action_color(8388736);
action_draw_text(""+string(fps), __view_get( e__VW.XView, 0 ), __view_get( e__VW.YView, 0 ));
}
}
