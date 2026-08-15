function drillScript(argument0, argument1) {
	var h,v,h2,v2,a,d,k,i,c,mx,my,rr;
	h=lengthdir_x(1,dir+90);
	v=lengthdir_y(1,dir+90);
	h2=lengthdir_x(1,dir);
	v2=lengthdir_y(1,dir);

	//LEFT SIDE
	mx=argument0+h2*(precision/2+18+global.time*speed);
	my=argument1+v2*(precision/2+18+global.time*speed);
	nx=mx+48*h;
	ny=my+48*v;
	change=0;
	if(phase<7 || lastLeft!=-1)
	if (point_distance(nx,ny,lx,ly)>precision || respawn)
	    {
	    change=1;
	    lastLeft=spawn(lx,ly,nx,ny,lastLeft,0);
    
	    if(lastLeft!=-1)
	        {
	        i=instance_create(mx,my,objDrillParticle);
	        i.image_angle=dir;
	        i.direction=dir+135+random(90);
	        i.speed=1;
	        i.image_yscale=0.8+random(0.3);
	        }
        
	    if((instance_exists(mogen) && mogen>0) || phase<7)
	        {    
	        if(phase<7)
	            i=instance_create(nx,ny,objTri);
	        else
	            {i=instance_create(mogen.x2,mogen.y2,objTri);
	            if(subphs>=2) i.shade=0;}
	        i.x2=lx; i.y2=ly;
	        i.x3=rx; i.y3=ry;
	        lastTri=i;
    
	        lx=i.x;
	        ly=i.y;
	        }
	    }
	nx=mx-48*h;
	ny=my-48*v;
	if(phase<7 || lastRight!=-1)
	if (point_distance(nx,ny,rx,ry)>precision || respawn)
	    {
	    change=1;
	    lastRight=spawn(rx,ry,nx,ny,lastRight,1);
    
	    if(lastRight!=-1)
	        {
	        i=instance_create(mx,my,objDrillParticle);
	        i.image_angle=dir;
	        i.direction=dir+135+random(90);
	        i.speed=1;
	        i.image_yscale=-0.8-random(0.3);
	        }
    
	    if((instance_exists(mogen) && mogen>0) || phase<7)
	        {
	        i=instance_create(rx,ry,objTri);
	        if(phase==7)
	            {i.x2=mogen.x2; i.y2=mogen.y2;
	            if(subphs>=2) i.shade=0;}
	        else
	            {i.x2=nx; i.y2=ny;}
	        i.x3=lx; i.y3=ly;
	        lastTri=i;
        
	        rx=i.x2;
	        ry=i.y2;
	        }
	    }

	respawn=0;


}
