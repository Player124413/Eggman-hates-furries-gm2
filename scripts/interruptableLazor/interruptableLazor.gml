function interruptableLazor(argument0, argument1, argument2, argument3, argument4) {
	var xx,yy,a,a,h,v;
	//x,y,direction,length/30,image index,width

	//This goes straight to the left
	//If objSuperSonic is in the way
	//SuperSonic is damaged
	//Laser is interrupted with a fancy effect.
	xx=argument0;
	yy=argument1;
	h=-32;
	v=0;
	lol=true;
	for(a=0; (a<argument2 && lol); a+=1)
	    { 
	    draw_sprite_ext(sprbiglaser,argument3,xx,yy,1,argument4,180,c_white,1);
    
	    xx+=h;
	    yy+=v;
	    if(xx<objSuperSonic.x+32+objSuperSonic.radius && abs(yy-objSuperSonic.y)<argument4*48+objSuperSonic.radius-8)
	        {
	        superHit();
	        lol=false;
	        draw_sprite_ext(sprbiglaser,argument3,objSuperSonic.x+objSuperSonic.radius,yy+1,(-(objSuperSonic.x+16)+xx+1)/32,1,0,c_white,1);
	        draw_sprite_ext(sprbigout,argument3,objSuperSonic.x+objSuperSonic.radius,yy,1,argument4,0,c_white,1);
	        }
	    }


}
