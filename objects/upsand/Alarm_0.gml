d = max(0.0001, point_distance(x,y,x2,y2));
ux=(x2-x)/d;
uy=(y2-y)/d;

i=instance_create(x,y,line);
i.x2=x2;
i.y2=y2;
i.visible=1;
// Keep the Panjan loop gate open until the boss controller activates it.
if (loopside != 0)
{
    i.loopGate = true;
    i.on = 0;
}



if(x<x2){xi=x; xa=x2;}else{xa=x; xi=x2;}
if(y<y2){yi=y; ya=y2;}else{ya=y; yi=y2;}

b1=floor(y)/64;
b2=floor(y2)/64;
l=floor(x)/64;
r=floor(x2)/64;

t1=floor(ydeep)/64;
t2=floor(ydeep)/64;
on = 1;
