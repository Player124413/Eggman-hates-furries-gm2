function spawn(argument0, argument1, argument2, argument3, argument4, argument5) {
	var x1,y1,x2,y2,prev,i,right;
	x1=argument0;
	y1=argument1;
	x2=argument2;
	y2=argument3;
	prev=argument4;
	right=argument5;

	//make a line. The purpose is to check for collisions with it.
	i=instance_create(x1,y1,dLine)
	i.x2=x2; i.y2=y2; i.right=right;
	with (i) event_user(0);
	//list all the collisions we will encounter
	listCollisions(i,prev);
	with (i) instance_destroy();//don't need it anymore.

	buildList(prev,x1,y1,x2,y2);

	//build lines according to the list.
	r=0;
	while (r<lists)
	    {
        
	    i=instance_create(listX[r],listY[r],dLine)
	    i.x2=listX[r+1]; i.y2=listY[r+1];
	    i.right=right;
	    with (i) event_user(0);
    
	    if(list[r]>=0)
	        {
	        i.n1=list[r];
	        with list[r] 
	            addNeighbour(i);
	        }
    
	    if(list[r+1]>=0)
	        {
	        i.n2=list[r+1];
	        with (list[r+1])
	            addNeighbour(i);
	        }
    
	    r+=2;
	    }

	if (lists==0)
	    return -1;//I don't think this happens, ever

	if(collisions>0)
	    {
	    soundplay(global.sndCrush);
	    repeat(4)
	        {
	        j=instance_create(x-32+random(64),y-32+random(64),objdebris);
	        j.sprite_index=sprlaserdebris;
	        j.image_single=random(i.image_number);
	        j.rotation=-5+random(10);
	        j.hspeed+=hspeed*2;
	        j.vspeed+=vspeed*2;
	        j.depth=depth-1;
	        }
	    }
	//if x2y2 was in the list, then prev =i else prev is invalid
	mogen=i;
	if(list[lists-1]==-2)
	    return i;
	return -1;


}
