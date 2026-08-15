var __b__;
__b__ = action_if(invulnerable==0);
if __b__
{
{
__b__ = action_if(phase<2);
if __b__
{
soundplay(global.sndCrash);
invulnerable=30;
grav=0;
life-=1;
with (sonic)
    {
        dir=point_direction(doom.x,doom.y,x,y);
        dir=doom.image_angle+10+90*round((dir-doom.image_angle-10)/90)
        motion_set(dir,12);
        sprite_index=sspjoing;
        image_speed=1/15;
        roll=0;
        gnd=0;
        x=doom.x+lengthdir_x(128,dir);
        y=doom.y+lengthdir_y(128,dir);
        
        ux=image_xscale*hspeed/speed;
        uy=image_xscale*vspeed/speed;
        nx=-uy;
        ny=-ux;
    
    }
if (life<=0)
    {phase=1;
    life=0;
    with objFinalOuter
        phase=3;
    timer=0;}
}
else
{
soundplay(global.sndBreakDown);
objectfg.flashlight=1;
invulnerable=50;
grav=0;
if (life==0)
    {
    with objDoomRack
         event_user(0);
    }
life+=1;
with (sonic)
    {
        sonic.able=0;
        if (other.life>=other.maxlife2)
            dir=0;
        else
            dir=point_direction(doom.x,doom.y,x,y);
        dir=doom.image_angle+20+90*round((dir-doom.image_angle-20)/90)
        motion_set(dir,17+4*(other.life>=other.maxlife2));
        sprite_index=sspjoing;
        image_speed=1/15;
        roll=0;
        gnd=0;
        x=doom.x+lengthdir_x(32,dir);
        y=doom.y+lengthdir_y(32,dir);
        
        ux=image_xscale*hspeed/speed;
        uy=image_xscale*vspeed/speed;
        nx=-uy;
        ny=-ux;
    
    }
if (life>=maxlife2)
    {
    life=maxlife2;
    if(controlbg.lev<13)
        {SS_StopSound(global.handle);
        SS_FreeSound(global.handle);}
    controlbg.lev=13;
    with objDoomRack
        event_user(1);
    phase=3;
    timer=0;
    invulnerable=30;
    ///WTF BOOM
    }
}
}
}
