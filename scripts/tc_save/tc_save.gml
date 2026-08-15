function tc_save() {
	// tc_save — persist the current touch-button layout.
	// Format: five numbers per button (key, x, y, size, visible), one per line.
	var f, i;

	f = file_text_open_write("tc_layout.json");

	for (i = 0; i < global.tc_count; i += 1)
	{
	    file_text_write_real(f, global.tc_key[i]);   file_text_writeln(f);
	    file_text_write_real(f, global.tc_x[i]);     file_text_writeln(f);
	    file_text_write_real(f, global.tc_y[i]);     file_text_writeln(f);
	    file_text_write_real(f, global.tc_size[i]);  file_text_writeln(f);
	    file_text_write_real(f, global.tc_vis[i]);   file_text_writeln(f);
	}

	file_text_close(f);



}
