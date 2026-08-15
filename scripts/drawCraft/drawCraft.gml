function drawCraft() {
	//With this I can change the appearance of all "Crafts".
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,image_blend,image_alpha);
	draw_sprite_ext(sprRudder,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(sprObserver,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(sprFrontSpike,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	draw_sprite_ext(sprWing,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);

	if(minigun)
	    {
	    if(firing)
	        draw_sprite_ext(sprMiniGunFire,gunimg,x+lengthdir_x(32,image_angle+270),y+lengthdir_y(32,image_angle+270),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	    else
	        draw_sprite_ext(sprMiniGun,gunimg,x+lengthdir_x(32,image_angle+270),y+lengthdir_y(32,image_angle+270),image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	    }

	if (myTails)
	    {
	    draw_sprite_ext(sprCails1,2*pull+floor(tailimg),x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	    draw_sprite_ext(sprCails2,tailanim,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
	    }




}
