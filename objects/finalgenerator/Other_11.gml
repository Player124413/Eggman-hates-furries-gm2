rr=306;
    i=instance_create(x,objLava.y,objlavarockbg);
    i.x2=x+2*rr;

    for (a=0; a<20; a+=1)
        {
        i=instance_create(x+rr+rr*cos(pi*a/20),y+rr*sin(pi*a/20),rockline); i.ydeep=objLava.y;
        i.y2=y+rr*sin(pi*(a+1)/20);
        i.x2=x+rr+rr*cos(pi*(a+1)/20);
        }
    //
    i=instance_create(x+2*rr,y,rockline);
    i.x2=i.x;
    i.y2=y-64;
    i=instance_create(x+2*rr,y-64,rockline);
    i.x2=x+800;
    i.y2=i.y;
        
    x=x+rr*2+128;
    y=y-64;
    
    i=instance_create(x+48,y-32,rockline);
    i.x2=i.x;
    i.y2=i.y-64;
    
    i=instance_create(x+48,y-96,rockline);
    i.x2=remX;
    i.y2=remY;
    
    i=instance_create(x,y-32,objPipeInit);
    i.special=1;//make make checkpoint at launch point.
    with i
        {
        makePipe1();
        }
    
    
    phase=7;
