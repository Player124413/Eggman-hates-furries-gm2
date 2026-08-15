function ultThrow() {
	phase=8;
	trigger=0;

	xp=128;
	yp=0;
	sk=0;
	ultMake(4);

	i=instance_create(xx+32,480,rotBlock);
	i.wr=33;
	i.hr=288;
	hema1=i;
	i.RH=1; i.LH=1;

	i=instance_create(xx,ubgline.y+yp,fragileBlock);
	i.width=112;
	i.ssp=1;

	xx+=960;
	xp=128;
	yp=0;
	sk=0;
	ultMake(4);

	xp=16;
	yp-=64;
	sk=0;
	ultMake(1);
	i.y+=yp;
	xp=16;
	yp-=64;
	sk=0;
	i.LH=1;
	ultMake(1);
	i.y+=yp;
	i.LH=1;

	xp=16;
	sk=96;
	ultMake(1);
	sk=32;
	ultMake(1);




}
