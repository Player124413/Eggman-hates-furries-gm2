function chopper_die() {
	if (subphs!=1 || (speed<1 && objJaw.speed<1))
	    timer+=global.time;

	if (subphs==0)
	    {
	    if (timer<30)
	        {soundvelocity(global.sndChopper,0,-timer*10);
	        soundvolume(global.sndChopper,1-power(timer/30,2));}
	    if (timer==30)
	        {soundstop(global.sndChopper);
	        soundvolume(global.sndChopper,1);
	        soundvelocity(global.sndChopper,0,0);}
	    objJaw.open=8;
    
	    if (speed<1 && objJaw.speed<1)
	        {subphs=1
	        timer=0;}
	    } 

	if (subphs==1)
	    {
	    if (timer>10)
	        {global.time=0.5;
	        subphs=2;
	        speed=0;
	        objJaw.pendulum=0;
	        supergenerator.phase=8;
	        dead=1;
	        gld=45;
	        timer=0;}
	    }


}
