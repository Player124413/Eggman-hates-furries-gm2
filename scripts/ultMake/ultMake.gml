function ultMake(argument0) {
	// ultMake is also called without an argument for a single segment.
	if (argument_count < 1 || argument0==0)
	    argument0=1;

	xp=xp/argument0;
	sk=sk/argument0;

	for(k=0; k<argument0; k+=1)
	    {
	    i=instance_create(xx+xp,ubgline.y+128,rotBlock);
	    i.wr=xp;
	    i.yG=ubgline.y+128+yp;
	    i.yskewG=sk;
	    if (k==0)
	        j=i;//use j to access first piece at later time
	    xx+=2*xp;
	    yp+=sk;
	    }



}
