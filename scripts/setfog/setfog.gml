function setfog(argument0) {
	var foggu;
	if((cam.timer>=30 && cam.phase==4) || cam.phase==5 || cam.phase==6 || cam.phase==7)
	    foggu=argument0;
	else
	    foggu=0;
	d3d_set_fog(foggu,cam.fogcolor,0,cam.fogdist);


}
