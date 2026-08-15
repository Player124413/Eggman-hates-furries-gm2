function chopper_flash() {
	var rr;
	rr=90;
	if (timer==0)
	    {
	    i=instance_create(x,y,objFlashG2);
	    i.direction=launchdir;
	    i.speed=8;
	    }
	timer+=global.time;
    
	gld=-1;
	if (timer<rr)
	    {armgoal=point_direction(x,y,sonic.x,sonic.y);//armgoal is +=180 you mother fucker
	    rotsp2=3;}
	else
	    armgoal-=180;

	if (timer==rr)
	    {
	    goalx=sonic.x-lengthdir_x(180,armgoal);
	    goaly=sonic.y-lengthdir_y(180,armgoal);
	    }

	if (timer>rr && timer<rr+60)
	    {objJaw.open=(45+objJaw.open*9)/10;}
    
	if (timer>rr+60 && objJaw.open>0)
	    {objJaw.open-=20*global.time;
	    if(objJaw.open<=0)
	        {objJaw.open=0;
	        soundplay(global.sndClank);}
	    }
    
    
	if (timer>rr+80)
	    {
	    timer=0;
	    subphs=0;
	    atk=1;
	    }
    


}
