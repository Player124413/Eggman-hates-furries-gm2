action_set_relative(1);

if (keyboard_check_pressed(vk_f1))
{
    cheatImmortal=!cheatImmortal;
    global.cheatImmortal=cheatImmortal;
}
if (keyboard_check_pressed(vk_f2))
{
    cheatHighJump=!cheatHighJump;
    global.cheatHighJump=cheatHighJump;
}
jump = cheatHighJump ? 32 : 9;
if (cheatImmortal)
{
    damaged=0;
    invulnerable=60;
    visible=1;
}

var __b__;
__b__ = action_if(!specialStopCase);
if __b__
{
action_set_motion(flyRight+270, global.grav/global.meter*global.time);
}
__b__ = action_if(physics);
if __b__
{
if(airResist)
    speed-=global.air*speed*speed*global.time;

soundvolume(windSound,min(1,power(speed/32,1/4)));
if(instance_exists(engines))
    soundvolume(global.sndEngine,min(1,power(1/(1+point_distance(x,y,engines.x,engines.y)/640),1/4)));
else if(!instance_exists(objTornadoLanded) && !instance_exists(tornado))
    soundvolume(global.sndEngine,0);


sig=lockMovement;
if(keyboard_check(vk_right) && able && dash==0)
sig+=1;
if(keyboard_check(vk_left) && able && dash==0)
sig-=1;

pd=point_direction(0,0,ux,uy);
ts=lengthdir_x(point_distance(nullh,nullv,hspeed,vspeed),point_direction(nullh,nullv,hspeed,vspeed)-pd);
if(sprite_index!=shurt)
    {
    if(lastgnd==0 && gnd>0)
        image_angle=pd;
    else
        {
        if (image_angle<90 && pd>270)
            image_angle+=360;
        if (image_angle>270 && pd<90)
            image_angle-=360;
        image_angle=(pd+image_angle)/2;
        }
    }

frict=0.16;//Default

if (gnd > 0) // on ground
{
    // Handle an active spin dash before the normal standing/movement state.
    // Previously this was nested inside abs(ts) < 1.5, so Dream's curved
    // ground could leave dash > 0 forever and disable every direction key.
    if (dash > 0)
    {
        standcount = 0;
        dash_charge_timeout -= global.time;
        var release_dash = !keyboard_check(vk_down)
            || keyboard_check(vk_left)
            || keyboard_check(vk_right)
            || dash_charge_timeout <= 0;

        if (release_dash)
        {
            if (instance_exists(myfish))
                myfish.kill = 1;
            soundplay(global.sndDash);
            roll = 1;
            sprite_index = sjump;
            image_speed = 1;
            hspeed += image_xscale * ux * (24 + dash * 8) * global.time;
            vspeed += image_xscale * uy * (24 + dash * 8) * global.time;
            dash = 0;
            dash_charge_timeout = 0;
        }
        else
        {
            frict = 10;
            hspeed = (hspeed + nullh) / 2;
            vspeed = (vspeed + nullv) / 2;
            sprite_index = sdash;
            image_speed = 1;
        }
    }
    else if (abs(ts) < 1.5 && (sig == 0 || roll == 1))
    {
        frict = 0.32;
        standcount += global.time;
        if (keyboard_check(vk_down) && able)
        {
            if (sprite_index != sduck)
                standcount = 0;
            image_index = (standcount < 3) ? 0 : 1;
            image_speed = 0;
            sprite_index = sduck;
        }
        else
        {
            sprite_index = sstand;
            image_speed = 0;
            image_index = 0;
            if (standcount > 100)
                image_index = 1;
            if (standcount > 120)
                image_index = (standcount mod 30 <= 15) ? 3 : 2;
        }
        roll = 0;
    }
    else // in motion or pressing a direction
    {
        standcount = 0;
        if (roll == 0)
        {
            if (sig * ts <= -2 && lengthdir_x(1, pd - flyRight) >= 0.66 && canSkid)
            {
                if (sprite_index != sstop && image_speed != 1 / 10 && image_xscale != sig)
                    soundplay(global.sndStop);
                f = 1;
                hspeed -= nx * 0.25 * global.time;
                vspeed -= ny * 0.25 * global.time;
                sprite_index = sstop;
                image_speed = 1 / 10;
            }
            else if (abs(ts) < 8)
            {
                f = acc * (1 + max(0, -sign(ny) * power(ny, 2) / (2 + 0.5 * abs(ts))));
                if (sig * ts <= -2)
                    f /= 4;
                sprite_index = swalk;
                image_speed = ts * image_xscale / 8;
            }
            else
            {
                f = acc;
                if (sig * ts <= -2)
                    f /= 4;
                sprite_index = srun;
                image_speed = 2 * sign(ts * image_xscale);
            }
        }
        else
        {
            image_speed = min(1, ts * image_xscale / 4);
            f = (sig == sign(ts)) ? acc / 4 : acc;
        }

        hspeed += sig * ux * f * global.time;
        vspeed += sig * uy * f * global.time;
        if (sig != 0)
        {
            image_xscale = (ts == 0) ? sign(sig) : sign(ts);
            frict = 0.05;
        }
    }
}
else//not on ground
    {
    //can't spindash in air
    if (dash > 0)
    {
        if (instance_exists(myfish))
            myfish.kill = 1;
        dash = 0;
        dash_charge_timeout = 0;
    }
    
    if (sprite_index==sstand || sprite_index==sstop || sprite_index==sduck || sprite_index==spush || 
        sprite_index==swalk || sprite_index==sdash || sprite_index==srun || (sprite_index==sspjoing && vspeed>0))
        {sprite_index=sjump;//...==srun is experimental, I don't know what to do
        image_speed=1;}
    standcount=0;
    
    motion_add(flyRight,sig*acc*global.time);
        
    if(sprite_index!=sspjoing && speed!=0)
        {
        ux=image_xscale*hspeed/speed;
        uy=image_xscale*vspeed/speed;
        nx=uy;
        ny=-ux;
        }
    }

if (lastgnd==0 && gnd==2)
    {
    if(point_distance(hspeed,vspeed,nullh,nullv)>4)
        soundplay(global.sndLand2); 
    if (ts!=0 && dash==0)
        image_xscale=sign(ts);
    }
    
gnd-=1;
if(gnd<0)
    {gnd=0;
    nullh=0;
    nullv=0;}
lastgnd=gnd;
/* */
}
if(!able)
    {
    with (objdashfish) kill = 1;
    dash = 0;
    dash_charge_timeout = 0;
    }
/* */
__view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*3+x-320+2*hspeed*global.time)/4 );
__view_set( e__VW.YView, 0, (__view_get( e__VW.YView, 0 )*3+y-240+2*vspeed*global.time)/4 );

//if(controlbg.lev==0)
//{if (view_xview<0)
//view_xview=0;
//if (view_yview<0)
//view_yview=0;

//if (view_xview>room_width-640)
//view_xview=room_width-640;
//if (view_yview>room_height-480)
//view_yview=room_height-480;

/* */
action_set_relative(0);
/*  */
