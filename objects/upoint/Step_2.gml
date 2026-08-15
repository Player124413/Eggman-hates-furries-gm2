var a,b,c,d;
with (ult_balls)
    {
    
    if(point_distance(x,y,other.x,other.y)<radius && gnd==0)
        {
        a=point_direction(other.x,other.y,x,y);
    
        c=point_distance(other.hsp,other.vsp,hspeed,vspeed);
        d=point_direction(other.hsp,other.vsp,hspeed,vspeed);
        b=-lengthdir_x(c,d-a);
    
        motion_add(a,b);
        
        x=other.x+lengthdir_x(radius,a);
        y=other.y+lengthdir_y(radius,a);
        
        //inherit normal, set ground
        if(gnd!=2)
            {nullh=other.hsp;
            nullv=other.vsp;
            ux=cos(degtorad(a-90));
            uy=-sin(degtorad(a-90));
            nx=cos(degtorad(a));
            ny=-sin(degtorad(a));
            gnd=2;}
        }
    }
