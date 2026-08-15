function spawnTopRocks(argument0, argument1) {
	repeat(argument0)
	{
	l=random(1);
	i=instance_create(x1*(1-l)+x2*l,y1*(1-l)+y2*l,objdebris);
	i.sprite_index=sprlaserdebris;
	i.image_single=random(3);
	i.rotation=-5+random(10);
	i.image_xscale=0.5+random(0.5);
	i.image_yscale=i.image_xscale;

	i.direction=rot+60+random(60);
	i.speed=i.speed*argument1;
	i.depth=1;
	}


}
