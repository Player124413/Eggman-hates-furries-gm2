image_index-=image_speed*(1-global.time);

if (timer>=0)
    visible=1;
timer+=global.time;
if(timer==0 || timer==4 || timer==8)
    soundplay(global.sndTargetConfirm);

if (timer>30)
    instance_destroy();
