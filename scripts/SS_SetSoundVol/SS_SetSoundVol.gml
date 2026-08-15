function SS_SetSoundVol(argument0, argument1) {
	// argument1 arrives scaled 0..9999.
	if (argument0 >= 0)
	    audio_sound_gain(argument0, clamp(argument1 / 9999, 0, 1), 0);



}
