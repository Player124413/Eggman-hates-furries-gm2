function makePipe3() {
	a=0;
	xx=x;
	yy=y+32;
	while (xx>other.xx-128)
	    {
	    xx-=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//

	while (yy<other.yy+64)
	    {
	    yy+=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//
	while (xx<other.xx+32)
	    {
	    xx+=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	//
	while (yy>other.yy-64)
	    {
	    yy-=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	while (xx<other.xx+64)
	    {
	    xx+=32;
	    pipe[a]=instance_create(xx,yy,objPipe);
	    a+=1;
	    }
	pipes=a;


}
