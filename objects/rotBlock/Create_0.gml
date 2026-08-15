

wr=32;
hr=128;
rot=0;
rotsp=0;

it=instance_create(0,0,uline);
ib=instance_create(0,0,uline);
il=instance_create(0,0,uline);
ir=instance_create(0,0,uline);
it.rp=0;
ib.rp=0;
il.rp=0;
ir.rp=0;

c1=make_color_rgb(8,96,24);
c2=make_color_rgb(16,160,64);

ct=make_color_rgb(72,47,57);
cb=make_color_rgb(0,0,0);

LH=false;
RH=false;
active = 0;
fallen = 0;
xskew = 0;
yskew = 0;
yG=y;
yskewG=0;

x1=x-1;
y1=y-1;
x2=x+1;
y2=y-1;
x3=x-1;
y3=y+1;
x4=x+1;
y4=y+1;
adjust = 0;
preadjust = 0;
count = 0;
