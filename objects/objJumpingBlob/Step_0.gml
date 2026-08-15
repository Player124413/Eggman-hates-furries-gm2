action_set_relative(1);
action_set_vspeed(global.grav/global.meter*global.time);
speed-=global.air*speed*speed*global.time;
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
image_index-=image_speed*(1-global.time);

if (instance_exists(sonic))
    {
    if (point_distance(x,y,sonic.x,sonic.y)<sonic.radius+4)
        {
        sonic.damaged=1;
        sonic.damagex=x;
        sonic.damagey=y;
        }
    }
    
if (y>ystart && vspeed>0)
    {instance_destroy();
    soundplay(global.sndLavaFizz);}
{
action_set_relative(0);
image_yscale = -min(1,max(-1,vspeed/3));
action_set_relative(1);
}
action_set_relative(0);
