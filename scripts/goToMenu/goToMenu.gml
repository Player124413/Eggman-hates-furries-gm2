function goToMenu() {
	with all
	    instance_destroy();
	soundstop_all();
	audio_stop_all();
	instance_create(0,0,objMenu);


}
