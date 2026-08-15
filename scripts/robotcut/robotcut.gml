function robotcut() {
	var vj;
	//chaser
	advance=-sonic.speed+power(ny,2)*64;
	robot_boost_sonic();
	vj=max(57.5,sonic.speed+1.5);
	if (speed>vj)
	    speed=vj;

	faps=1;
	baps=0;

	if (timer>785/2)
	    atk=-1;




}
