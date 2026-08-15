/// @description Draws a simple 3D block.
/// @param x1 The initial x coordinate of the block. 
/// @param y1 The initial y coordinate of the block.
/// @param z1 The initial z coordinate of the block.
/// @param x2 The opposite x coordinate of the block.
/// @param y2 The opposite y coordinate of the block.
/// @param z2 The opposite z coordinate of the block.
/// @param tex The id of the texture to use (-1 for no texture)
/// @param hrepeat Amount of horizontal repetitions for the texture.
/// @param vrepeat Amount of vertical repetitions for the texture.
/// @returns 
function d3d_draw_block(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {

	var __x1 = argument0;
	var __y1 = argument1;
	var __z1 = argument2;
	var __x2 = argument3;
	var __y2 = argument4;
	var __z2 = argument5;
	var __tex = argument6;
	var __hrepeat = argument7;
	var __vrepeat = argument8;

	var __oldrep = gpu_get_texrepeat();
	gpu_set_texrepeat(true)	

	d3d_primitive_begin_texture(pr_trianglelist, __tex);


	d3d_vertex_normal_texture(__x1, __y1, __z1, 0, 0, -1, 0, 0);
	d3d_vertex_normal_texture(__x1, __y2, __z1, 0, 0, -1, 0, __vrepeat);
	d3d_vertex_normal_texture(__x2, __y2, __z1, 0, 0, -1, __hrepeat, __vrepeat);

	d3d_vertex_normal_texture(__x2, __y2, __z1, 0, 0, -1, __hrepeat, __vrepeat);
	d3d_vertex_normal_texture(__x2, __y1, __z1, 0, 0, -1, __hrepeat, 0);
	d3d_vertex_normal_texture(__x1, __y1, __z1, 0, 0, -1, 0, 0);


	d3d_vertex_normal_texture(__x1, __y1, __z2, 0, 0, 1, 0, 0);
	d3d_vertex_normal_texture(__x2, __y1, __z2, 0, 0, 1, __hrepeat, 0);
	d3d_vertex_normal_texture(__x2, __y2, __z2, 0, 0, 1, __hrepeat, __vrepeat);

	d3d_vertex_normal_texture(__x2, __y2, __z2, 0, 0, 1, __hrepeat, __vrepeat);
	d3d_vertex_normal_texture(__x1, __y2, __z2, 0, 0, 1, 0, __vrepeat);
	d3d_vertex_normal_texture(__x1, __y1, __z2, 0, 0, 1, 0, 0);


	d3d_vertex_normal_texture(__x1, __y2, __z1, 0, 1, 0, 0, 0);
	d3d_vertex_normal_texture(__x1, __y2, __z2, 0, 1, 0, 0, __vrepeat);
	d3d_vertex_normal_texture(__x2, __y2, __z2, 0, 1, 0, __hrepeat, __vrepeat);

	d3d_vertex_normal_texture(__x2, __y2, __z2, 0, 1, 0, __hrepeat, __vrepeat);
	d3d_vertex_normal_texture(__x2, __y2, __z1, 0, 1, 0, __hrepeat, 0);
	d3d_vertex_normal_texture(__x1, __y2, __z1, 0, 1, 0, 0, 0);


	d3d_vertex_normal_texture(__x2, __y2, __z1, 1, 0, 0, 0, 0);
	d3d_vertex_normal_texture(__x2, __y2, __z2, 1, 0, 0, 0, __vrepeat);
	d3d_vertex_normal_texture(__x2, __y1, __z2, 1, 0, 0, __hrepeat, __vrepeat);

	d3d_vertex_normal_texture(__x2, __y1, __z2, 1, 0, 0, __hrepeat, __vrepeat);
	d3d_vertex_normal_texture(__x2, __y1, __z1, 1, 0, 0, __hrepeat, 0);
	d3d_vertex_normal_texture(__x2, __y2, __z1, 1, 0, 0, 0, 0);


	d3d_vertex_normal_texture(__x2, __y1, __z1, 0, -1, 0, 0, 0);
	d3d_vertex_normal_texture(__x2, __y1, __z2, 0, -1, 0, 0, __vrepeat);
	d3d_vertex_normal_texture(__x1, __y1, __z2, 0, -1, 0, __hrepeat, __vrepeat);

	d3d_vertex_normal_texture(__x1, __y1, __z2, 0, -1, 0, __hrepeat, __vrepeat);
	d3d_vertex_normal_texture(__x1, __y1, __z1, 0, -1, 0, __hrepeat, 0);
	d3d_vertex_normal_texture(__x2, __y1, __z1, 0, -1, 0, 0, 0);


	d3d_vertex_normal_texture(__x1, __y1, __z1, -1, 0, 0, 0, 0);
	d3d_vertex_normal_texture(__x1, __y1, __z2, -1, 0, 0, 0, __vrepeat);
	d3d_vertex_normal_texture(__x1, __y2, __z2, -1, 0, 0, __hrepeat, __vrepeat);

	d3d_vertex_normal_texture(__x1, __y2, __z2, -1, 0, 0, __hrepeat, __vrepeat);
	d3d_vertex_normal_texture(__x1, __y2, __z1, -1, 0, 0, __hrepeat, 0);
	d3d_vertex_normal_texture(__x1, __y1, __z1, -1, 0, 0, 0, 0);

	d3d_primitive_end();

	gpu_set_texrepeat(__oldrep);


}
