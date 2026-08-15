function ultBeginning() {
	phase=0;

	xp=512;
	yp=0;
	sk=0;
	ultMake(4);
	j.LH=1;

	xp=16;
	sk=-16;
	ultMake(1);
	sk=0;
	ultMake(1);
	xp=64;
	ultMake(2);
	xp=32
	sk=-32;
	ultMake(1);
	xp=96;
	sk=48;
	ultMake(3);
	sk=0;
	sp=64;
	ultMake(1);

	for(tinyX=0; tinyX<640; tinyX+=32)
	    {
	    instance_create(tinyX,ubgline.y,tinyBlock);
	    }


}
