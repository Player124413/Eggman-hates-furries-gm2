function doll_spin() {
	height=56;

	timer+=1;
	if (subphs==0)
	    {
	    if (y<y0-height-32) vspeed+=0.075; 
	    else if (abs(speed)>0.5) speed-=sign(speed)/5;
	    if (timer>60) {subphs=1; timer=0; soundplay(global.sndDarkness);}
	    }
    
	if (subphs==1)
	    {
	    floater=0.5;
	    if (right==1)
	            {
	            hspeed=-1;
	            if(x<x0+33)
	                {subphs=2; x=x0+32; timer=0; right=0;}
	            }
	        if (right==0)
	            {
	            hspeed=1;
	            if(x>x1-33)
	                {subphs=2; x=x1-32; timer=0; right=1;}
	            }
	    }
	if(subphs==2)
	    {//RESET
	    if (timer>=60)
	        atk=0;
	    hspeed=0;
	    height=128;
	    if (y>y0-height+56) vspeed-=0.2; 
	    else if (abs(speed)>1) speed-=sign(speed)/5;
	    }


}
