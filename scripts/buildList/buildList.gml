function buildList(argument0, argument1, argument2, argument3, argument4) {
	var c,d,chosen,minima,prev,x2,y2;
	prev=argument0;
	x1=argument1;
	y1=argument2;
	x2=argument3;
	y2=argument4;
	    //lulz
	    //make a new list:
	    //first item is prev, if it exists.
	    //next items are all collisions, in order of b
	    //last item is x2y2 IF AND ONLY IF the list is odd at this time.
	lists=0;
	if(prev!=-1)
	    {
	    list[lists]=prev;//this is 100% a-OK
	    listX[lists]=x1;
	    listY[lists]=y1;
	    lists+=1;
	    }
	//this is like an extremely bad sorting algorithm but we normally only have 1 element, so..
	for(c=0; c<collisions; c+=1)
	    {
	    minima=1;
	    chosen=-1;
	    for(d=0; d<collisions; d+=1)
	        {
	        if(cB[d]<=minima && !cUsed[d])
	            {
	            chosen=d;
	            minima=cB[d];
	            }
	        }
	    cUsed[chosen]=true;
    
	    list[lists]=cLine[chosen];
	    listX[lists]=x1*(1-cB[chosen])+x2*cB[chosen];
	    listY[lists]=y1*(1-cB[chosen])+y2*cB[chosen];
	    lists+=1;
	    }

	if (lists mod 2 == 1)
	    {
	    list[lists]=-2;//this is 100% a-OK
	    listX[lists]=x2;
	    listY[lists]=y2;
	    lists+=1;
	    }


}
