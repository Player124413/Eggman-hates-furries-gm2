d=point_distance(x,y,x2,y2);
ux=(x2-x)/d;
uy=(y2-y)/d;

i=instance_create(x,y,line);
i.x2=x2;
i.y2=y2;

amount=ceil(d/16);

c3=make_color_rgb(64,16,0);
c4=c_black;


if(x<x2){xi=x; xa=x2;}else{xa=x; xi=x2;}
if(y<y2){yi=y; ya=y2;}else{ya=y; yi=y2;}
on = 1;
