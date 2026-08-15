function makeRazer(argument0, argument1, argument2, argument3) {
	var reps,xx,yy,sig,i;
	xx=argument0;
	yy=argument1;

	sig=argument2;
	xx-=32;
	yy-=32;
	reps=argument3;

	for(i=0; i<reps; i+=1)
	    {
	    a[i]=instance_create(xx+sig*48*i,yy,objFragile);
	    a[i].sig=sig;
	    a[i].reps=reps;
	    }
	//lawl
	    {   
	    for(i=0; i<reps; i+=1)
	        {
	        for(j=0; j<reps; j+=1)
	            {
	            a[i].pp[j]=a[reps-1-j];
	            }
	        }
	    }


}
