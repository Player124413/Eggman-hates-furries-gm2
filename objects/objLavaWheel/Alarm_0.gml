i1=instance_create(x,y,movingball);
i1.radius=radius;

for(a=0; a<plats; a+=1)
    {
    i=instance_create(x,y,movingline);
    plat[a]=i;
    }
on = 1;
