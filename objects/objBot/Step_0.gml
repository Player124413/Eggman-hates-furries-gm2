action_set_relative(1);

// objBot is owned by Panjan. Broad phase clean-ups can remove Panjan, Sonic,
// the water plane, or Tornado before this Step runs.
var boss = instance_find(panjan, 0);
if (!instance_exists(boss))
{
    instance_destroy();
    exit;
}
var player = instance_find(sonic, 0);
var water = instance_find(objWaterFront, 0);
var tornado_instance = instance_find(tornado, 0);

if (dead)
    exit;

image_index-=(1-global.time)*image_speed;
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
action_set_vspeed(0.4*global.time);
splashTimer-=global.time;
if (instance_exists(water))
{
    if (splashTimer <= 0)
    {
        i = instance_create(x - 32 + random(64), water.y, objSplash2);
        i.image_yscale = (1 - min(1, abs(y - water.y) / 128)) * min(1, (speed + water.hspeed) / 50);
        i.image_xscale = i.image_yscale;
        splashTimer += 4 - 3 * (abs(y - water.y) < 16);
    }

    if ((y >= water.y && yp < water.y) || (y < water.y && yp >= water.y))
    {
        i = instance_create(x, water.y, objSplash);
        i.hspeed = hspeed + water.hspeed * 0.25;
    }
}
yp=y;
action_move_to(lulsp*global.time, 0);
var c;

c=(__view_get( e__VW.XView, 0 )-lastVX)/global.time;
lulsp=approach(lulsp,9,c,1);
lastVX=__view_get( e__VW.XView, 0 );
if(boss.phase==3 && boss.subphs<2)
    {
    lulsp=lulsp*9/(9+global.time);
    }

fourstage+=1;
if (fourstage>=4)
    fourstage=0;
var __b__;
__b__ = action_if(shieldTimer>0);
if __b__
{
shieldTimer-=global.time;

if(shieldTimer<30 && shieldTimer mod 10 == 3)
    {
    soundplay(global.sndClink)
    }
if (shieldTimer<=0)
    {
    shieldTimer=0;
    soundplay(global.sndForceBounce);
    shield=1;
    }
}
__b__ = action_if(instance_exists(player)
    && point_distance(x + hspeed * global.time, y + vspeed * global.time, player.x, player.y) < 34
    && player.able && invulnerable == 0 && boss.phase != 3);
if __b__
{
if(shield)
    {
    if(player.invulnerable==0)
        {
        player.damaged=1;
        player.damagex=player.x-8;
        player.damagey=player.y;
        }
    }
else
    {
    if(boss.phase==2)
        boss.subphs=1;
    //TAEK DAMAGES
    damaged+=1;
    motion_add(point_direction(player.x,player.y,x,y),8);
    with (player)
        {//motion_add(point_direction(other.x,other.y,x,y),4);
        hspeed=boss.hspeed+4;}
    i=instance_create(x,y,objmedexp);
    i.hspeed=hspeed+lulsp*0.6;
    i.vspeed=vspeed;
    soundplay(global.sndBreakDown);
    invulnerable=120;
    //boss.nextRock+=30;
    }
}
__b__ = action_if(invulnerable>0);
if __b__
{
if (invulnerable mod 2 ==0 && invulnerable>60)
    {
    i=instance_create(x-32+random(64),y-32+random(64),objsmexp);
    i.hspeed=hspeed/2+lulsp*0.33;
    i.vspeed=vspeed/2;
    }
if(damaged>=2)
    {
    goalx=__view_get( e__VW.XView, 0 )+48;
    goaly=__view_get( e__VW.YView, 0 )+48;
    }
else if (invulnerable>30)    
    {
    goalx=__view_get( e__VW.XView, 0 )-128;
    goaly=__view_get( e__VW.YView, 0 )-128;
    }
invulnerable-=global.time;
if (invulnerable<=0)
    {
    invulnerable=0;
    }
if(invulnerable<60 && damaged>=2)
    {
    if (instance_exists(tornado_instance) && tornado_instance.phase < 4)
        tornado_instance.phase = 0;

    // Make the spotter drone's destruction clearly visible, matching the
    // original Panjan footage: a large flash followed by several fragments.
    repeat (5)
        {
        i = instance_create(x - 20 + random(40), y - 20 + random(40), objbigexp);
        i.hspeed = hspeed + lulsp * 0.6;
        i.vspeed = vspeed;
        i.depth = -10000;
        i.image_xscale = 1.5;
        i.image_yscale = 1.5;
        }
    repeat (12)
        {
        i = instance_create(x - 16 + random(32), y - 16 + random(32), objdebris);
        i.hspeed = hspeed + lulsp - 8 + random(16);
        i.vspeed = vspeed - 8 + random(16);
        i.sprite_index = sprCamApp;
        i.image_angle = random(360);
        i.rotation = -12 + random(24);
        i.exploding = 0.08;
        }
    soundplay(global.sndExplosion);
    soundplay(global.sndGunstar2);
    soundplay(global.sndGunstar1);

    dead = true;
    visible = false;
    shield = 0;
    speed = 0;
    exit;
    }
}
{
action_set_relative(0);
blink = !blink;
action_set_relative(1);
}
var goal;

a=goalx-x;
b=goaly-y;
if (abs(a)>150)
    a=sign(a)*150;
if (abs(b)>150)
    b=sign(b)*150;
    
vthrust=min(-0.1,(b-global.time*vspeed*80)/400-0.2);//gravity
hthrust=(a-global.time*hspeed*74)/400;

if (point_distance(0,0,hthrust,vthrust)>0.27)//HARD LIMITER
    {hthrust=lengthdir_x(0.27,point_direction(0,0,hthrust,vthrust));
    vthrust=lengthdir_y(0.27,point_direction(0,0,hthrust,vthrust));}


if (abs(hthrust)>abs(vthrust)/2)
    hthrust=sign(hthrust)*abs(vthrust)/2;

    goal=point_direction(0,0,hthrust,vthrust)-90;
thrust=2*point_distance(0,0,hthrust,vthrust);

goal = goal mod 360;
    angle= angle mod 360;
    
    while (angle>270 && goal<90)
    angle-=360;
    while (angle<90 && goal>270)
    angle+=360;
    
    angle=(angle*9+goal)/10;
  
//sound_3d_set_sound_position(sndChopper,0,0,1); 
//sound_3d_set_sound_velocity(sndChopper,40*sin(angle),0,-400*(thrust-0.2));
action_set_motion(angle+90, thrust*global.time);
action_set_relative(0);
