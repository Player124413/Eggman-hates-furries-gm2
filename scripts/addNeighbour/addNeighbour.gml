function addNeighbour(argument0) {
	var i;
	i=argument0;
	//Add the argument to at most 1 of the neighbour vars, returning 0 if failure.
	//n==-1 is preferred over -2
	if(n1==-1)
	    {
	    n1=i;
	    return 1;
	    }
	if(n2==-1)
	    {
	    n2=i;
	    return 1;
	    }

	if(n1==-2)
	    {
	    n1=i;
	    return 1;
	    }
	if(n2==-2)
	    {
	    n2=i;
	    return 1;
	    }

	return 0;



}
