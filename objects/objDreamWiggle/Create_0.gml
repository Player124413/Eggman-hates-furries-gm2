w=128;
x2=x;
y2=y+128;

i1=instance_create(x,y,line);
i1.x2=x2;
i1.y2=y2;
i2=instance_create(x+w,y,line);
i2.x2=x2+w;
i2.y2=y2;
