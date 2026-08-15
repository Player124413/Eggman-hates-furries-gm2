timer = 0;
phase = 0;
repeat(16)
    {
    i=instance_create(x-48+random(96),y,objdebris);
    i.sprite_index=sprlaserdebris;
    i.direction=random(180);
    i.speed=8+random(8);
    i.rotation=-5+random(10);
    i.image_single=random(i.image_number);
    i.depth=10;
    }
    
repeat(16)
    {
    i=instance_create(x-48+random(96),y,objdebrisbouncer);
    i.sprite_index=sprcomponents;
    i.direction=random(180);
    i.speed=8+random(8);
    i.rotation=-16+random(32);
    i.image_single=random(i.image_number);
    i.depth=10;
    }
soundstop(global.sndRobot);
blink = 0;
