action_set_relative(1);
action_draw_sprite(sprServer, 0, 0, image_index);
var __b__;
__b__ = action_if(image_index==1);
if __b__
{
{
action_color(16384);
action_font(tdlFont, 1);
if(random(8)<1)
    {txt+=" "+string_copy("abcdef%hi+klno*-rstuvx=z!?0123456789",ceil(random(37)),1);
    if (string_length(txt)>8)
    txt=string_delete(txt,1,2);}
draw_text(x-13,y-42,string_hash_to_newline(txt));

}
}
action_set_relative(0);
