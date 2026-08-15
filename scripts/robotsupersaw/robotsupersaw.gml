function robotsupersaw() {
	var goal;
	//useless script
	if (sparetimer<96)
	    {timer-=global.time/2;
	    advance=-160;}
	else if (timer<400)
	advance=min(timer*1.66-100,550);
	else
	advance=max(550-(timer-400)*1.66,-100);

	sparetimer+=global.time;

	if(sparetimer==150)
	    {
	    for(a=-112; a<=112 a+=32)
	        instance_create(nnx+a,y+800,objring);
	    }

	if (sparetimer>96)
	    {hspeed=(hspeed*29+(lastnnx+(nnx-lastnnx)*(y+vspeed*5-lastnny)/(nny-lastnny)-x)/5)/30;
	    vspeed=(vspeed*99+(sonic.y+advance-y)/5)/100;}
	else
	    {robot_boost_sonic();}

	if  (sparetimer==100 && assessment<5)
	    {if (assessment<2) assessment=2;
	    assessment+=1;
	    i=instance_create(0,0,objassessment);
	    if (assessment==3)
	    i.txt="WEAK POINT##Vulnerability:#Hedgehogs";
	    if (assessment==4)
	    i.txt="WEAK POINT##Attack for#Massive Damage";
	    if (assessment==5)
	    i.txt="WEAK POINT##Attack for#Massive Damage";}


	if (instance_exists(objassessment) && (assessment>=3&&ms))
	    {objassessment.x=msx0+hspeed*global.time*1;
	    objassessment.y=msy0+vspeed*global.time*1;}
	if (instance_exists(objassessment) && (assessment>=3&&mh))
	    {objassessment.x=mhx0+hspeed*global.time*1;
	    objassessment.y=mhy0+vspeed*global.time*1;}
	if (instance_exists(objassessment) && (assessment>=3&&ph))
	    {objassessment.x=phx0+hspeed*global.time*1;
	    objassessment.y=phy0+vspeed*global.time*1;
	    objassessment.rr=1;}

        
	rotsp=1;

	if (timer>300 && timer<700)
	    {boost=-1;
	    goal=180+point_direction(x,y,lastnnx+(nnx-lastnnx)*(y+vspeed*5-lastnny)/(nny-lastnny),y+vspeed*5);}
	else
	    {goal=point_direction(x,y,lastnnx+(nnx-lastnnx)*(y+vspeed*5-lastnny)/(nny-lastnny),y+vspeed*5);
	    boost=0;}


	if (timer>800)
	    timer=0;
    
	if (timer mod 400 < 175)
	    faps=3;
	else
	    faps=2;

	    if (timer mod 400 < 275)
	    baps=3;
	else
	    baps=2;
    
	if ((timer>250 && timer<400)||(timer>650))
	    {faps=0;
	    baps=0;
	    rotsp=3;}
    

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
