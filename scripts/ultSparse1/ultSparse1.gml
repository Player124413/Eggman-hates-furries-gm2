function ultSparse1() {
	phase=3;
	yp=0;
	/* xx+lol
	   ubgline.y+128+yp   */
	xp=32;
	sk=0;
	ultMake(1);
	yp=320;
	ultMake(1);
	yp=32;
	xp=48;
	ultMake(1);
	sk=-32;
	ultMake(1);
	sk=0;
	ultMake(1);
	xp=32;
	yp=320;
	ultMake(1);
	ultMake(1);
	ultMake(1);

	yp=128;
	sk=-16
	ultMake(1);
	yp=32;
	ultMake(1);
	sk=-16;
	ultMake(1);//UPHILL
	sk=0;
	yp=320;
	ultMake(1);
	yp=-80;
	xp=48;
	ultMake(1);//TALL ONE
	yp=160;
	xp=48;
	sk=16;
	ultMake(1);//savior
	sk=0;
	xp=32;
	ultMake(1);//LOW FOX
	yp=320;
	ultMake(1);
	yp=-204-32;
	ultMake(1);//Upper blockade
	i.hr=96;
	hema1=i;

	yp=96;
	ultMake(1);//Climb
	sk=-32;
	ultMake(1);//Climb
	sk=0;
	yp-=64;
	ultMake(1);//Climb
	yp=320;
	xp=48
	ultMake(1);


}
