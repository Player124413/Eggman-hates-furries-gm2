function doll_hang() {
	if (abs(speed)>1) speed-=sign(speed)/10;

	timer=0;
	subphs=0;
	floater=1;
	height=128;
	size=0;

	meantimer+=1;

	if (meantimer==-1)//Only at beginning
	    {i=instance_create(0,0,objassessment);
	    i.txt="WEAK POINT##Warning:#Pure evil detected";}

	if (life<=0)
	    {
	    if ((meantimer mod 7) ==0)
	        {instance_create(x-12+random(24),y-8+random(64),objsmexp);
	        soundplay(global.sndCrash);}
	    objectfg.flashlight=meantimer/600;
        
	    if (meantimer==300)
	        {
	        with objTDRoom
	            event_user(0);
	        with objCpu
	            image_index=0;
	        with objServer
	            image_index=0;
	        soundstop(global.sndDoll);
	        soundplay(global.sndSunshine);
	        objectfg.flashlight=1;
	        with (finalgenerator)
	            {phase=16;}
	        SS_StopSound(global.handle);
	        SS_FreeSound(global.handle);
	        with objdoll
	            instance_destroy();
	        with objwire
	            instance_destroy();
	        instance_destroy();
	        }
	    }

	if (meantimer>45 && life>0)
	    {meantimer=0;
	    count+=1;
	    if (count mod 3 ==0)
	        {
	        if(count/3==1)
	        atk=3;
	        if(count/3==2)
	        atk=4;
	        if(count/3==3)
	        atk=5;
	        //if(count/3==4)
	        //atk=2;//Sucked
	        if(count/3==4)
	        {atk=6; count=0;}
	        }
	    else
	        atk=1;
	    }


}
