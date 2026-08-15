function ultCrunch() {
	phase=14;
	trigger=0;
	yp=0;
	sk=0;

	xp=32;
	sk=0;
	ultMake(1);

	xp=32;
	ultMake(1);

	xp=32;
	yp+=48; ultMake(1);
	i.y+=yp;
	i.hr+=48;
	hema1=i;

	i=instance_create(hema1.x+16,640,rotBlock);
	i.wr=16;
	i.hr=16;
	i.depth=1;
	i.RH=1;i.LH=1;
	hema4=i;

	xp=96;
	yp+=96;ultMake(1);yp-=96;
	hema2=i;
	xp=32;
	ultMake(1);
	i.y+=yp; yp-=48;
	i.hr+=48;
	camLock=xx+32;
	hema3=i;

	i=instance_create(hema3.x-16,640,rotBlock);
	i.wr=16;
	i.hr=16;
	i.depth=1;
	i.RH=1;i.LH=1;
	hema5=i;

	yp+=16;
	sk=-16;
	xp=32;
	ultMake(1);
	sk=0;
	xp=128;
	ultMake(1);
	xp=16;
	ultMake(1);
	ultMake(1);
	ultMake(1);
	ultMake(1);
	ultMake(1);
	ultMake(1);
	ultMake(1);
	ultMake(1);
	ultMake(1);
	ultMake(1);
	ultMake(1);
	ultMake(1);


}
