function game_completed() {
	global.gameCleared=1;
	//global.gameProgress=-10;
	global.hasStartedAfterClear=0;//force 69
	soundplay(global.sndType);
	save();
	global.saved=1;
	global.introProg=0;//need to do this when returning to intro.

	soundstop_all()
	with all instance_destroy();
	room_restart();


}
