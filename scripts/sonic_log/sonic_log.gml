function sonic_log() {
	var i,ok;
	with (objMoveLogger)
	    timer+=global.time;

	ok=1;
	if(instance_exists(objTails))
	    {
	    if(objTails.maek==0)
	        ok=0;
	    }
	if(ok)
	{with sonic
	    {
	    i=instance_create(x,y,objMoveLogger);
	    i.sprite_index=sprite_index;
	    i.image_speed=0;
	    i.image_index=image_index;
	    i.image_xscale=image_xscale;
	    i.image_yscale=image_yscale;
	    i.image_angle=image_angle;
	    i.image_blend=image_blend;
	    i.image_alpha=image_alpha;
	    i.hsp=hspeed;
	    i.vsp=vspeed;
	    i.dash=dash;
	    i.roll=roll;
	    i.gnd=gnd;
	    }
	}


}
