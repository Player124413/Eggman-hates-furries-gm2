function robotdie() {
	dangerousBlades=0;
	    if (finalcount==30 || finalcount==40 || finalcount==50 || finalcount==60 || finalcount==70 || finalcount==80)
	        soundplay(global.sndTargetConfirm);
	    finalcount+=global.time*2;
    
	    if (finalcount>80 && finalcount<90)
	        finalcount-=global.time;
    
	    if (finalcount==105)
	        soundplay(global.sndSnipe);
	    if (finalcount>120)
	        {
	        if(point_distance(sonic.x,sonic.y,x+lengthdir_x(base,image_angle)+hspeed,y+lengthdir_y(base,image_angle)+vspeed)<39)
	                {
	                sonic.damaged=1;
	                }
	        }
	    if(finalcount>=105)
	        {rotsp=20;
	        gps1=image_angle-40;
	        gps2=image_angle-110;
	        faps=-1
        
	        if(abs((gps1 mod 360)-(ps1 mod 360))<=10 && finalcount<120)
	            {
	            finalcount=120;
	            soundplay(global.sndClank);
	            }
	        }
	    if(finalcount==150)
	        {
	        soundloop(global.sndCutter);
	        }
	    if(finalcount>=150)
	        {faps=-1;
	        rotsp=2;
	        if (finalcount<180 && finalcount mod 3 ==0)
	            {i=instance_create(psx1-vspeed*global.time,psy1-vspeed*global.time,objsmexp);
	            i.depth=-2;
	            i.hspeed+=hspeed; i.vspeed+=vspeed;}
	        gps1=image_angle;
	        gps2=image_angle-150;}
	    if(finalcount>180)
	        {
	        soundstop(global.sndCutter);
	        soundplay(global.sndBreakDown);
        
	        f=image_angle+60;
	        xx=x+lengthdir_x(base,f);
	        yy=y+lengthdir_y(base,f);
	        a=instance_create(xx,yy,objdebris);
	        a.sprite_index=sproverarm;
	        a.image_single=1;
	        a.image_angle=ps1;
	        a.rotation=-5+random(10);
	        a.exploding=1/40;
	        xx+=lengthdir_x(ext,ps1);
	        yy+=lengthdir_y(ext,ps1);
	        a=instance_create(xx,yy,objdebris);
	        a.sprite_index=sprsawholder;
	        a.image_angle=ps2;
	        a.rotation=-5+random(10);
	        a.exploding=1/40;
	        xx+=lengthdir_x(arm,ps2);
	        yy+=lengthdir_y(arm,ps2);
	        a=instance_create(xx,yy,objdebris);
	        a.sprite_index=sprsaw;
	        a.exploding=1/40;
                
	        destroyed=3;
	        damaged=1;
	        ps=0;
        
	        boost=-1;
        
        
        
	        }


}
