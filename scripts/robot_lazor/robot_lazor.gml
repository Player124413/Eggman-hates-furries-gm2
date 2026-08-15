function robot_lazor() {
	var xx,yy,rx,ry;


	xx=x+lengthdir_x(base-16,image_angle);
	yy=y+lengthdir_y(base-16,image_angle);
	draw_set_blend_mode(bm_add);
	draw_sprite_ext(sprbigout,eightstage,xx,yy,1,1,image_angle,image_blend,1);

	ry=-1;
    
	for (i=0; i<=32; i+=1;)
	    {
	    draw_sprite_ext(sprbiglaser,eightstage,xx,yy,1,1,image_angle,image_blend,image_alpha);

	    if(point_distance(xx,yy,sonic.x,sonic.y)<sonic.radius+32)
	        {sonic.damagex=x;
	        sonic.damagey=y;
	        sonic.damaged=1;}
    
	    xx+=lengthdir_x(32,image_angle);
	    yy+=lengthdir_y(32,image_angle);
	    if (xx<nnx-112 && ry==-1)
	        {rx=nnx-128;
	        ry=yy;}
	    if (xx>nnx+112 && ry==-1)    
	        {rx=nnx+128;
	        ry=yy;}
	    }
    
	if(ry>-1)
	    {
	    if(random(1)<global.time/4)
	        {
	        i=instance_create(rx,ry-64+random(128),objdebris);
	        i.sprite_index=sprlaserdebris;
	        i.depth=depth-1;
	        i.image_single=random(3);
	        i.image_xscale=0.33+random(0.67);
	        i.image_yscale=i.image_xscale;
	        i.hspeed=(1+random(1))*(x-i.x)/32;
	        i.vspeed+=vspeed/2;
	        i=instance_create(i.x,i.y,objsmexp);
	        i.depth=depth-1;
	        i.vspeed=vspeed/2;
	        }
	    }
	draw_set_blend_mode(bm_normal);


}
