//Make tha walllz

i=instance_create(remRX-1920,remRY-2560,greatbrown2);
i.c4=i.c3;
i.depth=11;
i.x2=remRX;
i.y2=remRY-256;

i=instance_create(remRX-640,remRY-256,greatbrown2);
i.c4=i.c3;
i.depth=11;
i.x2=remRX-256;
i.y2=remRY;

i=instance_create(remRX-256,remRY,line);
i.visible=1;
i.x2=i.x;
i.y2=remRY-128;
i=instance_create(remRX-192,remRY-256,line);
i.visible=1;
i.x2=remRX;
i.y2=remRY-256;

i=instance_create(remRX-256,remRY-128,upground);
i.c4=i.c3;
i.x2=remRX-192;
i.y2=remRY-256;
i.deep=130;

for(a=0; a<256; a+=64)
    {
    i=instance_create(remRX-32,remRY-256+a,objSceneryStatic);
    i.sprite_index=sprDoomGirder;
    i.image_angle=270;
    i.depth=12;
    }
i=instance_create(remRX-640,remRY,greatbrown2);
i.c4=i.c3;
i.depth=11;
i.x2=remRX;
i.y2=remRY+1280;

i=instance_create(remRX-256,remRY,grassline);
i.deep=0;
i.x2=remRX;
i.y2=i.y;
