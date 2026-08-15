function SS_GetSoundPosition(argument0) {
	if (argument0 >= 0) return audio_sound_get_track_position(argument0);
	return 0;



}
