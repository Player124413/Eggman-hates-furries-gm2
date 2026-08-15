function hard(argument0, argument1) {
	var d,s,e,xx,yy;

	with argument0
	    {
	    xx=(x+other.x)/2;
	    yy=(y+other.y)/2;
	    d=point_direction(x,y,other.x,other.y);
	    s=point_distance(hspeed,vspeed,other.hspeed,other.vspeed);
	    e=point_direction(hspeed,vspeed,other.hspeed,other.vspeed);
	    s=lengthdir_x(s,d-e);
	    motion_add(d,s/2);
	    x=xx-lengthdir_x(argument1/2,d);
	    y=yy-lengthdir_y(argument1/2,d);
	    with other
	        {
	        x=xx+lengthdir_x(argument1/2,d);
	        y=yy+lengthdir_y(argument1/2,d);
	        motion_add(d,-s/2);
	        }
	    }



}
