function oxygenUp() {
	if(drownCounter>drownDanger)
	    {
	    audio_stop_sound(oxygen);
	    if(controlbg.lev>=-5)
	        SS_ResumeSound(global.handle);
	    }
	drownSeconds=11;
	drownCounter=0;
	drownTimer=0;


}
