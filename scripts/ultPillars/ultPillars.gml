function ultPillars() {
	trigger=0;
	phase=6;

	yp=0;
	xp=192;
	sk=128;
	ultMake(6);

	xp=128;
	sk=0;
	ultMake(4);

	i=instance_create(xx+16,720,rotBlock);
	i.wr=32;
	i.hr=224;
	i.depth=1;
	i.RH=1;i.LH=1;
	//i.yG=ubgline.y-64;//Moved to step phase thingy
	hema1=i;

	xp=128;
	sk=0;
	ultMake(4);

	i=instance_create(xx-16,640,rotBlock);
	i.wr=16;
	i.hr=16;
	i.depth=1;
	i.RH=1;i.LH=1;
	hema3=i;
	i=instance_create(xx-16,640,rotBlock);
	i.wr=16;
	i.depth=1;
	i.RH=1;i.LH=1;
	hema2=i;

	camLock=xx+32;

	xp=256;
	sk=-128;
	ultMake(4);
	xp=256;
	yp=0;
	sk=0;
	ultMake(2);


}
