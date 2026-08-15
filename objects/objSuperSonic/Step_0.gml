action_set_relative(1);
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

image_index-=(1-global.time)*image_speed;

dustTimer-=global.time;
if (dustTimer<=0)
    {
    instance_create(x-random(32),objSuperGrass.y,objDust);
    dustTimer+=3;
    }

eightstage+=1;
if (eightstage>=8)
    eightstage-=8;
var __b__;
__b__ = action_if_dice(1+hit);
if __b__
{
action_create_object(objSparkly, -32+random(64), -16+random(32));
}
__b__ = action_if(hit>0);
if __b__
{
setup=0;
sprite_index=sprSuperHurt;
image_speed=0.1;
if (x>0)
    x-=6*global.time;
image_angle+=(34+random(1)+hit*2/5)*global.time;
if (image_angle>=360)
    image_angle-=360;
hit-=global.time;
if (hit<=0)
    {
    sprite_index=sprSuperFly;
    objSuperFG.light=0.2;
    objSuperFG.lightDim=15;
    soundplay(global.sndRecovery);
    }
}
else
{
var d,s;
if (image_angle>180)
    image_angle+=global.time;
else if (image_angle>0)
    {
    if(image_angle<=global.time)
        image_angle=0;
    else
        image_angle-=global.time;
    }
if (image_angle>=360)
    image_angle-=360;

image_speed=1;

cx=0;
cy=0;

if(able)
    {
    if (keyboard_check(vk_space))
        {
        if(setUp<1)
            {
            if(setUp<5/15)
                {
                d=random(360);
                s=32+random(32);
                instance_create(x+lengthdir_x(s,d),y+lengthdir_y(s,d),objChargeBalls);
                }
            setUp+=global.time/20;
            sprite_index=sprSuperSetup;
            if (setUp>=1)
                {
                radius=32;
                soundplay(global.sndForceBounce);
                soundloop(global.sndShield);
                sprite_index=sprSuperShield;
                }
            }
        if(setUp>=1)
            {
            setUp+=global.time/60;
            if (setUp>2)
                setUp=0;
            }
        }
    else
        {
        sprite_index=sprSuperFly;
        shieldDown();
        if(keyboard_check(vk_left))
            cx-=1;
        if(keyboard_check(vk_right))
            cx+=1;
        
        if(keyboard_check(vk_up))
            cy-=1;
        if(keyboard_check(vk_down))
            cy+=1;
        }
    }
else if (phase==0)
    {
    if (x>xs) cx=-0.5;
    if (y>ys+8) cy=-1;
    if (y<ys-8) cy=1;
    }
    
x+=cx*global.time*spd-spd*abs(cx)*global.time/2;
y+=cy*global.time*spd;

if (y>384-16)
    y=384-16;
if (x<0) x=0;
if (x>640) x=640;
if (y<0) y=0;


}
{
action_set_relative(0);
blink = !blink;
action_set_relative(1);
}
__b__ = action_if(stayBack && x>0);
if __b__
{
objSuperSonic.x-=objSuperSonic.spd*global.time*power(objSuperSonic.x/640,1/3);

}
if(stayBack==0)
    ringLoser+=global.time;
if (ringLoser>=30)
    {
    rings-=1;
    ringLoser-=30;
    if (rings<0)
        game_over();
    }
action_set_relative(0);
