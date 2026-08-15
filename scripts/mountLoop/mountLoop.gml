function mountLoop() {
	var sc,sxx,syy,steps,a,c,fx,fy;
	sc=4;
	steps=12;

	        xx=j.x;
	        yy=j.y;
        
	        xx+=sc*(136);
	        yy-=sc*(112);
	        sxx=xx;
	        syy=yy;
	        mxx=xx+sc*160;
	        for(a=-45; a<90; a+=(90+45)/steps)
	            {
	            xx=sxx-185.7*sc+lengthdir_x(sc*262.5,a);
	            yy=syy-185.7*sc+lengthdir_y(sc*262.5,a);
	            i=instance_create(xx,yy,mtline);
	            i.xdeep=mxx;
	            xx=sxx-185.7*sc+lengthdir_x(sc*262.5,a+(90+45)/steps);
	            yy=syy-185.7*sc+lengthdir_y(sc*262.5,a+(90+45)/steps);
	            i.x2=xx;
	            i.y2=yy;
	            }
        
	        i=instance_create(xx,yy,mtline);//HIGHEST ON UPPER CLOSING SECTION
	        i.xdeep=mxx;
	        xx=mxx;
	        yy-=sc*128;
	        i.x2=xx;
	        i.y2=yy;
        
        
	        i=instance_create(xx,yy,mtline);
	        i.xdeep=mxx;
	        xx+=sc*96;
	        yy+=sc*512;
	        i.x2=xx;
	        i.y2=yy;
	        i=instance_create(xx,yy,mtline);
	        i.xdeep=mxx;
	        xx=mxx;
	        yy+=sc*96;
	        i.x2=xx;
	        i.y2=yy;
	        i=instance_create(xx,yy,mtline);
	        i.xdeep=mxx;
	        xx=sxx;
	        yy=syy;
	        i.x2=xx;
	        i.y2=yy;
        
        
        
        
        
	        xx=j.x;
	        yy=j.y;
        
	        xx-=sc*(144);
	        yy-=sc*(192);
        
	        sxx=xx;
	        syy=yy;
	        mxx=xx-sc*160;
        
        
        
	        fx=-1;
	        fy=-1;
        
	        xx=sxx;
	        yy=syy;
        
	        for(c=120; c<=225; c+=135/steps)
	            {
	            xx=sxx+0.71*240*sc+lengthdir_x(sc*240,c);
	            yy=syy-0.71*240*sc+lengthdir_y(sc*240,c);
	            if (fx==-1)
	                {fx=xx; fy=yy;}
	            i=instance_create(xx,yy,mtline);
	            i.xdeep=mxx;
	            xx=sxx+0.71*240*sc+lengthdir_x(sc*240,c+135/steps);
	            yy=syy-0.71*240*sc+lengthdir_y(sc*240,c+135/steps);
	            i.x2=xx;
	            i.y2=yy;
	            }
            
	        i=instance_create(xx,yy,mtline);
	        i.xdeep=mxx;
	        xx-=192;
	        yy+=192;
	        i.x2=xx;
	        i.y2=yy;
        
	        i=instance_create(xx,yy,mtline);
	        i.xdeep=-1;
	        xx=mxx;
	        i.x2=xx;
	        i.y2=yy;
        
	        i=instance_create(xx,yy,mtline);
	        i.xdeep=mxx;
	        xx-=192;
	        yy-=192;
	        i.x2=xx;
	        i.y2=yy;
        
	        i=instance_create(xx,yy,mtline);
	        i.xdeep=mxx;
	        xx=mxx;
	        yy=fy-192;
	        i.x2=xx;
	        i.y2=yy;
        
	        i=instance_create(xx,yy,mtline);
	        i.xdeep=mxx;
	        xx=fx;
	        yy=fy;
	        i.x2=xx;
	        i.y2=yy;



}
