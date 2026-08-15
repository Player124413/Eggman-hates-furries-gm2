function doll_eyebeams() {
	var h,v,h2,v2,dp,d;
	h=cos(degtorad(objdoll.image_angle));
	v=-sin(degtorad(objdoll.image_angle));
	h2=-objdoll.image_yscale*cos(degtorad(objdoll.image_angle+90));
	v2=objdoll.image_yscale*sin(degtorad(objdoll.image_angle+90));

	height=56;

	timer+=1;
	if (subphs==0)
	    {
	    if (y<y0-height-32) vspeed+=0.075; 
	    else if (abs(speed)>0.5) speed-=sign(speed)/5;
	    if (timer>60) {subphs=1; timer=0;}
	    }
    
	if (subphs==1)
	    {
	    if (timer>=60 && timer<=90 && timer mod 10 == 0)
	        soundplay(global.sndDollLaser1)
	    if (timer==90)
	        soundloop(global.sndDollLaser2);
	    if (timer>93)
	        {
	        dp=point_distance(objdoll.x+4*h,objdoll.y+4*v,sonic.x,sonic.y);
	        d=point_distance(objdoll.x+4*h-dp*h2,objdoll.y+4*v-dp*v2,sonic.x,sonic.y);
	        if (d<12)
	            {
	            sonic.damaged=1;
	            sonic.damagex=objdoll.x+4*h-dp*h2;
	            sonic.damagey=objdoll.y+4*v-dp*v2;
	            }
        
	        if(x>(x0+x1)/2)
	            hspeed-=0.15;
	        else
	            hspeed+=0.15;
	        }
	    floater=0.5;
	    if (right==1 && x<x0+33)
	        {subphs=2; x=x0+32; timer=0; right=0;}
	    if (right==0 && x>x1-33)
	        {subphs=2; x=x1-32; timer=0; right=1;}
	    }
	if(subphs==2)
	    {//RESET
	    if (timer==0)
	        {soundstop(global.sndDollLaser2);
	        soundplay(global.sndDollLaser1);}
	    if (timer>=60)
	        atk=0;
	    hspeed=0;
	    height=128;
	    if (y>y0-height+56) vspeed-=0.2; 
	    else if (abs(speed)>1) speed-=sign(speed)/5;
	    }



}
