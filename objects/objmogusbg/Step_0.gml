x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

image_angle+=rot*global.time;
if(kill)
    image_alpha-=global.time/60;
if  (x<-130 || x>770 || y<-130 || y>640 || image_alpha<=0)
    instance_destroy();
