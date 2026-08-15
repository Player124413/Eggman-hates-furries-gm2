makeRazer(x+32,y+32,1,4);
with (objFragile)
    fragile=0;
    
i=instance_create(x,y,rockline);
i.x2=i.x;
i.y2=y+640;
i.depth=-11;

i=instance_create(x,y+640,rockline);
i.x2=i.x;
i.y2=y+1280;
i.depth=-3;


i=instance_create(x,y-320,rockline);
i.x2=i.x;
i.y2=y-480;
i.depth=-3;
