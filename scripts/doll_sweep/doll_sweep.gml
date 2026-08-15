function doll_sweep() {
	if(subphs==0)
	        {//DO IT
	        if (timer==0)
	            {vspeed=0;
	            y=y0-height;}
	        if (timer<15)
	            vspeed+=0.3;
	        else
	            vspeed-=0.04;
        
	        if(x>(x0+x1)/2)
	            hspeed-=0.15;
	        else
	            hspeed+=0.15;
            
	        if (right==1 && x<x0+33)
	            {subphs=1; x=x0+32; timer=0; right=0;}
	        if (right==0 && x>x1-33)
	            {subphs=1; x=x1-32; timer=0; right=1;}
    
	        }
	    if(subphs==1)
	        {//RESET
	        if (timer<15)
	            vspeed+=0.3;
	        else
	            atk=0;
	        hspeed=0;
	        }
    
	    timer+=1;


}
