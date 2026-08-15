if(point_distance(x,y,objSuperSonic.x,objSuperSonic.y)<objSuperSonic.radius+radius+10)
    {instance_create(x,y,objSuperRingGet);
    instance_destroy();}
    
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

image_index-=(1-global.time)*image_speed;

vspeed+=global.grav/global.meter*global.time;
if(y>384-radius)
    {
    y=384-radius;
    vspeed=-vspeed*0.8;
    }
    
if (x<-radius)
    instance_destroy();
