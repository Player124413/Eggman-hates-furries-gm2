function draw_overlay() {
	//use phase and timer
	with (objNukeExplosion)
	    draw_sprite_ext(sprite_index,floor(image_index),320,240,3,3,0,c_white,1-power(image_index/image_number,2));

	if (phase==3 && timer>10 && timer<30)
	    {
	    alp=1-abs(timer-20)/10;
	    draw_set_alpha(alp);
	    draw_set_color(c_gray);
	    draw_rectangle(0,0,640,480,0);
	    draw_set_alpha(1);
	    }
    
	if (phase==7)
	    {
	    if(timer>920 && timer<1000)
	        {draw_set_color(c_black);
	        draw_rectangle(0,0,640,480,0);
	        c=4*sin(timer*pi/35);
	        draw_background_ext(bgRiseMoustache,448,224+c, 1.5,1.5,0,c_white,0.5);
	        draw_background_ext(bgRiseMoustache,192,224+c, -1.5,1.5,0,c_white,0.5);
        
	        draw_background_ext(bgRiseEye,288,64+c,  -1.5,1.5,0,c_white,0.5);
	        draw_background_ext(bgRiseEye,352,64+c,  1.5,1.5,0,c_white,0.5);
	        draw_set_blend_mode(bm_add);
        
	        draw_background_ext(bgRiseMoustache,448-1+random(2),224-1+random(2)+c, 1.5,1.5,0,c_white,0.5);
	        draw_background_ext(bgRiseMoustache,192-1+random(2),224-1+random(2)+c, -1.5,1.5,0,c_white,0.5);
        
	        draw_background_ext(bgRiseEye,288-1+random(2),72-1+random(2)+c,  -1.5,1.5,0,c_white,0.5);
	        draw_background_ext(bgRiseEye,352-1+random(2),72-1+random(2)+c,  1.5,1.5,0,c_white,0.5);
	        draw_set_blend_mode(bm_normal);
        
	        draw_background_ext(bgRiseNose,320-114,480-273+c+4, 1.5,1.5,0,c_white,1);
	        }
	    else
	        {
	        c=140*(1-min(timer/150,1));
	        if(timer>=600)
	            c=(timer-600);
	        draw_sprite(sprCarryStand1,floor(subphs),0,480+c);
	        subphs+=1/6;
	        if (subphs>=3)
	            subphs-=3;
	        }
	    }
	if (phase==4 || phase==7)
	    {
	    alp=max(0,1-(timer)/120);
	    draw_set_alpha(alp);
	    if (timer==30 && phase==4)
	        draw_set_alpha(1);
	    draw_set_color(c_white);
	    draw_rectangle(0,0,640,480,0);
	    draw_set_alpha(1);
	    }
	if(phase==5)
	    {
	    draw_sprite(sprTailsFaint,halfblink,162,196);
	    draw_sprite(sprSonicFaint,floor(subphs),96,192);    
	    }
	if (phase==6 && timer>70 && timer<85)
	    {
	    draw_sprite(sprJumpOff,floor(9*(timer-70)/15),0,0)
	    }


}
