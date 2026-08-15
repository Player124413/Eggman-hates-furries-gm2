function superHit() {
	with objSuperSonic
	    {
	    if(hit<=0 && setUp<1)
	        {
	        soundplay(global.sndCrush);
	        hit=27;
	        shieldDown();
	        objSuperFG.light=0.5;
	        objSuperFG.lightDim=20;
	        repeat(12)
	            {
	            i=instance_create(x,y,objSparkly);
	            i.direction=random(360);
	            i.speed=8;
	            i.image_speed=0.3;
	            }
	        }
	    if (setUp>=1)
	        x-=global.time;
	    }


}
