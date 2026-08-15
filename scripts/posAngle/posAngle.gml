function posAngle(argument0) {
	var a;
	a=argument0;
	while (a>180)
		a-=360;
	while (a<-180)
		a+=360;
	if(a>0)
		return 1;
	return 0;


}
