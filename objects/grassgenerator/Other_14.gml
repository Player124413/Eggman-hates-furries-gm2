var h1,v1,h2,v2;
h1=lengthdir_x(1,dir);
v1=lengthdir_y(1,dir);
h2=lengthdir_x(1,dir-90);
v2=lengthdir_y(1,dir-90);

xx+=len*h1;
yy+=len*v1;

x3=xx-h2*r;
y3=yy-v2*r;
x4=xx+h2*r;
y4=yy+v2*r;

//maek
i=instance_create(0,0,objTunnel);
i.x1=lx1;
i.y1=ly1;
i.x2=lx2;
i.y2=ly2;

i.x3=x3;
i.y3=y3;
i.x4=x4;
i.y4=y4;

lx1=x3;
ly1=y3;
lx2=x4;
ly2=y4;
