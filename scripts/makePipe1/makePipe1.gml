function makePipe1() {
	a=0;
	xx=x;
	yy=y+32;
	while (xx>other.x-128)
	    {
	    xx-=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//
	while (yy<objLava.y)
	    {
	    yy+=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//
	while (xx<other.x+1280)
	    {
	    xx+=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//

	while (yy>objLava.y-128)
	    {
	    yy-=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//
	while (xx>other.x+1280-128)
	    {
	    xx-=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//
	while (yy>objLava.y-320)
	    {
	    yy-=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//
	while (xx<other.x+1280+128)
	    {
	    xx+=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//
	while (yy<objLava.y-192)
	    {
	    yy+=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	for (aa=32; aa<192; aa+=64)
	    {i=instance_create(xx+48,yy+aa,objLavaGirder);
	    i.image_angle=270;}


	while (xx<other.x+1280+192)
	    {
	    xx+=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	while (yy>objLava.y-288)
	    {
	    yy-=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }

	//
	pipes=a;


}
