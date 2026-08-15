draw_rectangle_color(x,0,x+320,480,c_red,c_red,c_maroon,c_maroon,0);

for(b=0; b<480; b+=96)
    {
    draw_sprite(sprite_index,0,x,b);
    }
c=0;
for(b=scroll; (b<scroll+480/32 && b<items); b+=1)
    {
    img=0; if(choice==b) img=1;
    draw_sprite(sprMenuItem,img,x+16,c);
    color=make_color_hsv(0,255,128+127*img);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(color);
    draw_set_font(menuFont);
    draw_text(x+20,c+4,string_hash_to_newline(item[b]));
    c+=32;
    }
var __b__;
__b__ = action_if(myImg!=-1);
if __b__
{

draw_background(myImg,80,60);
}
__b__ = action_if(geWhite);
if __b__
{
draw_set_color(c_white);
draw_rectangle(80,60,80+160,60+120,0);
geWhite=0;
}
