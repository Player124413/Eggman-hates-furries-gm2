function draw_ghost(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	var _f;
	draw_sprite_ext(argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);
	_f=instance_create(argument2,argument3,objReanGhosting);
	_f.sprite_index=argument0;
	_f.image_single=argument1;
	_f.image_xscale=argument4;
	_f.image_yscale=argument5;
	_f.image_angle=argument6;
	_f.image_blend=argument7;
	_f.image_alpha=argument8;
	_f.depth=depth+1;


}
