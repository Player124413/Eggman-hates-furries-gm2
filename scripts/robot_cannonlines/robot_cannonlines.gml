function robot_cannonlines() {
	var xx,yy,x0,y0,c,h,v,h2,v2;

	xx=x+lengthdir_x(base-16+(platform)*32,image_angle);
	yy=y+lengthdir_y(base-16+(platform)*32,image_angle);

	x0=x+lengthdir_x(base-16,image_angle);
	y0=y+lengthdir_y(base-16,image_angle);
	h=lengthdir_x(16,image_angle+90);
	v=lengthdir_y(16,image_angle+90);

	bosul1.x=x0+h;
	bosul1.y=y0+v;
	bosul1.x2=xx+h;
	bosul1.y2=yy+v;
	bosul1.hspeed=hspeed;//approx.
	bosul1.vspeed=vspeed;
	with (bosul1)
	    {event_perform(ev_alarm,0);}

	bosul2.x=x0-h;
	bosul2.y=y0-v;
	bosul2.x2=xx-h;
	bosul2.y2=yy-v;
	bosul2.hspeed=hspeed;//approx.
	bosul2.vspeed=vspeed;
	with (bosul2)
	    {event_perform(ev_alarm,0);}
    
	bosul3.x=xx-h;
	bosul3.y=yy-v;
	bosul3.x2=xx+h;
	bosul3.y2=yy+v;
	bosul3.hspeed=hspeed;//approx.
	bosul3.vspeed=vspeed;
	with (bosul3)
	    {event_perform(ev_alarm,0);}
    
	bosul1.on=1;
	bosul2.on=1;
	bosul3.on=1;



}
