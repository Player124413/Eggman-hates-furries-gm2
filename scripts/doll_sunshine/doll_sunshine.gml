function doll_sunshine() {
	height=56;

	timer+=1;
	if (subphs==0)
	    {
	    if (y<y0-height-32) vspeed+=0.075; 
	    else if (abs(speed)>0.5) speed-=sign(speed)/5;
	    if (timer>60)
	        {size+=192/60;}
	    if (timer>120) {subphs=1; timer=0; shield=1; soundloop(global.sndShield); soundplay(global.sndDarkness);}
    
	    if (objdoll.armrot<90)
	        objdoll.armrot+=1;
	    }
    
	if (subphs==1)
	    {
	    if (random(240)<1)
	        {with objTDRoom
	        event_user(0);}
	    floater=0.5;
	    if (right==1)
	            {
	            shield=0;
	            hspeed=-0.5;
	            if(x<x0+33)
	                {subphs=2; x=x0+32; timer=0; right=0; shield=1;}
	            }
	        if (right==0)
	            {
	            shield=0;
	            hspeed=0.5;
	            if(x>x1-33)
	                {subphs=2; x=x1-32; timer=0; right=1; shield=1;}
	            }
	    }
	if(subphs==2)
	    {
	    if (timer==0)
	        soundstop(global.sndShield);
	    if (objdoll.armrot>0)
	        objdoll.armrot-=5;
    
	    //RESET
	    if (size>0)
	        size-=192/60;
	    if (timer>=60)
	        {atk=0;
	        shield=0;}
	    hspeed=0;
	    height=128;
	    if (y>y0-height+56) vspeed-=0.2; 
	    else if (abs(speed)>1) speed-=sign(speed)/5;
	    }

	if (size>0)
	    {d=point_distance(x,y,sonic.x,sonic.y);
	    soundvolume(CanYouFeelTheSunshine,(1-power(max(0,min(1,d/(size*2))),3)));
	    SS_SetSoundVol(global.handle,10000*(1-power(1-max(0,min(1,d/(size*2))),3)));
	    global.time=0.5*power(0.5+max(0,min(0.5,d/size)),2);}
	else
	    {soundvolume(CanYouFeelTheSunshine,0);
	    SS_SetSoundVol(global.handle,10000);
	    global.time=0.5;}


}
