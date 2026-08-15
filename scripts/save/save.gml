function save() {
	var file;
	file=file_text_open_write("dat.dat");
	file_text_write_string(file,string(global.introHasBeenCleared));
	file_text_writeln(file);
	file_text_write_string(file,string(global.gameProgress));
	file_text_writeln(file);
	file_text_write_string(file,string(global.gameCleared));
	file_text_writeln(file);
	file_text_write_string(file,string(global.hasStartedAfterClear));
	file_text_writeln(file);
	file_text_write_string(file,string(global.verticalSync));
	file_text_close(file);



}
