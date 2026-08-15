function tc_fit_screen() {
	// tc_fit_screen — modern-device scaling hook.
	//
	// IMPORTANT: this is intentionally SAFE by default. The touch controls are
	// already self-consistent: they read input with device_mouse_x_to_gui() and
	// draw with display_get_gui_width()/height(), so they work in whatever GUI
	// space the game currently uses. The game's own GUI (pause screen, arrow-key
	// indicator, ring counter) is drawn in fixed 640x480 GUI coordinates, so we
	// must NOT change the GUI size here or those elements would drift.
	//
	// For modern screens (16:9 phones, notched displays, etc.) the correct fix is
	// in GameMaker Studio 2, not in code:
	//
	//   Game Options -> Android -> Graphics -> "Keep Aspect Ratio"  = ON
	//
	// That letterboxes the 640x480 view so it is never stretched. If you still
	// want to letterbox manually (e.g. for a 1.4 build), uncomment the block below.
	// It only moves the view PORT (where the game world is drawn) and leaves the
	// GUI layer untouched.

	/*
	var dw, dh, scale, vw, vh;
	dw = display_get_width();
	dh = display_get_height();
	if (dw > 0 && dh > 0)
	{
	    scale = min(dw / 640, dh / 480);
	    vw = round(640 * scale);
	    vh = round(480 * scale);
	    if (vw > 0 && vh > 0)
	    {
	        view_xport[0] = (dw - vw) div 2;
	        view_yport[0] = (dh - vh) div 2;
	        view_wport[0] = vw;
	        view_hport[0] = vh;
	    }
	}
	*/



}
