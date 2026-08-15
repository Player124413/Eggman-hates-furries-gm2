function load() {
	var file;
	file=file_text_open_read("dat.dat");
	global.introHasBeenCleared=file_text_read_real(file);
	file_text_readln(file);
	global.gameProgress=file_text_read_real(file);
	file_text_readln(file);
	global.gameCleared=file_text_read_real(file);
	file_text_readln(file);
	global.hasStartedAfterClear=file_text_read_real(file);
	file_text_readln(file);
	global.verticalSync=file_text_read_real(file);
	file_text_close(file);



}
