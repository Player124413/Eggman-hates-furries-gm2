function drawLazor(argument0, argument1, argument2, argument3, argument4, argument5) {
	var xx,yy,a,a,h,v;
	//x,y,direction,length/30,image index,width
	xx=argument0;
	yy=argument1;
	h=lengthdir_x(30,argument2);
	v=lengthdir_y(30,argument2);
	for(a=0; a<argument3; a+=1)
	    {
	    draw_sprite_ext(sprbiglaser,argument4,xx,yy,1,argument5,argument2,c_white,1);
	    xx+=h;
	    yy+=v;
	    }


}
