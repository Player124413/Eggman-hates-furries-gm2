d = max(0.0001, point_distance(x,y,x2,y2));
p=point_direction(x,y,x2,y2);
ux=(x2-x)/d;
uy=(y2-y)/d;

if (special==0)
    {ik=instance_create(x,y,line);
    ik.x2=x2;
    ik.y2=y2;
    }
else
    {ik=instance_create(x-128,y,movingline);
    ik.x2=x2+128;
    ik.y2=y2;
    }

amount = max(1, floor(d / 28));




if(x<x2){xi=x; xa=x2;}else{xa=x; xi=x2;}
if(y<y2){yi=y; ya=y2;}else{ya=y; yi=y2;}
on = 1;
