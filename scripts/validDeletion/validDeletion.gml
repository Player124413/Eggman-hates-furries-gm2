function validDeletion() {
	//Destroy the line, removing it from adjacent neighbour "lists"
	if(n1>=0)
	    {
	    with n1
	        removeNeighbour(other.id,-2);

	    }
	if(n2>=0)
	    {
	    with n2
	        removeNeighbour(other.id,-2);
	    }
	n1=-1;
	n2=-1;
	instance_destroy();


}
