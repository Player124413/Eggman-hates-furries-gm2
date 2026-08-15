function ultJumpBack() {
	trigger=0;
	phase=1;
	yp=0;
	/* xx+lol
	   ubgline.y+128+yp   */
	objRean.minY=320;
	xp=96;
	sk=32;
	ultMake(2);
	xp=64;
	sk=64;
	ultMake();
	xp=64;
	sk=32;
	ultMake(2);
	xp=96;
	sk=0;
	ultMake(2);

	xp=64;
	ultMake(2);
	i.RH=1;

	i=instance_create(xx-160,ubgline.y-40,fragileBlock);
	i.yskew=16;
	i.width=64;
	i.fragile=false;

	nextCamLock=xx+96;
	//Tall thingy
	yp=-112;
	xp=64;
	sk=0;
	ultMake(2);
	hema1=i;

	j.LH=1;
	xp=96;
	sk=112;
	ultMake(2);



}
