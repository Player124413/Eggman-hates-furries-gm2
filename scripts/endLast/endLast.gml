function endLast() {
	// Leave the 3D atomic-explosion pass with a clean 2D render state.
	d3d_set_culling(0);
	d3d_set_fog(false,c_black,0,0);
	d3d_end();
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
	draw_set_blend_mode(bm_normal);
	draw_set_color(c_white);
	draw_set_alpha(1);

	draw_clear(c_black);


	with all
	    {
	    if (object_index!=controlbg)
	        {
	        instance_destroy();
	        }
	    }

	// Show the End scene first. Ultimate starts after its presentation.
	controlbg.lev=20;
	room_speed=30;
	instance_create(0,0,objFrontEnd);
	// objFrontEnd hands off to Ultimate when it finishes.


}
