function makeCavityV(argument0, argument1, argument2) {
	i=instance_create(xx-256,yy,rockline);
	j=instance_create(xx,yy,rockline);
	k=instance_create(xx-256,yy,greattexture);
	l=instance_create(xx,yy,greattexture);

	xx+=argument0;
	yy+=argument1;
	i.x2=xx-256;
	i.y2=yy;
	j.x2=xx;
	j.y2=yy;

	k.x2=xx-256;
	k.y2=yy;
	l.x2=xx;
	l.y2=yy;

	k.x3=k.x-argument2;
	k.y3=k.y;
	l.x3=l.x+argument2;
	l.y3=l.y;

	k.x4=k.x2-argument2;
	k.y4=k.y2;
	l.x4=l.x2+argument2;
	l.y4=l.y2;

	k.t=-1;
	k.c1=c_black;
	k.c2=c_black;
	k.c3=c_black;
	k.c4=c_black;
	l.t=-1;
	l.c1=c_black;
	l.c2=c_black;
	l.c3=c_black;
	l.c4=c_black;
	k.depth=0;
	l.depth=0;

	with rockline
	    sprite_index=sblueground;



}
