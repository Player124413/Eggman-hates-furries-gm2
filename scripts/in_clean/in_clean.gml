function in_clean() {
	with mtline
	    {
	    if(active)
	        {
	        if(xa<__view_get( e__VW.XView, 0 )-640)
	            instance_destroy();
	        }
	    }
	with mtpoint
	    {
	    if(x<__view_get( e__VW.XView, 0 )-640)
	        instance_destroy();
	    }



}
