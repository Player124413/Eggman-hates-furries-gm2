if(global.playerWantsControls!=lastP)
    showControls=global.playerWantsControls;
if(global.gameWantsControls!=lastC)
    showControls=global.gameWantsControls || global.playerWantsControls;

lastP=global.playerWantsControls;
lastC=global.gameWantsControls;
var __b__;
__b__ = action_if(instance_exists(sonic) && showControls);
if __b__
{
__b__ = action_if(sonic.able);
if __b__
{
var newDir;
if (sonic.gnd>0 && sonic.lastgnd!=0/* || sonic.specialStopCase*/)
    newDir=sonic.image_angle;
else
    newDir=sonic.flyRight

/*if (dirr<90 && newDir>270)
    dirr+=360;
if (dirr>270 && newDir<90)
    dirr-=360;
dirr=(newDir+dirr)/2;*/
dirr=newDir;

h1=lengthdir_x(1,dirr);
v1=lengthdir_y(1,dirr);
h2=lengthdir_x(1,dirr+90);
v2=lengthdir_y(1,dirr+90);

img=keyboard_check(vk_left);
draw_sprite_ext(sprArrowKey,img,sonic.x+h2*48-h1*16,sonic.y+v2*48-v1*16,0.5,0.5,dirr+180,image_blend,0.5);
img=keyboard_check(vk_down);
draw_sprite_ext(sprArrowKey,img,sonic.x+h2*48,sonic.y+v2*48,0.5,0.5,dirr+270,image_blend,0.5);
img=keyboard_check(vk_right);
draw_sprite_ext(sprArrowKey,img,sonic.x+h2*48+h1*16,sonic.y+v2*48+v1*16,0.5,0.5,dirr,image_blend,0.5);
img=keyboard_check(vk_up);
draw_sprite_ext(sprArrowKey,img,sonic.x+h2*(48+16),sonic.y+v2*(48+16),0.5,0.5,dirr+90,image_blend,0.5);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprGravityArrow,0,sonic.x,sonic.y,1,1,sonic.flyRight+270,image_blend,0.5);
draw_set_blend_mode(bm_normal);

/* */
}
}
__b__ = action_if(instance_exists(sonails) && showControls);
if __b__
{
__b__ = action_if(sonails.able);
if __b__
{
var newDir;
if (sonails.gnd>0)
    newDir=sonails.image_angle;
else
    newDir=0

dirr=newDir;

h1=lengthdir_x(1,dirr);
v1=lengthdir_y(1,dirr);
h2=lengthdir_x(1,dirr+90);
v2=lengthdir_y(1,dirr+90);

img=keyboard_check(vk_left);
draw_sprite_ext(sprArrowKey,img,sonails.x+h2*48-h1*16,sonails.y+v2*48-v1*16,0.5,0.5,dirr+180,image_blend,0.5);
img=keyboard_check(vk_down);
draw_sprite_ext(sprArrowKey,img,sonails.x+h2*48,sonails.y+v2*48,0.5,0.5,dirr+270,image_blend,0.5);
img=keyboard_check(vk_right);
draw_sprite_ext(sprArrowKey,img,sonails.x+h2*48+h1*16,sonails.y+v2*48+v1*16,0.5,0.5,dirr,image_blend,0.5);
img=keyboard_check(vk_up);
draw_sprite_ext(sprArrowKey,img,sonails.x+h2*(48+16),sonails.y+v2*(48+16),0.5,0.5,dirr+90,image_blend,0.5);
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprGravityArrow,0,sonails.x,sonails.y,1,1,270,image_blend,0.5);
draw_set_blend_mode(bm_normal);

/* */
}
}
__b__ = action_if(showRings);
if __b__
{
draw_sprite(sprRingCounter,0,__view_get( e__VW.XView, 0 )+24,__view_get( e__VW.YView, 0 )+17);

draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(ringfont);
draw_text(__view_get( e__VW.XView, 0 )+112,__view_get( e__VW.YView, 0 )+17,string_hash_to_newline(string(global.rings)));
draw_set_color(make_color_rgb(176,4,12));
draw_text(__view_get( e__VW.XView, 0 )+110,__view_get( e__VW.YView, 0 )+16,string_hash_to_newline(string(global.rings)));
draw_set_color(c_white);

/* */
}
__b__ = action_if(global.saved>0);
if __b__
{
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprAutoSave1,0,__view_get( e__VW.XView, 0 )+40,__view_get( e__VW.YView, 0 )+46,1,1,0,c_white,global.saved);
draw_sprite_ext(sprAutoSave2,0,__view_get( e__VW.XView, 0 )+30,__view_get( e__VW.YView, 0 )+46,1,1,-2000*global.saved,c_white,global.saved);
if(view_current==0)
    global.saved-=global.time/120;
draw_set_blend_mode(bm_normal);
/* */
}
if(slowDownMessage>0)
    {
    draw_set_font(counterfont);
    draw_set_color(c_maroon);
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);
    draw_text(__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,string_hash_to_newline(string(fps)+"/"+string(room_speed)+": LOW FRAMERATE"));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
    }
/* */
/*  */
