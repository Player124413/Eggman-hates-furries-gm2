action_set_relative(0);
var __b__;
__b__ = action_if(phase==0);
if __b__
{
{
size = approach(size,400,maxSize,1);
{
action_set_relative(1);
timer += global.time;
action_set_relative(0);
}
{
action_set_relative(1);
maxSize += global.time;
action_set_relative(0);
}
if(myRings>1)
    myRings-=global.time/30;
else
    myRings=1;
if (size<240 && random(30)<global.time)
    {
    soundplay(global.sndGunstar1);
    instance_create(x-size+random(2*size),y-size+random(2*size),objmedexp);
    }

c=min(1,size/640);
soundvolume(global.sndUltima,1-power(1-c,3));
soundvolume(global.handle,1-power(c,3));
soundvolume(global.sndBreakDown,1-power(c,3));
if (size>400)
    {
    global.time=0.25;
    //if(uctrl.shakeInt<8)
    //    uctrl.shakeInt+=0.1;
    whiteTimer+=1;
    if (whiteTimer>5+random(75))//Weird but ok
        {
        soundplay(global.sndWhitenoise);
        ufore.whiteNoise=4;
        whiteTimer=0;
        }
    }
if (size>480)
    {
    soundstop(global.sndWhitenoise);
    soundstop(global.sndUltima);
    soundstop(global.handle);
    soundstop(global.sndQuake);
    ufore.whiteNoise=0;
    ufore.light=1;
    phase=1;
    myRings=0;
    objRean.halo=0;
    global.time=0;//z0mg!!!
    timer=0;
    with objRean
        {
        h=cos(degtorad(image_angle+90));
        v=-sin(degtorad(image_angle+90));
        c=30+2*cos(timer*pi/30);
        instance_create(x+h*c,y+v*c,objHaloBreak);
        }
    }
}
}
__b__ = action_if(phase==1);
if __b__
{
//Time-free zone
if (timer==1)
    ufore.light=0.5;
if (timer>1)
    ufore.light=0;
uctrl.shaking=0;
uctrl.shakeInt=2;
if (timer <300 && timer mod 30 == 0)
    {
    soundplay(global.sndBlth);
    soundvolume(global.sndBlth,1-power(timer/300,2));
    soundplay(global.sndBreakDown);
    soundvolume(global.sndBreakDown,1-power(timer/300,2));
    }

timer+=1;

if (timer>390)
    {
    with (objRean)
        {
        instance_create(x,y,objNormalEggFall);
        instance_destroy();
        }
    uctrl.phase=16;
    uctrl.trigger=0;
    sonails.able=0;
    global.time=0.5;
    instance_destroy();
    }
}
action_set_relative(0);
