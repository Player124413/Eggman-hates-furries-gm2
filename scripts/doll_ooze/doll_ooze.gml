function doll_ooze() {
	var xa;
	height=64;

	timer+=1;
	if (subphs==0)
	    {
	    if (y<y0-height-32) vspeed+=0.075; 
	    else if (abs(speed)>0.5) speed-=sign(speed)/5;
	    if (timer>60) {subphs=1; timer=0; shield=1;
	        soundloop(global.sndOoze4); soundloop(global.sndShield); soundplay(global.sndDarkness);}
	    if (objdoll.armrot<90)
	        objdoll.armrot+=2;

	    }
    
	if (subphs==1)
	    {
	    if(right) xa=x1-32; else  xa=x0+32;

	    if (size<x1-x0-32)
	        {size+=2;
	        if (random(120)<1)
	            {with objTDRoom
	            event_user(0);}
	        timer=0;}
    
	    if (random(45)<global.time)
	        soundplay(global.sndOoze1);
	    if (random(45)<global.time)
	        soundplay(global.sndOoze2);
	    if (random(45)<global.time)
	        soundplay(global.sndOoze3);
    
	    for(a=0; a<size; a+=8;)
	        {
	        if(random(30)<global.time)
	            {i=instance_create(xa+objdoll.yscale*a-8+random(16),y0,objooze);
	            i.image_yscale=sin(pi*a/size);}
	        if(random(200)<global.time)
	            {i=instance_create(xa-objdoll.yscale*(-a-32+random(16)),y0,objblackboil);
	            i.image_yscale=1.5/(1+a/size);
	            i.image_xscale=i.image_yscale;
	            }
	            if(random(200)<global.time)
	            {i=instance_create(xa-objdoll.yscale*(-a+random(16)),y0,objooze3);}
	        }
	    if (timer==80)
	        shield=0;
	    if (timer>80)
	        {
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
	    if(sonic.gnd>0)
	        ground.frict=1+size/32;
	    else
	        ground.frict=1;
	    ground.hspeed=-objdoll.yscale*size/6;
	    sidememorizer=objdoll.yscale
	    }


	if(subphs==2)
	    {//RESET
	    if(sonic.gnd>0)
	        ground.frict=(1-timer/60)*(1+size/32);
	    else
	        ground.frict=1;
	    ground.hspeed=(1-timer/60)*(-sidememorizer*size/6);
	    if(timer==0)
	        {soundstop(global.sndShield);
	        soundstop(global.sndOoze4);}
	    if (objdoll.armrot>0)
	        objdoll.armrot-=5;
	    shield=0;
	    if (timer>=60)
	        {atk=0;
	        ground.hspeed=0;
	        ground.frict=1;}
	    hspeed=0;
	    height=128;
	    if (y>y0-height+56) vspeed-=0.2; 
	    else if (abs(speed)>1) speed-=sign(speed)/5;
	    }
    



}
