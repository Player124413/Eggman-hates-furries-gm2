function chopper_crashwalls() {
	var ok,dx,dy,k;
	ok=0;
	dx=0;
	dy=0;
	if (x<refX-128-256+48)
	    {x=refX-128-256+48;
	    hspeed=-hspeed;
	    ok=1;
	    dx=-48;}
	if (x>refX+128+256-48)
	    {x=refX+128+256-48;
	    hspeed=-hspeed;
	    ok=1;
	    dx=48;}
	if (y>refY-192+512-48)
	    {y=refY-192+512-48
	    if (abs(vspeed)>1 || life>0)
	        {soundplay(global.sndClank);
	        vspeed=-vspeed/2;}
	    else
	        {if (life<=0 && abs(vspeed)>0.2)
	            {soundloop(global.sndMetalScrape);
	            i=instance_create(x,y,objbigexp);
	            i.depth=-11;
	            i.hspeed=hspeed/2;
	            i.vspeed=vspeed/2;
	            soundplay(global.sndGunstar1);
	            soundplay(global.sndGunstar2);
	            sprite_index=sprcoredest;
	            invulnerable=0;
	            }
	        vspeed=0;}
	    dy=48;
	    ok=1;}
	if(ok)
	    {
    
	    if (life>0)
	        {k=20;
	        soundplay(global.sndClank);}
	    else if (speed>0.5)
	        {k=2;
	        speed-=0.7*global.time;}
	    else
	        {k=0;
	        if (life <=0 && hspeed!=0)
	            soundstop(global.sndMetalScrape);
	        speed=0;}
    
	    repeat(k)
	            {
	            i=instance_create(x+dx,y+dy,objspark);
	            i.speed=12;
	            i.direction=random(360);
	            i.hspeed+=hspeed*2;
	            i.vspeed+=vspeed*2;
	            i.depth=-4;
	            }
	    }


}
