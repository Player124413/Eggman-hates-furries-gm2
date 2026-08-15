function robotspam() {
	var n;
	n=60;
	advance=-128;


	if (leye==0 && reye==0)
	    {
	    advance=-128;
    
	    if(timer==90 || timer==95 || timer==100)
	        {i=instance_create((lastnnx+(nnx-lastnnx)*(sonic.y-lastnny)/(nny-lastnny)),sonic.y,objdoormaker);
	        i.angle=arctan(2560/1024);}
	    }

	robot_boost_sonic();

	faps=0;
	baps=0;

	if(leye==0 || reye==0)
	    n=30;

	if(timer>60)
	{

	a=-1;
	b=-1;

	if ((timer mod n ==10 && leye) || (timer mod n ==15 && reye))
	    {soundplay(global.sndRedLaserCharge);
	    if(timer mod n==15)
	        i=instance_create(rgx+hspeed/2/global.time,rgy+vspeed/2/global.time,objredwarning);
	    else
	        i=instance_create(lgx+hspeed/2/global.time,lgy+vspeed/2/global.time,objredwarning);
	    i.vspeed=vspeed;
	    i.hspeed=hspeed;}
    
	if (timer mod n ==25 && reye)
	    {a=rgx+hspeed/2/global.time; b=rgy+vspeed/2/global.time;}
	if (timer mod n ==20 && leye)
	    {a=lgx+hspeed/2/global.time; b=lgy+vspeed/2/global.time;}

        
	if(b>-1)
	    {
	    c=point_direction(a,b,sonic.x,sonic.y);
	    i=instance_create(a,b,objredlaser);
	    i.direction=c;
	    i.speed=32;
	    with (i) motion_add(other.image_angle+180,24);
	    i.speed=24;
	    i.image_angle=i.direction;
	    i.hspeed+=hspeed;
	    i.vspeed+=vspeed;
	    }

	}
        
	if (timer>360/2)
	atk=-1;


}
