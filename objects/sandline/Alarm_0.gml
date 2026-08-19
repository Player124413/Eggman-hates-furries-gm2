d = max(0.0001, point_distance(x,y,x2,y2));
ux=(x2-x)/d;
uy=(y2-y)/d;
dir=point_direction(x,y,x2,y2);
if(dir>180)
    dir-=360;

i=instance_create(x,y,line);
i.x2=x2;
i.y2=y2;
// Panjan loop sides start open so Sonic can cross the entrance. Panjan turns
// these collision helpers back on after Sonic passes mx + 16.
if (loopside != 0)
{
    i.loopGate = true;
    i.on = 0;
}

amount = max(1, ceil(d / 20));



if(x<x2){xi=x; xa=x2;}else{xa=x; xi=x2;}
if(y<y2){yi=y; ya=y2;}else{ya=y; yi=y2;}

t1=floor(y)/64;
t2=floor(y2)/64;
l=floor(x)/64;
r=floor(x2)/64;

b1=floor(y+deep)/64;
b2=floor(y2+deep)/64;
on = 1;
