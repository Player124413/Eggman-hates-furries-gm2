action_set_relative(1);
var __b__;
__b__ = action_if(extend<220 && active==0);
if __b__
{
extend += global.time*3;
}
else
{
var c;
if (active==0)
    {
    soundplay(global.sndElevatorStop);
    active=1;
    }
timer+=global.time;

if (timer>45 && timer<=50)
    image_index=min(4,floor(timer-45));
else
    image_index=0;
if (timer>=50 && timer<=70 && timer mod 4 == 0)
    {
    image_index=4;
    soundplay(global.sndSurround);
    c=(timer-50)/20;
    i=instance_create(doom.x,doom.y,objDoomWave);
    i.image_angle=image_angle-c*60;
    i=instance_create(doom.x,doom.y,objDoomWave);
    i.image_angle=image_angle+c*60;
    }

if (timer==80)
    soundplay(global.sndElevator);
if (timer>80)
    {
    extend-=global.time*3;
    if (extend<192-64)
        instance_destroy();
    }
}
{
action_set_relative(0);
image_angle = angle;
action_set_relative(1);
}
if (point_distance(x,y,sonic.x,sonic.y)<36)
    {
    if (sonic.sprite_index==sjump || sonic.sprite_index==sdash)
        {
        instance_create(x,y,objElExp);
        soundplay(global.sndPop);
        instance_destroy();
        with sonic
            {
            motion_add(point_direction(other.x,other.y,x,y),8);
            motion_add(point_direction(doom.x,doom.y,x,y),8);
            }
        }
    else
        sonic.damaged=1;
    }
action_set_relative(0);
