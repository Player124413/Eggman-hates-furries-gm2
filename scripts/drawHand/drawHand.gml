function drawHand(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {
	draw_set_color(argument7);
	if(!argument8)
	    draw_sprite(argument9,0,argument4,argument5);
	draw_line_width(argument0,argument1,argument2,argument3,argument6);
	draw_line_width(argument2,argument3,argument4,argument5,argument6);
	if(argument8)
	    draw_sprite(argument9,0,argument4,argument5);


}
