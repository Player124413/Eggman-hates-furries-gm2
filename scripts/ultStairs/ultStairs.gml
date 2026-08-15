function ultStairs() {
	phase=7;

	xp=32;
	yp=0;
	sk=-8;
	ultMake(1);

	yp=320;
	xp=192;
	sk=0;
	ultMake(6);
	xp=64;
	yp=224;
	repeat(4)
	    {
	    ultMake(2);
	    yp-=72;
	    xp=64;
	    }

	yp=384;
	xp=128;
	ultMake(2);
	yp-=352;
	xp=16;
	ultMake(1);
	i=instance_create(xx,ubgline.y+yp,fragileBlock);
	i.width=64;
	i.height=48;
	i.ssp=2;

	yp=384;
	xp=128;
	ultMake(2);
	yp-=352;
	xp=32;
	ultMake(1);
	i=instance_create(xx,ubgline.y+yp,fragileBlock);
	i.width=48;
	i.height=32;
	i.ssp=2;


	xp=64;
	yp=320;
	ultMake(1);
	xp=48;
	yp=240;
	sk=-200;
	ultMake(1);
	sk=-40;
	ultMake(1);
	sk=0;

	xp=32;
	yp=0;
	ultMake(1);


}
