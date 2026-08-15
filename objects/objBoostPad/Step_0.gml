image_index-=(1-global.time)*image_speed;
if(instance_exists(sonic))
{
if(point_distance(x,y,sonic.x,sonic.y)<sonic.speed+32 && sonic.gnd>0)
    {
    if(trigger==0)
        {
        sonic.speed=amount;
        sonic.direction=image_angle;
        if(image_xscale<0)
            sonic.direction+=180;
        soundplay(global.sndBooster)
        }
    trigger=1;
    }
else
    trigger=0;
}
