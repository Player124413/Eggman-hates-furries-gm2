var a,b,c,d;
with (balls)
    {
    
    if(point_distance(x,y,other.x,other.y)<radius && gnd==0)
        {
        a=point_direction(other.x,other.y,x,y);
    
        c=point_distance(other.hspeed,other.vspeed,hspeed,vspeed);
        d=point_direction(other.hspeed,other.vspeed,hspeed,vspeed);
        b=-lengthdir_x(c,d-a);
    
        motion_add(a,b);
        
        x=other.x+lengthdir_x(radius,a);
        y=other.y+lengthdir_y(radius,a);
        
        //inherit normal, set ground
        if(gnd!=2)
            {nullh=other.hspeed;
            nullv=other.vspeed;
            ux=cos(degtorad(a-90));
            uy=-sin(degtorad(a-90));
            nx=cos(degtorad(a));
            ny=-sin(degtorad(a));
            gnd=2;}
        }
    }
