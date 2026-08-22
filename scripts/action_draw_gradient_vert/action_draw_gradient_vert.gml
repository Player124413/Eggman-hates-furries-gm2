/// @description (Old DnD) - draw gradient vertical
/// @param x1	x position of start point
/// @param y1	y position of start point
/// @param x2	x position of end point
/// @param y2	y position of end point
/// @param c1   colour 1
/// @param c2   colour 2
function action_draw_gradient_vert(argument0, argument1, argument2, argument3, argument4, argument5) {

	var xx1 = argument0;
	var yy1 = argument1;
	var xx2 = argument2;
	var yy2 = argument3;
	var c1 = argument4;
	var c2 = argument5;
	if (global.__argument_relative) {
		xx1 += x;
		yy1 += y;
		xx2 += x;
		yy2 += y;
	}  // end if

	// draw_rectangle_ext was a legacy compatibility call and is not a GMS2
	// runtime function. draw_rectangle_color provides the same four-corner
	// interpolation without raising an undefined-function error.
	draw_rectangle_color(xx1, yy1, xx2, yy2, c1, c1, c2, c2, false);



}
