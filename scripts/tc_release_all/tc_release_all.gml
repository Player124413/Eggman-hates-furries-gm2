function tc_release_all() {
	// tc_release_all — release every button (e.g. when toggling the editor).
	var i;

	for (i = 0; i < global.tc_count; i += 1)
	{
	    if (global.tc_pressed[i])
	    {
	        keyboard_key_release(global.tc_key[i]);
	        global.tc_pressed[i] = 0;
	    }
	}

	for (i = 0; i < 5; i += 1)
	{
	    global.tc_dev_btn[i] = -1;
	}



}
