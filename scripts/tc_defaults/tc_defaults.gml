function tc_defaults() {
	// tc_defaults — restore the default button layout.
	var i;

	for (i = 0; i < global.tc_count; i += 1)
	{
	    global.tc_x[i]    = global.tc_dx[i];
	    global.tc_y[i]    = global.tc_dy[i];
	    global.tc_size[i] = global.tc_dsize[i];
	    global.tc_vis[i]  = global.tc_dvis[i];
	}



}
