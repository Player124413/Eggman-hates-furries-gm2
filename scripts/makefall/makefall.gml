function makefall(argument0, argument1, argument2) {
	var a,b;
	a=argument0;
	b=argument1;

	with (objGrass)
	    {
	    if(point_distance(x,y,a,b)<argument2 && !immune)
	        {
	        falling=1;
	        }
	    }


}
