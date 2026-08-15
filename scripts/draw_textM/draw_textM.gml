function draw_textM(argument0, argument1, argument2, argument3) {
	draw_set_font(menuFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_alpha(argument3);
	draw_set_blend_mode(bm_add);
	draw_set_color(make_color_rgb(32,0,0));
	for(a=-1; a<=1; a+=1)
	    {
	    for(b=-1; b<=1; b+=1)
	        {
	        draw_text(argument0+a,argument1+b,string_hash_to_newline(argument2));
	        }
	    }
	draw_set_blend_mode(bm_normal);


}
