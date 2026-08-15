function ultBouncers() {
	phase=10;

	xp=192;
	yp=0;
	sk=0;
	ultMake(3);
	k=instance_create(xx,ubgline.y,ult_bouncer);
	k.depth=1;
	k.image_angle=10;
	k.stick=i;

	xx-=80;
	xp=40;
	yp=-320;
	ultMake(1);
	i.hr=112;
	i.y+=yp; i.LH=1; i.RH=1; 
	k=instance_create(i.x+i.wr,i.y+100,ult_bouncer)
	k.stick=i;
	k.image_angle=20;
	k=instance_create(i.x+i.wr,i.y-20,ult_bouncer)
	k.stick=i;
	k.image_angle=20;


	xx+=192;
	yp=-128;
	xp=64;
	ultMake(1);
	camLock=xx+64;
	i.hr=192;
	i.y+=yp; i.LH=1; i.RH=1; 
	k=instance_create(i.x-i.wr,i.y,ult_bouncer);
	k.image_angle=180-30;
	k.amount=18;
	k.stick=i;
	k=instance_create(i.x-i.wr,i.y-120,ult_bouncer);
	k.image_angle=180-30;
	k.amount=18;
	k.stick=i;

	k=instance_create(xx,i.y-i.hr,fragileBlock);
	k.width=96;
	k.fragile=0;
	j=instance_create(k.x+k.width,k.y,ult_bouncer);
	j.image_angle=0;

	j=instance_create(i.x+i.wr,384,ult_bouncer);
	j.image_angle=22.5;

	xx+=256;
	xp=40;
	yp=-320;
	ultMake(1);
	i.hr=112;
	i.y+=yp; i.LH=1; i.RH=1; 

	k=instance_create(i.x-i.wr,i.y,ult_bouncer);
	k.image_angle=225;
	k.amount=18;
	k.stick=i;


	xx-=80;
	xp=64;
	yp=192;
	sk=0;
	ultMake(2);
	yp-=64;
	xp=32;
	ultMake(1);
	sk=-yp+32
	xp=192;
	ultMake(3);
	xp=64
	sk=-32;
	ultMake(2);
	sk=0;
	xp=64;
	ultMake(1);




}
