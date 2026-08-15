image_index-=(1-global.time)*image_speed;
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

if (hspeed>0)
    hspeed-=global.time;
if (hspeed<0)
    hspeed+=global.time;
    
if(image_index>2)
    image_speed=0.66;
