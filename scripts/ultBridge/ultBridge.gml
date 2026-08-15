function ultBridge() {
	phase=2;
	yp=0;
	/* xx+lol
	   ubgline.y+128+yp   */
	xp=96;
	sk=0;
	ultMake(2);

	i=instance_create(xx,ubgline.y,fragileBlock);
	i.yskew=0;
	i.width=384;
	i.height=16;
	i.ssp=1;
	xx+=384;

	xp=96;
	sk=0;
	ultMake(2);


}
