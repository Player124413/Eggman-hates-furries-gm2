function chopper_idle() {
	timer+=global.time;

	objJaw.open=(objJaw.open*9)/10;
	goalx=refX;
	goaly=refY;
    
	gld=point_direction(x,y,sonic.x,sonic.y);
	rotsp=1;

	armgoal=gld;
	rotsp2=0.5;

	if (timer>50)
	    {
	    objJaw.hspeed=(objJaw.hspeed*9+hspeed)/10;
	    objJaw.vspeed=(objJaw.vspeed*9+vspeed)/10;
	    }
	//
	if (timer>60)
	    {objJaw.pendulum=0;
	    objJaw.open=0;
	    timer=0;
	    subphs=0;
	    atk=2+counter;
	    counter+=1;
	    if (counter>=4)
	        counter-=4;
    
	    if (sonic.x>x)
	        right=1;
	    else
	        right=0;
	    }
    


}
