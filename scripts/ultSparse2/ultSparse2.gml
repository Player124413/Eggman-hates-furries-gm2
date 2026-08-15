function ultSparse2() {

	phase=4;
	sk=0;
	yp=320;
	xp=16;
	ultMake(1);
	xp=48;


	yp=-160;
	ultMake(1);//Upper platform
	i.hr=64;
	hema2=i;

	yp=320;
	xp=144;
	ultMake(3);
	yp=192;
	sk=-48
	xp=96;
	ultMake(2);//Get up
	sk=0;

	xp=32;
	yp=-300;
	ultMake(1);
	i.hr=48;
	yp+=300;
	xp=96;

	k=instance_create(i.x+i.wr,i.y,ult_bouncer);//Upper bouncer
	k.image_angle=10;
	k.stick=i;

	yp+=64
	ultMake(2);
	yp=-128;
	xp=96;
	ultMake(3);//tall finito
	i=instance_create(j.x-j.wr,j.y,ult_bouncer);//lower bouncer
	i.image_angle=130;
	i.stick=j;
	camLock=xx+64;

	sk=-yp;
	xp=256;
	ultMake(4);//even out
	sk=0;
	ultMake(4);//flat out


}
