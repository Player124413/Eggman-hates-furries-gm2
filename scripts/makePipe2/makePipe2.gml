function makePipe2() {
	a=0;
	xx=x;
	yy=y+32;
	while (xx>other.xx-256)
	    {
	    xx-=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//
	while (yy<objLava.y-192+32)
	    {
	    yy+=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//
	while (xx>other.xx-320-192)
	    {
	    xx-=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
    
	while (yy<objLava.y-96)
	    {
	    yy+=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
    
	while (xx<other.xx-320-160)
	    {
	    xx+=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//
	pipes=a;


}
