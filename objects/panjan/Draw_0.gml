var __b__;
__b__ = action_if(blink || invulnerable==0);
if __b__
{
var dir,h2,v2,c;
draw_sprite(sprite_index,image_index,x,y);
for(a=0; a<4; a+=1)
    {
    dir=angle+a*360/4;
    c=(blink xor (a mod 2) && pri);
    if(c)
        {
        h2=lengthdir_x(1,dir+90);
        v2=lengthdir_y(1,dir+90);
        draw_set_blend_mode(bm_add);
        draw_sprite_ext(sprPanjanBooster,pri-1,x+66*h2,y+66*v2,1,1,dir,c_white,1);
        draw_set_blend_mode(bm_normal);
        }
    draw_sprite_ext(sprPanjan,c,x,y,1,1,dir,c_white,1);
    if(phase==3 && subphs==1 && (blink xor (a mod 2)))
        {
        h2=lengthdir_x(1,dir+90);
        v2=lengthdir_y(1,dir+90);
        draw_set_blend_mode(bm_add);
        draw_sprite_ext(sprPanjanBurn,burnStage+a,x+60*h2,y+60*v2,1,1,0,c_white,1);
        draw_set_blend_mode(bm_normal);
        }
    }
dir=angle2;
if(blink && sec)
    {
    draw_set_blend_mode(bm_add);
    draw_sprite_ext(sprPanjanBooster,sec-1,x,y,1,1,dir,c_white,1);
    draw_set_blend_mode(bm_normal);
    }
draw_sprite_ext(sprPanjan2,(blink && sec),x,y,1,1,dir,c_white,1);


}
blink = !blink;
