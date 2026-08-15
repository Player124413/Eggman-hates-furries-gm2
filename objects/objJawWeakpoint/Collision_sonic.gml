var __b__;
__b__ = action_if(chopper.invulnerable==0 && sonic.damaged==0 && chopper.phase==2);
if __b__
{
if(other.sprite_index==sjump)
    {
    instance_create(x,y,objmedexp);
    with chopper
        event_user(0);
    }
else
    {sonic.damaged=1;
    sonic.damagex=x;
    sonic.damagey=y;}
}
