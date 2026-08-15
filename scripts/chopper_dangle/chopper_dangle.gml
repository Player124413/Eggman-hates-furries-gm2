function chopper_dangle() {
	if (timer==0)
	    {
	    objJaw.pendulum=1;
	    }
    
	if (timer mod 60==30)
	    {
	    goalx=max(refX-256,min(refX+256,sonic.x));
	    goaly=refY-192+512-180;
	    }

	gld=point_direction(x,y,sonic.x,sonic.y);
	armgoal=-1;    

	timer+=global.time;

	if (timer>280)
	    {
	    objJaw.hspeed=(objJaw.hspeed*9+hspeed)/10;
	    objJaw.vspeed=(objJaw.vspeed*9+vspeed)/10;
	    }
	if (timer>300)
	    {
	    timer=0;
	    subphs=0;
	    atk=1;
	    objJaw.pendulum=0;
	    }



}
