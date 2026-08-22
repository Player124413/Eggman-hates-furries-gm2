function endLast() {
	d3d_set_culling(0);
	d3d_end();

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
