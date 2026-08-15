function chopper_init() {
	if (timer==0 && subphs==0)
	    {i=instance_create(0,0,objassessment);
	    i.txt="WEAK POINT##Attack for#Massive Damage";}
	timer+=global.time;
	if (timer<30 && subphs==0)
	    objJaw.open=(objJaw.open*4)/5;
	else if(subphs==0)
	    objJaw.open=0;
	if (point_direction(x,y,objJaw.x,objJaw.y)>300 && timer>30 && subphs==0)
	    {subphs=1;
	    timer=0;
	    objJaw.pendulum=0;
	    soundplay(global.sndChopperScream);}
	if (subphs==1 && timer<30)
	    objJaw.open=(45+objJaw.open*2)/3;
	//if (subphs==1 && timer>30)
	//    objJaw.open=(objJaw.open*9)/10;
    
	gld=point_direction(x,y,sonic.x,sonic.y);
	rotsp=1;

	armgoal=gld;
	rotsp2=2;

	if (subphs==1 && timer>30)
	    {
	    timer=0;
	    subphs=0;
	    atk=1;
	    }
    


}
