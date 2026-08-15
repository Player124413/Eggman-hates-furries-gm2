function robot_boost_sonic() {
	vspeed=(vspeed*(25/global.time)+sonic.vspeed+(sonic.y-240+advance-y)/20)/(1+25/global.time);
	if((sonic.y-240+advance-y)/20>7.5)
	    boost=1;
	else if ((sonic.y-240+advance-y)/20>0)
	    boost=0;
	else
	    boost=-1;


}
