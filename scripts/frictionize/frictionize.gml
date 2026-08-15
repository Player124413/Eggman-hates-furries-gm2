function frictionize() {
	speed-=global.air*global.time*speed*speed;
	if (speed<0)  speed=0;


}
