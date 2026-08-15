function tc_load() {
	// tc_load — load a saved touch-button layout from the sandbox.
	// If the file is missing, the defaults set in the Create event are kept.
	var f, i, j, k, tx, ty, ts, tv, idx;

	if (!file_exists("tc_layout.json")) return;

	f = file_text_open_read("tc_layout.json");

	i = 0;
	while (!file_text_eof(f) && i < global.tc_count)
	{
	    k  = file_text_read_real(f); file_text_readln(f);
	    tx = file_text_read_real(f); file_text_readln(f);
	    ty = file_text_read_real(f); file_text_readln(f);
	    ts = file_text_read_real(f); file_text_readln(f);
	    tv = file_text_read_real(f); file_text_readln(f);

	    idx = -1;
	    for (j = 0; j < global.tc_count; j += 1)
	    {
	        if (global.tc_key[j] == k) { idx = j; break; }
	    }

	    if (idx != -1)
	    {
	        global.tc_x[idx]    = clamp(tx, 0, 1);
	        global.tc_y[idx]    = clamp(ty, 0, 1);
	        global.tc_size[idx] = clamp(ts, 0.02, 0.4);
	        global.tc_vis[idx]  = (tv >= 0.5);
	    }

	    i += 1;
	}

	file_text_close(f);



}
