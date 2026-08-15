speed-=0.6*global.air*speed*speed*global.time;

x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
var __b__;
__b__ = action_if(y<__view_get( e__VW.YView, 0 )-640 || y>__view_get( e__VW.YView, 0 )+1280);
if __b__
{
action_kill_object();
}
__b__ = action_if(gnd==2);
if __b__
{
{
action_kill_object();

i=instance_create(x,y,objmedexp);
i.hspeed=hspeed/1.5;
i.vspeed=vspeed/1.5;
i.friction=0.1;
soundplay(global.sndExplosion);
}
}
__b__ = action_if(point_distance(x,y,sonic.x,sonic.y)<radius+sonic.radius);
if __b__
{
{
action_kill_object();

i=instance_create(x,y,objmedexp);
i.hspeed=hspeed/1.5;
i.vspeed=vspeed/1.5;
i.friction=0.1;
soundplay(global.sndExplosion);
sonic.damagex=x;
sonic.damagey=y;
sonic.damaged=1;
}
}
