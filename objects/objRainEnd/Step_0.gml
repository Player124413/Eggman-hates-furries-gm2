var __b__;
__b__ = action_if(rain>0);
if __b__
{
if(random(1)<rain)
    {
    xx=objSonicEnd1.x-96+random(192);
    yy=objSonicEnd1.y-240-random(70);
    if(position_meeting(xx,yy,objSonicEnd1))
        {
        i=instance_create(xx,yy,objRainHit);
        i.depth=-4;
        i.image_xscale=0.5+random(0.5);
        i.image_yscale=i.image_xscale;
        if (random(2)<1)
            i.image_xscale=-i.image_xscale;
        }
    }
if(random(1)<rain)
    {
    xx=objTailsEnd1.x-140+random(280);
    yy=objTailsEnd1.y-16-random(64);
    if(position_meeting(xx,yy,objTailsEnd1))
        {
        i=instance_create(xx,yy,objRainHit);
        i.depth=-4;
        i.image_xscale=0.5+random(0.5);
        i.image_yscale=i.image_xscale;
        if (random(2)<1)
            i.image_xscale=-i.image_xscale;
        }
    }
}
