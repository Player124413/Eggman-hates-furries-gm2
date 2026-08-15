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

	controlbg.lev=19;
	room_speed=60;
	instance_create(0,0,uctrl);
	//uctrl handles the rest.


}
