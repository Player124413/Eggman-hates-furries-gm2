function robotspam2() {
	advance=-64;

	a=vspeed;
	    advance+=32;
	    hspeed=(hspeed*29+(lastnnx+(nnx-lastnnx)*(y+vspeed*5-lastnny)/(nny-lastnny)-x)/5)/30;
    
	    vspeed=(vspeed*29+(sonic.y+advance-y)/5)/30;
    
	    if (vspeed>a+0.1)
	        boost=1;
	    else if (vspeed<a-0.1)
	        boost=-1;
	    else
	        boost=0;
	//robot_boost_sonic();

	faps=0;
	baps=0;

	a=-1;
	b=-1;

	if (timer mod 120<105 && timer>50)
	{
	if (timer mod 15==0 && (timer mod 120<45 || timer mod 120>=60))
	    {soundplay(global.sndRedLaserCharge);
	    i=instance_create(x+lengthdir_x(base,image_angle)+hspeed*global.time,y+lengthdir_y(base,image_angle)+vspeed*global.time,objredwarning);
	    if ((timer mod 120)<60)
	        i.sprite_index=sprgreenwarning;
	    i.vspeed+=vspeed;
	    i.hspeed+=hspeed;
	    }

	if (timer mod 15==10 && (timer mod 120<45 || timer mod 120>=60))
	    {
	    soundstop(global.sndRedBlob);
	    i=instance_create(x+lengthdir_x(base,image_angle)+hspeed*global.time,y+lengthdir_y(base,image_angle)+vspeed*global.time,objredblob);
	    if ((timer mod 120)<60)
	        {i.direction=image_angle-30+(timer mod 60)/2.5;
	        i.sprite_index=sprgreenblob;}
	    else
	        i.direction=image_angle+30-(timer mod 60)/2.5;
	    i.speed=20;
	    i.vspeed+=vspeed;
	    i.hspeed+=hspeed;
	    }
	}
        

        
	if (timer>284/2+30)
	atk=-1;


}
