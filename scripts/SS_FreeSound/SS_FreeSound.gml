function SS_FreeSound(argument0) {
	// Bundled assets can't be unloaded; just stop playback.
	if (argument0 >= 0) audio_stop_sound(argument0);



}
