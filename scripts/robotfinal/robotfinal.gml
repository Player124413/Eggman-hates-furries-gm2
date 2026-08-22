function robotfinal() {
	var goal;
	var player=instance_find(sonic,0);
	// The player can be removed during a death/room transition while the
	// robot's final attack still receives one more Step event.
	if (!instance_exists(player))
	    exit;
	//useless script

	if(finalcount>=30)
	    {
	    robotdie();
	    }
	else
	{
	if (sparetimer<96)
	    {timer-=global.time/2;
	    advance=-160;}
	else if (timer<400)
	advance=min(timer*1.5-100,500);
	else
	advance=max(500-(timer-400)*1.5,-100);

	sparetimer+=global.time;
	if (sparetimer>96)
	    {hspeed=(hspeed*29+(lastnnx+(nnx-lastnnx)*(y+vspeed*5-lastnny)/(nny-lastnny)-x)/5)/30;
	    vspeed=(vspeed*99+(player.y+advance-y)/5)/100;}
	else
	    {robot_boost_sonic();}

	if (sparetimer==120 && assessment<6)
	    {assessment=6;
	    i=instance_create(0,0,objassessment);
	    i.txt="WEAK POINT##Vulnerability:#Saw Blades";}

	if (instance_exists(objassessment))
	    {objassessment.x=x+lengthdir_x(64,image_angle)+hspeed*global.time*2;
	    objassessment.y=y+lengthdir_y(64,image_angle)+vspeed*global.time*2;}
    
	rotsp=3;

	if (timer>300 && timer<700)
	    {boost=-1;
	    goal=180+point_direction(x,y,lastnnx+(nnx-lastnnx)*(y+vspeed*5-lastnny)/(nny-lastnny),y+vspeed*5);}
	else
	    {goal=point_direction(x,y,lastnnx+(nnx-lastnnx)*(y+vspeed*5-lastnny)/(nny-lastnny),y+vspeed*5);
	    boost=0;}


	if (timer>800)
	    {timer=0;
	    chargeur=0;}
    
	faps=2;
    
	if ((timer>250 && timer<400)||(timer>650))
	    {faps=0;
	    baps=0;}
	else
	    chargeur+=2*global.time;
    
	if(chargeur==60||chargeur==70||chargeur==80)
	    soundplay(global.sndTargetConfirm);

    
	if (player.gnd>0 && point_distance(player.x,player.y,x+lengthdir_x(base,image_angle)+hspeed*global.time,y+lengthdir_y(base,image_angle)+vspeed*global.time)<56 && faps==2)
	    {
	    finalcount+=1;
	    }
	else
	    finalcount=0;
    

	image_angle=image_angle mod 360;

	while(goal>image_angle+180)
	    goal-=360;
	while(goal<image_angle-180)
	    goal+=360;
    

	if (image_angle<goal)
	    image_angle+=global.time*3;
    
	if (image_angle>goal)
	    image_angle-=global.time*3;
	}




}
