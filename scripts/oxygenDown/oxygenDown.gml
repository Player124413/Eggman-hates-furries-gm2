function oxygenDown() {
	drownTimer+=global.time;
	if (drownTimer mod 90 == 0 || drownTimer mod 90 == 15)
	    {
	    instance_create(sonic.x+6*sonic.image_xscale,sonic.y-8,objBubble);
	    }

	if (drownTimer>30*6)
	    {
	    drownTimer=0;
	    if (drownCounter<drownDanger)
	        soundplay(global.sndTimer);
	    if (drownCounter==drownDanger)
	        {
	        if (controlbg.lev>=-5)
	            SS_PauseSound(global.handle);
	        audio_play_sound(oxygen, 10, false);
	        }
	    if (drownCounter==drownDanger+2)
	        {
	        game_over(1);
	        }
	    drownCounter+=1;
	    }


}
