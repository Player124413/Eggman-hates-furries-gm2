function SS_SetSoundFreq(argument0, argument1) {
	// argument1 arrives as 1000..100000 (1000 == normal pitch).
	if (argument0 >= 0)
	    audio_sound_pitch(argument0, argument1 / 1000);



}
