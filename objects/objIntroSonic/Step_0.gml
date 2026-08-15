fixSpeeds();

timer+=global.time;
if (timer>12)
    global.time=0.5;

vspeed+=g*global.time;

__view_set( e__VW.XView, 0, x-320 );
__view_set( e__VW.YView, 0, y-320 );

if (gnd>0)
    {
    frictionize();
    if (sprite_index==sjump)
        {with introgenerator
            event_user(4);
        sprite_index=swalk;
        hspeed=ux/8;
        vspeed=uy/8;}
    image_angle=point_direction(0,0,ux,uy);
    if(speed<8)
        {
        speed+=0.25*global.time;
        image_speed=speed/8;
        }
    else if (speed<40)
        {
        if(sprite_index==swalk)
            sprite_index=srun;
        speed+=0.3*global.time;
        image_speed=2;
        }
    gnd-=1;
    }
