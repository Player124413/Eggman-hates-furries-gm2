function goToLast() {
	controlbg.lev=18;
	with all
	    {
	    if (object_index!=controlbg)
	        {
	        instance_destroy();
	        }
	    }
	//Must be called in the context of super boss.
	__background_set_colour( make_color_rgb(12,0,17) );
	instance_create(0,0,cam);
	instance_create(0,0,overlay);
	room_speed=30;


}
