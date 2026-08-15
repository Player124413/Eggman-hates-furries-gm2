function robotrecover() {
	var goal,a;
	//default
	goal=270;
	if(vspeed>0)
	    goal=point_direction(x,y,lastnnx+(nnx-lastnnx)*(y+vspeed*5-lastnny)/(nny-lastnny),y+vspeed*5);
    
	advance=-96;
	if (y<sonic.y-400)
	    robot_boost_sonic();
	else
	    {a=vspeed;
	    advance+=48;
	    hspeed=(hspeed*49+(lastnnx+(nnx-lastnnx)*(y+vspeed*5-lastnny)/(nny-lastnny)-x)/5)/50;
    
	    vspeed=(vspeed*49+(sonic.y+advance-y)/5)/50;
    
	    if (vspeed>a+0.1)
	        boost=1;
	    else if (vspeed<a-0.1)
	        boost=-1;
	    else
	        boost=0;}

	faps=0;
	baps=0;

	image_angle+=30*global.time/(1+timer);//depends on damage rotation;
    

	image_angle=image_angle mod 360;

	while(goal>image_angle+180)
	    goal-=360;
	while(goal<image_angle-180)
	    goal+=360;
    

	if (image_angle<goal)
	    image_angle+=2*global.time;
    
	if (image_angle>goal)
	    image_angle-=2*global.time;


    
	if (timer>180)
	atk=-1;




}
