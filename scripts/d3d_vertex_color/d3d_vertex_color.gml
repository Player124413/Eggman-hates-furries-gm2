/// @description d3d - Sets the primitive vertex and colour
/// @param x the x position
/// @param y the y position
/// @param z the z position
/// @param col the colour
/// @param alpha the alpha
function d3d_vertex_color(argument0, argument1, argument2, argument3, argument4) {

	vertex_position_3d( global.__d3dPrimBuffer, argument0, argument1, argument2 );
	vertex_normal( global.__d3dPrimBuffer, 0, 0, 0 );
	vertex_colour( global.__d3dPrimBuffer, argument3, argument4 );
	vertex_texcoord( global.__d3dPrimBuffer, 0, 0 );






}
