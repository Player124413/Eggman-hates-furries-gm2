function intro_finish() {
	soundstop_all();
	global.maxVolume=1;
	soundglobal_volume(global.maxVolume);
	with all
	    instance_destroy();
	instance_create(0,0,objMenu);
	if(!global.introHasBeenCleared)
	    {
	    soundplay(global.sndType);
	    global.introHasBeenCleared=1;
	    save();
	    global.saved=1;
	    }
	//


}
