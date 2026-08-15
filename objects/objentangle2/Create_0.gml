phase = 0;
image_speed = 1;
timer = 0;
soundplay(global.sndSurround);

if (point_distance(sonic.x,sonic.y,x,y)<32)
    caught=1;
else
    {caught=0;
    i1=instance_create(x,y,movingball);
    i1.radius=32;}
