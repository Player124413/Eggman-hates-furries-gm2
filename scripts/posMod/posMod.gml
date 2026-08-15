function posMod(argument0, argument1) {
	argument0=argument0 mod argument1;
	if(argument0<0)
	    argument0+=argument1;
	return argument0;


}
