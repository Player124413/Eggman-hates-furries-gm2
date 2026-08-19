if (!instance_exists(p))
    exit;

var __b__;
__b__ = action_if(p.invulnerable==0);
if __b__
{
sonic.damaged=1;
sonic.damagex=x;
sonic.damagey=y;
}
