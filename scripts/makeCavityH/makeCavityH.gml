function makeCavityH(argument0, argument1, argument2) {
	i=instance_create(xx,yy-256,rockline);
	j=instance_create(xx,yy,rockline);
	xx+=argument0;
	yy+=argument1;
	i.x2=xx;
	i.y2=yy-256;
	i.ydeep=i.y-argument2;
	j.x2=xx;
	j.y2=yy;
	j.ydeep=j.y+argument2;
        
	with rockline
	    sprite_index=sblueground;



}
