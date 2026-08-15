i=instance_create(x,y,rockline);
i.x2=x+a;
i.y2=y+b;
j=instance_create(x+320,y,rockline);
j.x2=x+a+320;
j.y2=y+b;
k=instance_create(i.x,i.y,greattexture);
k.x2=i.x2;
k.y2=i.y2;
k.x3=j.x;
k.y3=j.y;
k.x4=j.x2;
k.y4=j.y2;
x+=a;
y+=b;

