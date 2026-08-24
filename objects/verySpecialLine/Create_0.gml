// Explicitly initialise the inherited line state. Mobile GMS2 builds can
// skip the parent's Create event for this converted child object.
xi=0;
xa=0;
yi=0;
ya=0;
x2=x+64;
y2=y;
i1=-1;
i2=-1;
iL=-1;
iR=-1;
on=1;
frict=1;
ux=1;
uy=0;
nx=0;
ny=-1;
p=0;
d=max(0.0001,point_distance(x,y,x2,y2));
right=0;
loopside=0;
