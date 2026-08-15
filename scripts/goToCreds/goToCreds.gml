function goToCreds() {
	//called in context of ultimate
	controlbg.lev=20;
	with all
	    {
	    if (object_index!=controlbg)
	        {
	        instance_destroy();
	        }
	    }
	instance_create(0,0,objFrontEnd);
	room_speed=30;


}
