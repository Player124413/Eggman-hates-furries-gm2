var ff;
with (supergenerator.thefloor.ik)
    {hspeed=0;
    frict=1;}
timer=0;
subphs=0;
invulnerable=60;
life-=1;
soundplay(global.sndCrash);
soundplay(global.sndBreakDown);
objJaw.pendulum=1;

if (atk==4)
    ff=12;
else
    ff=8;
motion_set(point_direction(sonic.x,sonic.y,x,y),ff);

atk=1;

if (life<=0)
    {atk=6;
    with (objFlashG2)
        instance_destroy();
    hspeed=sign(hspeed)*8;
    
    objJaw.direction=point_direction(x,y,objJaw.x,objJaw.y)+100;
    objJaw.speed=20;
    
    with ia
        {i=instance_create(x,y,objdebris);
        i.sprite_index=sprChopper2;
        i.image_angle=image_angle;
        i.rotation=20;
        i=instance_create(x,y,objdebris);
        i.sprite_index=sprChopper2;
        i.image_angle=image_angle;
        i.rotation=10;
        i.hspeed=other.hspeed;
        i.vspeed=other.vspeed;
        i.vspeed-=4;
        instance_destroy();}
    ia=-1;
    with ik
        {instance_destroy();}
    ik=-1;
    with ib
        {instance_destroy();
        instance_create(x,y,objmedexp);}
    ib=-1;
    with objJaw
        {
        with ia
            {instance_destroy();}
        ia=-1;
        with ik
            {instance_destroy();}
        ik=-1;
        with ib
            {instance_destroy();}
        ib=-1;
        }
    
    soundstop(global.handle);
    SS_FreeSound(global.handle);
    supergenerator.phase=7;
    global.time=0.1;
    }

