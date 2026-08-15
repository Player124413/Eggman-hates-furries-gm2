function surfaceError() {
	if(global.ignoreSurfaces==0)
	    {
	    show_message("WARNING: Surfaces do not seem to work on your computer. This will result in missing/degraded graphics.");
	    global.ignoreSurfaces=1;
	    }


}
