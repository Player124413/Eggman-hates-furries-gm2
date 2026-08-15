function d3d_sprite() {
	d3d_transform_add_rotation_y(-point_direction(0,z,point_distance(x,y,cam.x,cam.y),cam.z)+90);
	d3d_transform_add_rotation_z(point_direction(x,y,cam.x,cam.y));
	d3d_transform_add_translation(x,y,z);
	draw_sprite_ext(sprite_index,floor(image_index),0,0,image_xscale,-image_yscale,image_angle+90,image_blend,image_alpha);
	d3d_transform_set_identity();


}
