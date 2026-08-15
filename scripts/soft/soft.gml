function soft(argument0, argument1, argument2, argument3) {
	var d,s,e,xx,yy,strain,wobble,stiff;
	wobble=argument2;
	stiff=argument3;
	with argument0
	    {
	    strain=point_distance(x,y,other.x,other.y)-argument1;
	    d=point_direction(x,y,other.x,other.y);
	    s=point_distance(hspeed,vspeed,other.hspeed,other.vspeed);
	    e=point_direction(hspeed,vspeed,other.hspeed,other.vspeed);
	    s=lengthdir_x(s,d-e);
	    motion_add(d,global.time*wobble*strain+stiff*s/2);
	    with other
	        {
	        motion_add(d,global.time*-wobble*strain+stiff*-s/2);
	        }
	    }



}
