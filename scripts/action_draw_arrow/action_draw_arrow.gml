/// @description (Old DnD) - draw and arrow
/// @param x1	x position of start point
/// @param y1	y position of start point
/// @param x2	x position of end point
/// @param y2	y position of end point
/// @param size size of the arrow head
function action_draw_arrow(argument0, argument1, argument2, argument3, argument4) {

	var x1 = argument0;
	var y1 = argument1;
	var x2 = argument2;
	var y2 = argument3;
	var size = argument4;
	if (global.__argument_relative) {
		draw_arrow( x+x1, y+y1, x+x2, y+y2, size );
	} else {
		draw_arrow( x1, y1, x2, y2, size );	
	} // end if


}
