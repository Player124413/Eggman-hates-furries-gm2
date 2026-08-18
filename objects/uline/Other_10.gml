i1.x=x;
i1.y=y;
i2.x=x2;
i2.y=y2;

    
//calculate unit vector in the direction of this line
d = max(0.0001, point_distance(x,y,x2,y2));
ux=(x2-x)/d;
uy=(y2-y)/d;
//calculate orthogonal unit vector
p=point_direction(x,y,x2,y2);
nx=cos(degtorad(p+90));
ny=-sin(degtorad(p+90));

