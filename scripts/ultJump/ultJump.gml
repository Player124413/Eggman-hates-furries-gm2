function ultJump() {
	phase=9;

	xp=64;
	yp=0;
	sk=-8;
	ultMake(1);
	sk=-16;
	ultMake(1);
	sk=-32;
	ultMake(1);
	sk=-32;
	ultMake(1);
	sk=-12;
	ultMake(1);
	sk=0;
	ultMake(1);

	//yp+=48;
	xp=48;
	sk=32;
	ultMake(1);
	sk=48;
	ultMake(1);
	xp=16;
	sk=16;
	ultMake(1);
	sk=16;
	ultMake(1);
	sk=0;
	xp=32;
	ultMake(1);
	yp-=320;


	yp+=320;
	xp=16;
	ultMake(1);
	sk=-4;
	ultMake(1);

	xx+=352;
	xp=16;
	sk=0;
	yp=48;
	ultMake(1);
	yp=0;
	xp=64;
	ultMake(1);


}
