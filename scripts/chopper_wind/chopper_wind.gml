function chopper_wind() {
	if (timer==0 && subphs==0)
	    goalx=max(refX-256,min(refX+256,sonic.x));
	if (timer==30 && subphs==0)
	    {
	    goaly=refY-192+512-180;
	    }

	rotsp=1;
	rotsp2=2;
	gld=point_direction(x,y,sonic.x,sonic.y-96);
	if (subphs==1)
	    {
	    if (timer>90 && timer mod 40==0)
	        {
	        i=instance_create(x,y,objFlashG2)
	        i.direction=launchdir;
	        i.speed=12+(point_distance(x,y,sonic.x,sonic.y)-320)/30;
	        i.explosive=1;
	        }
	    if (sonic.x>objJaw.x)
	        armgoal=220;
	    else
	        armgoal=320;
	    rotsp2=0.5;
	    }
	else
	    armgoal=270;
    

	timer+=global.time;
    
	if (timer<90 && subphs==0)
	    {
	    objJaw.open=(64+objJaw.open*4)/5;
	    }
    
	if (timer>90 && objJaw.open>0 && subphs==0)
	    {
	    objJaw.open-=20*global.time;
	    if(objJaw.open<=0)
	        {
	        soundplay(global.sndClank);
	        objJaw.open=0;
	        i=instance_create(x,refY-192+512,objmedexp);
	        i.depth=-12;
	        soundplay(global.sndExplosion);
	        instance_create(x,refY-192+510,objCleanCrack);
	        subphs=1;
	        timer=0;
	        }
	    }

	if (timer>300)
	    {
	    timer=0;
	    subphs=2;
	    goalx=x;
	    goaly=refY;
	    soundplay(global.sndDarkDestroy);
	    objJaw.open=10;
	    }
	if(subphs==2)
	    {
	    objJaw.open=(45+objJaw.open*9)/10;
	    }

	if (timer>60 && subphs==2)
	    {
	    with (supergenerator.thefloor.ik)
	        {hspeed=0;
	        frict=1;}
	    timer=0;
	    subphs=0;
	    atk=1;
	    }



}
