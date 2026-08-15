function intersectsWith(argument0) {
	var o;
	o=argument0;

	if(xa<o.xi || ya<o.yi || yi>o.ya || xi>o.xa)
	    return 0;
	if(dx==0 && dy==0)
	    return 0;

	if (dx!=0)
	    {
	    if(o.dy == dy*o.dx/dx)//they're parallel
	        return 0;//failure, we don't knows

	    fb=(y-o.y+dy*(o.x-x)/dx)/(o.dy-dy*o.dx/dx);
	    fa=(o.x+fb*o.dx-x)/dx;
	    }
	else
	    {
	    if(o.dx == dx*o.dy/dy)
	        return 0;
	    fb=(x-o.x+dx*(o.y-y)/dy)/(o.dx-dx*o.dy/dy);
	    fa=(o.y+fb*o.dy-y)/dy;
	    }
	if(fa>=0 && fa<=1 && fb>=0 && fb<=1)
	    return 1;
	return 0;


}
