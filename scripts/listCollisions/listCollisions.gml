function listCollisions(argument0, argument1) {
	var i;
	i=argument0;
	collisions=0;
	with (dLine)
	    {if(related>0)
	        related-=1;
	    }
	with (dLine)
	    {
	    if(id!=i && id!=argument1)
	        {
	        if(intersectsWith(i))
	            {
	            related=8;
	            other.cUsed[other.collisions]=false;
	            other.cLine[other.collisions]=id;
	            other.cA[other.collisions]=fa;
	            other.cB[other.collisions]=fb;
	            other.collisions+=1;
            
	            //additional: Cutoff this line at the intersection point as appropriate:
	            goingLeft=(posAngle(point_direction(x,y,i.x,i.y)-p));
	            //write code here
	            if(goingLeft xor i.right)
	                {
	                //keep last part of other;
	                x=x+dx*fa;
	                y=y+dy*fa;
	                if(n1>=0)
	                    {with n1 removeNeighbour(other.id,-1);}
	                n1=-1;
	                event_user(0);
	                }
	            else
	                {
	                //keep first part of other;
	                x2=x+dx*fa;
	                y2=y+dy*fa;
	                if(n2>=0)
	                    {with n2 removeNeighbour(other.id,-1);}
	                n2=-1;
	                event_user(0);
	                }
	            }
	        }
	    }


}
