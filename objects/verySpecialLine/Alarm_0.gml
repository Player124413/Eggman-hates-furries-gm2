
d = max(0.0001, point_distance(x,y,x2,y2));
ux=(x2-x)/d;
uy=(y2-y)/d;
p=point_direction(x,y,x2,y2);
nx=cos(degtorad(p+90));
ny=-sin(degtorad(p+90));

//No endpoints

if(x<x2){xi=x; xa=x2;}else{xa=x; xi=x2;}
if(y<y2){yi=y; ya=y2;}else{ya=y; yi=y2;}
on = 1;
