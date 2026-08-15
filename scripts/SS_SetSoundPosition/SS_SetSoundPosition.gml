function SS_SetSoundPosition(argument0, argument1) {
	// argument1 is a position in seconds.
	if (argument0 >= 0)
	    audio_sound_set_track_position(argument0, argument1);



}
