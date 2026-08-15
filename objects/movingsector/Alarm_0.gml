if(i1==-1)
    {i1=instance_create(x,y,movingline);
    i1.p=id;
    i1.x2=x+lengthdir_x(radius,mi);
    i1.y2=y+lengthdir_y(radius,mi);
    i2=instance_create(x,y,movingline);
    i2.p=id;
    i2.x2=x+lengthdir_x(radius,ma);
    i2.y2=y+lengthdir_y(radius,ma);
    on=1;}
else
    {i1.x=x;
    i1.y=y;
    i1.x2=x+lengthdir_x(radius,mi);
    i1.y2=y+lengthdir_y(radius,mi);
    with i1
        event_perform(ev_alarm,0);
    i2.x=x;
    i2.y=y;
    i2.x2=x+lengthdir_x(radius,ma);
    i2.y2=y+lengthdir_y(radius,ma);
    with i2
        event_perform(ev_alarm,0);
    }
    
i1.hspeed=hspeed;
i1.vspeed=vspeed;
i2.hspeed=hspeed;
i2.vspeed=vspeed;
