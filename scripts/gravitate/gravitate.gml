function gravitate(argument0, argument1) {
	with (argument0)
	    {
	    vspeed-=global.grav/global.meter*global.time;
	    motion_add(point_direction(x,y,other.x,other.y),global.grav/global.meter*global.time*argument1);
	    }


}
