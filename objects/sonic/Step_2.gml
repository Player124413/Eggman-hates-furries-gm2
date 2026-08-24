action_set_relative(1);
if (global.cheatInfiniteRings)
    global.rings=999;
if (cheatImmortal)
{
    damaged=0;
    invulnerable=0;
    visible=1;
}
action_move_to(-hspeed, -vspeed);
image_index += -image_speed*(1-global.time);
if(damaged==1)
    {
    if(invulnerable==0)
        {
        if(rings==0)
            {
            game_over();
            exit
            }
        
        soundplay(global.sndLoseRing);
        b=random(180);
        for(a=0; a<rings; a+=1)
            {
            i=instance_create(x,y,objfallring);
            i.direction=b+a*360/rings
            i.speed=8;
            i.hspeed+=hspeed;
            i.vspeed+=vspeed;
            }
        rings=0;
        invulnerable=60;
        able=0;
        if (gnd>0)
            {
            gnd=0;
            x+=8*nx;
            y+=8*ny;
            hspeed+=nx*8-image_xscale*ux*8;
            vspeed+=ny*8-image_xscale*uy*8;}
        else
            {
            motion_add(point_direction(damagex,damagey,x,y),8);
            }
        sprite_index=shurt;
        image_speed=1/15;
        image_angle=0;
        if(hspeed>0)
            image_xscale=-1;
        else
            image_xscale=1;
        }
    damaged=0;
    }
    
if(invulnerable>0 && !cheatImmortal)
    {visible=1-visible;
    
    if(invulnerable>180)//it counts up from 60 and then counts down from 60...
        {
        able=1;
        sprite_index=sjump;
        image_speed=1;
        invulnerable=60;
        }
    
    if (gnd>0 || able==1)
        {able=1;
        if (sprite_index==shurt)
            {sprite_index=srun;
            invulnerable=60;}
        invulnerable-=global.time;}
    else
        {invulnerable+=1;
        sprite_index=shurt;
        image_speed=1/15;
        image_angle=0;
        if(hspeed>0)
            image_xscale=-1;
        else
            image_xscale=1;}
    }
else
    {
    visible=1;
    invulnerable=0;
    }
action_set_relative(0);
