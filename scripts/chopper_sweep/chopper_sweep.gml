function chopper_sweep() {
	if (timer==0)
	    {
	    if (right)
	        goalx=refX-256-64;
	    else
	        goalx=refX+256+64;

	    goaly=refY-192+512-88;
	    }

	rotsp=1;
	rotsp2=3;
	if(right)
	    {gld=0;
	    armgoal=350}
	else
	    {gld=180;
	    armgoal=200}
    

	timer+=global.time;
    

	if (timer==60)
	    {
	    if (right)
	        goalx=refX+256-96;
	    else
	        goalx=refX-256+96;
	    }
	if (timer>60)
	    {
	    if(timer mod 8<5)
	        {
	        objJaw.open=(14+objJaw.open*4)/5;
	        }
	    else if(objJaw.open>0)
	        {
	        objJaw.open-=20*global.time;
	        if(objJaw.open<=0)
	            {
	            soundplay(global.sndClank)
	            objJaw.open=0;
	            }
	        }
	    }

	if (timer>150)
	    {
	    timer=0;
	    subphs=0;
	    atk=1;
	    }



}
