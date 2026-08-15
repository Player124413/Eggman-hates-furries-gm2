var __b__;
__b__ = action_if(x<__view_get( e__VW.XView, 0 )-48);
if __b__
{
action_kill_object();
}
__b__ = action_if(point_distance(x,y,doom.x,doom.y)<192+24);
if __b__
{
{
soundplay(global.sndCrush);
repeat(6)
    {
    i=instance_create(x-24+random(48),y-24+random(48),objdebris);
    i.sprite_index=srockground;
    i.rotation=-10+random(20);
    i.image_single=random(i.image_number);
    i.hspeed+=doom.hspeed;
    i.vspeed+=doom.vspeed;
    }
action_kill_object();
}
}
__b__ = action_if(point_distance(x,y,sonic.x,sonic.y)<40);
if __b__
{
sonic.damaged=1;
sonic.damagex=x;
sonic.damagey=y;
if (sonic.invulnerable==0)
    sonic.hspeed+=6;
}
