function drawFoot(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {
	draw_set_color(argument9);
	if(!argument10)
	    draw_sprite_ext(argument11,argument6,argument4,argument5,argument7,1,0,c_white,1);
	draw_line_width(argument0,argument1,argument2,argument3,argument8);
	draw_line_width(argument2,argument3,argument4,argument5,argument8);
	if(argument10)
	    draw_sprite_ext(argument11,argument6,argument4,argument5,argument7,1,0,c_white,1);


}
