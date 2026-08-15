function ultBreak() {
	phase=5;
	yp=0;
	/* xx+lol
	   ubgline.y+128+yp   */
	xp=96;
	sk=0;
	ultMake(2);

	yp=320;
	sk=0;

	i=instance_create(xx,ubgline.y,fragileBlock);
	i.width=144;
	i.yskew=0;
	i.ssp=1;

	i=instance_create(xx+384-64,ubgline.y-32+16,fragileBlock);
	i.width=64;
	i.yskew=-16;
	i.ssp=1;
	i.RH=0;
	i=instance_create(xx+384,ubgline.y-32,fragileBlock);
	i.width=32;
	i.yskew=-8;
	i.ssp=1;
	i.LH=0;
	/*
	i=instance_create(xx+512,ubgline.y+192,fragileBlock);
	i.width=96;
	i.yskew=-32;
	i.height=48;
	i.fragile=0;
	i.ssp=1;
	*/
	xp=32;
	ultMake(1);
	xp=384-64;
	ultMake(6);
	xp=32;
	ultMake(1);//
	i=instance_create(xx-128,ubgline.y,fragileBlock);
	i.width=192;
	i.height=16;
	i.yskew=8;
	i.ssp=1;

	i=instance_create(xx,ubgline.y+96,fragileBlock);
	i.width=96;
	i.yskew=-32;
	i.ssp=1;
	j=instance_create(i.x,i.y,ult_bouncer);
	j.stick=i;
	j.depth=1;
	j.image_angle=90;

	shakeX=xx;

	i=instance_create(xx-64,ubgline.y-192,fragileBlock);
	i.width=512;
	i.height=16;
	i.yskew=128;
	i.ssp=1;

	xp=48;
	ultMake(2);

	yp-=384+32;
	sk=8;
	xp=16;
	ultMake(1);
	i.hr+=48;
	yp+=384-sk+32;
	sk=0;

	xp=256;
	ultMake(4);

	yp=96;
	xp=72;
	sk=-32;
	ultMake(1);
	xp=48;
	sk=-32;
	ultMake(1);

	xp=96;
	sk=-yp;
	ultMake(2);

	xp=96;
	sk=0;
	ultMake(2);


}
