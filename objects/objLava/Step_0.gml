x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);
image_index-=image_speed*(1-global.time);
if (random(10)<global.time)
    {i=instance_create(__view_get( e__VW.XView, 0 )+random(640),y-vspeed,objLavaBlob);
    i.vspeed=vspeed;}
if(random(3)<global.time)
    {i=instance_create(__view_get( e__VW.XView, 0 )+random(640),y-vspeed,objLavaWave);
    i.vspeed=vspeed;}
    

var __b__;
__b__ = action_if(instance_exists(sonic));
if __b__
{
x=sonic.x;
soundvolume(global.sndLavaAmb2,min(1,power(1/(1+point_distance(x,y,sonic.x,sonic.y)/160),1/4)));

if (sonic.y>y+32)
    game_over();
}
