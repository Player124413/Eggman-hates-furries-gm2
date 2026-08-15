var __b__;
__b__ = action_if(invulnerable==0 && sonic.damaged==0);
if __b__
{
if(other.sprite_index==sjump)
    {
    soundplay(global.sndCrash);
    life-=1;
    if (life<=0)
        {
        soundplay(global.sndBreakDown);
        instance_create(x,y,objmedexp);
        }
    invulnerable=60;
    with other
        motion_add(point_direction(other.x,other.y,x,y),8);
    }
else
    {sonic.damaged=1;
    sonic.damagex=x;
    sonic.damagey=y;}
}
