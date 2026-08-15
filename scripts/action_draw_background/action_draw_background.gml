/// @description (Old DnD) - draw background
/// @param index resource index
/// @param x	x position
/// @param y	y position
/// @param tiled	true if tiled
function action_draw_background(argument0, argument1, argument2, argument3) {

	var xx = argument1;
	var yy = argument2;
	if (global.__argument_relative) {
		xx += x;
		yy += y;
	}  // end if

	// draw tiled if argument3 is true
	if (argument3) {
		draw_sprite_tiled( argument0, 0, xx, yy )
	} else {
		draw_sprite( argument0, 0, xx, yy );
	} // end if


}
