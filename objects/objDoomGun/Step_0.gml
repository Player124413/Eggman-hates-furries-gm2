action_set_relative(1);
var __b__;
__b__ = action_if(extend<220 && active==0);
if __b__
{
{
extend += global.time*3;
{
action_set_relative(0);
angle2 = angle;
action_set_relative(1);
}
}
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

if (timer==30 || timer==33 || timer==36  ||  timer==50 || timer==53 || timer==56  ||  timer==70 || timer==73 || timer==76)
    {
    soundplay(global.sndFomp);
    retract=1;
    
    if(timer<40)
        c=angle-image_yscale*(timer*1.8);
    else
        c=angle-image_yscale*(50+timer);
    j=instance_create(doom.x+lengthdir_x(192,c),doom.y+lengthdir_y(192,c),objTarget);
    j.duration=300;
    
    i=instance_create(x,y,objFlashG2);
    i.speed=timer/3;
    i.direction=image_angle;
    i.explosive=1;
    i.target=j;
    }

if (timer==80)
    soundplay(global.sndElevator);
if (timer>80)
    {
    if (angle2<angle)
        angle2+=global.time*2;
    if (angle2>angle)
        angle2-=global.time*2;

    extend-=global.time*3;
    if (extend<192-64)
        instance_destroy();
    }
else
    {
    if(image_yscale>0)
        {
        if (angle2>angle-60)
            angle2-=global.time*4;
        else if (active==1)
            {active=2;
            soundplay(global.sndElevatorSetup);}
        }
    else
        {
        if (angle2<angle+60)
            angle2+=global.time*4;
        else if (active==1)
            {active=2;
            soundplay(global.sndElevatorSetup);}
        }
    }
}
{
action_set_relative(0);
image_angle = angle2;
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
