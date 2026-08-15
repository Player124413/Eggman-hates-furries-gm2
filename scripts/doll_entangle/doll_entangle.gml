function doll_entangle() {
	if (abs(speed)>1) speed-=sign(speed)/10;

	height=128;

	timer+=1;

	if (timer==60 && subphs==0)
	    {instance_create(x,y0,objentangle1); soundplay(global.sndDarkness);}

	if (timer==60 && subphs==1)
	    {
	    atk=1;
	    count-=1;
	    }


}
