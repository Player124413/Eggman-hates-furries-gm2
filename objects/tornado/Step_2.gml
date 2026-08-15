var __b__;
__b__ = action_if(phase==3);
if __b__
{
//hit the bot
var k;
if (subphs==1)
    {
    k=384;
    if (y<objWaterFront.y-240)
        subphs=2;
    }
else if (subphs==2)
    {
    k=-96;
    
    if(y+24>panjan.bot1.y)
        {
        subphs=0;
        if(panjan.bot1.x>x-96 && panjan.bot1.x<x+36)
            {
            direction+=4;
            panjan.bot1.shield=0;
            panjan.bot1.shieldTimer=90;
            panjan.bot1.vspeed+=5;
            i=instance_create(0,0,objBotShieldFail);
            i.p=panjan.bot1;
            soundplay(global.sndBlth);
            repeat(12)
                {
                i=instance_create(panjan.bot1.x-16+random(32),panjan.bot1.y-8-random(16),objspark);
                i.hspeed=hspeed-8+random(16);
                i.vspeed=-3+random(6);
                }
            a=floor(random(3));
            if(a==0)
                soundplay(global.sndMetal1);
            if(a==1)
                soundplay(global.sndMetal2);
            if(a==2)
                soundplay(global.sndMetal3);
            }
        }
    }
else
    k=212;
vspeed=(vspeed*39+global.time*(limitize(objWaterFront.y-k-y-vspeed*14,8)))/(39+global.time);
}
