action_set_relative(0);
visible = !visible;
if (y>nextY+sp)
    {
    y-=sp*global.time;
    }
if (y<nextY-sp)
    {
    y+=sp*global.time;
    }
if (abs(y-nextY)<=sp)
    {
    y=nextY;
    
    if (coolTime mod 2 == 0 && coolTime>28 && objSuperSonic.x<objSuperEgg.x-180)
        {
        i=instance_create(x,y,objSuprectile);
        soundplay(global.sndBlob);
        }
    
    coolTime-=global.time;
    if (coolTime<=0)
        {
        coolTime=34;
        if (upper && objSuperSonic.y<objSuperEgg.y-16)
            nextY=objSuperSonic.y;
        else if (!upper && objSuperSonic.y>objSuperEgg.y+16)
            nextY=objSuperSonic.y;
        else if(upper)
            nextY=16+random(objSuperEgg.y-32);
        else
            nextY=objSuperEgg.y+16+random(384-objSuperEgg.y-32);
        }
    }
var __b__;
__b__ = action_if_dice(8);
if __b__
{
{
action_set_relative(1);
action_create_object(objSparkly, -16+random(32), -16+random(32));
action_set_relative(0);
}
}
action_set_relative(0);
