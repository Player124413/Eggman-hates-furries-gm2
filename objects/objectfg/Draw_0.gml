var __b__;
__b__ = action_if(((controlbg.lev==-2 && instance_exists(objtornado2)) || controlbg.lev==1) && controlbg.on);
if __b__
{

h1=-__view_get( e__VW.XView, 0 )*0.05 mod 640;
v1=-1080-__view_get( e__VW.YView, 0 )*0.05;


h2=-__view_get( e__VW.XView, 0 )*0.1 mod 640;
v2=-1080-__view_get( e__VW.YView, 0 )*0.1;
while (h1<__view_get( e__VW.XView, 0 ))
    h1+=640;
while (h2<__view_get( e__VW.XView, 0 ))
    h2+=320;
while (h1>__view_get( e__VW.XView, 0 )+640)
    h1-=640;
while (h2>__view_get( e__VW.XView, 0 )+320)
    h2-=320;

draw_set_blend_mode(bm_add);
draw_background(bgskies,h1-640,v1);
draw_background(bgskies,h1,v1);
//draw_background(bgskies,h1+640,v1);

//draw_background_ext(bgskies,h2-640,v2,0.5,0.5,0,c_white,1);
draw_background_ext(bgskies,h2-320,v2,0.5,0.5,0,c_white,1);
draw_background_ext(bgskies,h2,v2,0.5,0.5,0,c_white,1);
draw_background_ext(bgskies,h2+320,v2,0.5,0.5,0,c_white,1);
//draw_background_ext(bgskies,h2+640,v2,0.5,0.5,0,c_white,1);
//draw_background_ext(bgskies,h2+960,v2,0.5,0.5,0,c_white,1);
draw_set_blend_mode(bm_normal);
}
__b__ = action_if(flashlight>0);
if __b__
{
draw_set_alpha(flashlight);
draw_set_color(c_white);
draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+512,0);

draw_set_alpha(1);
if(view_current==0)
flashlight-=global.time/60;

}
__b__ = action_if(darkness>0);
if __b__
{
draw_set_alpha(darkness);
draw_set_color(c_black);
draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+512,0);
draw_set_alpha(1);

}
__b__ = action_if(flashlight==-1);
if __b__
{

draw_set_color(c_black);
draw_rectangle(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,0);
}
__b__ = action_if(instance_exists(objDoomRack));
if __b__
{
if (objDoomRack.charging && doom.phase<=2)
    {
    draw_sprite(sprCountDown,doom.life,__view_get( e__VW.XView, 0 )+584,__view_get( e__VW.YView, 0 )+8);
    draw_set_color(c_red);
    draw_set_font(counterfont);
    draw_text(__view_get( e__VW.XView, 0 )+584,__view_get( e__VW.YView, 0 )+8,string_hash_to_newline(floor(objDoomRack.chargeSeconds)));
    }
if(doom.phase==2 && doom.invulnerable<=0)
    {
    draw_set_color(c_black);
    draw_rectangle(__view_get( e__VW.XView, 0 )+160,__view_get( e__VW.YView, 0 )+16,__view_get( e__VW.XView, 0 )+160+150,__view_get( e__VW.YView, 0 )+24,0);
    draw_set_color(c_maroon);
    if (doom.life<2)    
        {
        draw_rectangle(__view_get( e__VW.XView, 0 )+160+60,__view_get( e__VW.YView, 0 )+17,__view_get( e__VW.XView, 0 )+160+140,__view_get( e__VW.YView, 0 )+23,0);
        }
    else if (doom.life<3)
        {
        draw_rectangle(__view_get( e__VW.XView, 0 )+160+20,__view_get( e__VW.YView, 0 )+17,__view_get( e__VW.XView, 0 )+160+60,__view_get( e__VW.YView, 0 )+23,0);
        draw_rectangle(__view_get( e__VW.XView, 0 )+160+70,__view_get( e__VW.YView, 0 )+17,__view_get( e__VW.XView, 0 )+160+120,__view_get( e__VW.YView, 0 )+23,0);
        }
    else if (doom.life<4)
        {
        draw_rectangle(__view_get( e__VW.XView, 0 )+160+13,__view_get( e__VW.YView, 0 )+17,__view_get( e__VW.XView, 0 )+160+37,__view_get( e__VW.YView, 0 )+23,0);
        draw_rectangle(__view_get( e__VW.XView, 0 )+160+40,__view_get( e__VW.YView, 0 )+17,__view_get( e__VW.XView, 0 )+160+77,__view_get( e__VW.YView, 0 )+23,0);
        draw_rectangle(__view_get( e__VW.XView, 0 )+160+80,__view_get( e__VW.YView, 0 )+17,__view_get( e__VW.XView, 0 )+160+107,__view_get( e__VW.YView, 0 )+23,0);
        }
    else if (doom.life<5)
        {
        draw_rectangle(__view_get( e__VW.XView, 0 )+160+10,__view_get( e__VW.YView, 0 )+17,__view_get( e__VW.XView, 0 )+160+50,__view_get( e__VW.YView, 0 )+23,0);
        draw_rectangle(__view_get( e__VW.XView, 0 )+160+60,__view_get( e__VW.YView, 0 )+17,__view_get( e__VW.XView, 0 )+160+67,__view_get( e__VW.YView, 0 )+23,0);
        draw_rectangle(__view_get( e__VW.XView, 0 )+160+125,__view_get( e__VW.YView, 0 )+17,__view_get( e__VW.XView, 0 )+160+149,__view_get( e__VW.YView, 0 )+23,0);
        }
    draw_sprite(sprDoomIndicator,0,__view_get( e__VW.XView, 0 )+160+objDoomRack.lazortime,__view_get( e__VW.YView, 0 )+20);
    }
}
