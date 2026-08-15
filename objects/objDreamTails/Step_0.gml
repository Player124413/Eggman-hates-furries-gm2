image_index-=image_speed*(1-global.time);
if (timer<60)
    image_alpha+=global.time/60;
if(timer=60)
    image_alpha=1;

if (timer==120)
    instance_create(256,180,objEggHand);

timer+=global.time;
