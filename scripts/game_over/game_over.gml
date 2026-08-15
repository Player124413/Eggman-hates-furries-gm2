function game_over(argument0) {
	if(argument0==0)
	    global._drown=0;
	else
	    global._drown=argument0;

	if instance_exists(sonic)
	    instance_create(sonic.x,sonic.y,objDeath);
	if instance_exists(sonic)
	    instance_create(sonic.x,sonic.y,objDeath);
	if instance_exists(objSuperSonic)
	    instance_create(objSuperSonic.x,objSuperSonic.y,objDeath);
	if instance_exists(sonails)
	    instance_create(sonails.x,sonails.y,objDeath);
	if instance_exists(bike)
	    instance_create(bike.x,bike.y,objDeath);



}
