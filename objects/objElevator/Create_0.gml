//FLOOR
i1=instance_create(x,y,movingline);
i1.y2=i1.y;
i1.x2=i1.x+64;
//TOP
i2=instance_create(x,y-96,movingline);
i2.y2=i2.y;
i2.x2=i2.x+64;

//RIGHT
i3=instance_create(x+64,y-96,movingline);
i3.mindist=-2;
i3.y2=y;
i3.x2=i3.x;

phase=0;
timer=0;
img = 0;
