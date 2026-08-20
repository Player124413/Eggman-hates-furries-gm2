x = __view_get( e__VW.XView, 0 );
if (!instance_exists(sonic))
{
    image_index -= (1 - global.time) * image_speed;
    x -= (1 - global.time) * hspeed;
    y -= (1 - global.time) * vspeed;
    exit;
}
var __b__;
__b__ = action_if(upTimer>0);
if __b__
{
upTimer-=global.time/15;
sonic.able=0;
sonic.physics=0;
sonic.speed=approach(sonic.speed,2,0,1);
sonic.image_angle=0;
sonic.sprite_index=sbubble;
if(upTimer<=0)
    {
    sonic.able=1;
    sonic.physics=1;
    upTimer=0;
    if (sonic.gnd!=2)
        sonic.sprite_index=sjump;
    }
}
image_index-=(1-global.time)*image_speed;
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
sonic.canSkid=1;

hspeed=(__view_get( e__VW.XView, 0 )-lastVX);
x=__view_get( e__VW.XView, 0 );
lastVX=__view_get( e__VW.XView, 0 );



if ((sonic.y>=y and yp<y) or (sonic.y<y and yp>=y))
    {
    i=instance_create(sonic.x,y,objSplash);
    soundplay(global.sndSplash);
    i.hspeed=(sonic.hspeed)*0.25;
    if (sonic.y>=y)
        sonic.speed=sonic.speed*0.75;
    else
        sonic.speed=sonic.speed*1.1;
    }
yp=sonic.y;

if (sonic.y>=y+8)
    {
    sonic.speed-=18*global.air*sonic.speed*sonic.speed*global.time;
    sonic.acc=0.2;
    sonic.jump=7;
    sonic.vspeed-=global.time*global.grav/global.meter/2.2;
    oxygenDown();//Don't place stuff involving sonic after this or else your face will die
    }
else
    {
    oxygenUp();
    sonic.jump=9;
    sonic.acc=0.25;
    //huh?
        {
        if(sonic.vspeed>=-4 && sonic.y+sonic.vspeed/2>y-20 && sonic.hspeed>15)
            {
            if(splashTimer mod 2 ==0 || splashTimer<0)
                { 
                i=instance_create(sonic.x-32+random(32),y,objSplash2);
                i.image_xscale=sonic.hspeed/64;
                i.image_yscale=i.image_xscale;
                if(splashTimer<=0)
                    splashTimer=4;
                soundfrequency(global.sndSplashStep,0.2+0.01*splashTimer)
                soundplay(global.sndSplashStep)
                }
            //if (sonic.gnd==0)
            //    soundplay(global.sndSplash);
            //normal force
            sonic.vspeed-=min(sonic.vspeed+(16-y+sonic.y)/2,(sonic.vspeed+1)/3*(sonic.hspeed-15)/(16+y-sonic.y));
            //no friction
            //sonic.y=y-16;
            sonic.ux=1;
            sonic.uy=0;
            sonic.nx=0;
            sonic.ny=-1;
            sonic.gnd=2;
            sonic.canSkid=0;
            }
        }
    }
    
splashTimer-=global.time;
__b__ = action_if(drownCounter>drownDanger);
if __b__
{
drownSeconds-=global.time/30;
}
