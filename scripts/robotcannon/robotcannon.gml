function robotcannon() {
	var goal,a;
	//default
	goal=image_angle;

	sparetimer+=global.time;

	if (timer>60 && timer<300)
	    {advance=128; goal=270;}
	else
	    advance=-64;

	if (sparetimer<150)
	    {advance=-64;
	    timer+=global.time;}

	if(sparetimer==150)
	    {
	    for(a=-112; a<=112 a+=32)
	        instance_create(nnx+a,y+800,objring);
	    }
    
	if (sparetimer==300 && assessment<2)
	    {assessment+=1;
	    i=instance_create(0,0,objassessment);
	    if (assessment==1)
	        i.txt="WEAK POINT##Vulnerability:#Spin Dash Attack";
	    else
	        i.txt="WEAK POINT##Attack for#Massive Damage";}

	if (instance_exists(objassessment) && leye==1 && (assessment==1 || reye==0))
	    {objassessment.x=lgx+hspeed*global.time*2;
	    objassessment.y=lgy+vspeed*global.time*2;
	    objassessment.rr=1;}
    
	if (instance_exists(objassessment) && reye==1 && (assessment==2 || leye==0))
	    {objassessment.x=rgx+hspeed*global.time*2;
	    objassessment.y=rgy+vspeed*global.time*2;}

	a=vspeed;
	hspeed=(hspeed*99+(lastnnx+(nnx-lastnnx)*(y+vspeed*5-lastnny)/(nny-lastnny)-x)/5)/100;
	vspeed=(vspeed*99+(sonic.y+advance-y)/5)/100;

	if (vspeed>a+0.1)
	    boost=1;
	else if (vspeed<a-0.1)
	    boost=-1;
	else
	    boost=0;





	if (timer==30 && platform<4)
	    soundplay(global.sndExtend);

	faps=4;
	baps=4;
	rotsp=2;
    
	if (timer>30 && platform<4)
	    {platform+=global.time*4/90;}


	if (timer==300)
	    soundplay(global.sndCharge);
	if (timer>=300&&chargeur<90)
	    {
	    goal=point_direction(x,y,sonic.x,sonic.y);
    
	    switch (chargeur)
	        {case 0: plat_tip=10; break;
	        case 9: plat_tip=10; break;
	        case 17: plat_tip=10; break;
	        case 25: plat_tip=10; break;
	        case 33: plat_tip=10; break;
	        case 40: plat_tip=10; break;
	        case 47: plat_tip=10; break;
	        case 53: plat_tip=10; break;
	        case 59: plat_tip=10; break;
	        case 63: plat_tip=10; break;
	        case 67: plat_tip=10; break;}
	    chargeur+=global.time;
	    chargewave-=(8+chargeur)*plat_tip/16;
	    if (plat_tip==10)
	        chargewave=90;
    
	    if (plat_tip>0)
	        plat_tip-=global.time;
	    }
    
	if (chargeur>=90)
	    {soundplay(global.sndBigGun);
	    chargeur=0;
	    plat_tip=0;
	    timer=0;}
    
	if (timer<45 && platform>=4)//FIRIN LAZOR
	    {biglazor=1;
	    motion_add(image_angle+180,0.15/(1+timer/5));
	    boost=1;
	    }
	else
	    biglazor=0;
    

	image_angle=image_angle mod 360;

	while(goal>image_angle+180)
	    goal-=360;
	while(goal<image_angle-180)
	    goal+=360;
    

	if (image_angle<goal)
	    image_angle+=global.time/2;
    
	if (image_angle>goal)
	    image_angle-=global.time/2;


}
