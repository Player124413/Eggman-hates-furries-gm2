var __b__;
__b__ = action_if(invulnerable<=0);
if __b__
{
var obj,dir,c;
obj=objSuperSonic;

if(counter mod 2 == 1 && returnTimer==0 && (decision==-1 || lProg>=30))
    {
    if(lProg>=11 && lProg<=13 && obj.x>36 && obj.x<=x-172)
        {
        c=make_color_rgb(64,0,0);
        dir=155+(25*(1+sin((timer+23-counter*5)/(43-(counter-1)*8))));
        draw_set_blend_mode(bm_add);
        draw_line_width_color(x,y,x+lengthdir_x(640,dir),y+lengthdir_y(640,dir),3,c,c_black);
        draw_line_width_color(x,y,x+lengthdir_x(640,dir),y+lengthdir_y(640,dir),1,c,c_black);
        draw_set_blend_mode(bm_normal);
        }
    }
}
if(blink && auraColor!=c_black)
    draw_sprite_ext(sprEggAura,0,x,y,1,1,0,auraColor,1);
drawsprite();

if(lazor)
    {
    draw_set_blend_mode(bm_add);
    if(lazorDir==180)
        {interruptableLazor(xx,yy,24,eightstage,1);
        draw_sprite_ext(sprbigout,eightstage,xx,yy,1,1,lazorDir,c_white,1);}
    else
        {drawLazor(xx,yy,lazorDir,24,eightstage,0.5);
        draw_sprite_ext(sprbigout,eightstage,xx,yy,1,0.5,lazorDir,c_white,1);}
    draw_set_blend_mode(bm_normal);
    }
