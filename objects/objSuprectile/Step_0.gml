x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

image_index-=(1-global.time)*image_speed;
var __b__;
__b__ = action_if(x<-32);
if __b__
{
action_kill_object();
}
__b__ = action_if(point_distance(x,y,objSuperSonic.x,objSuperSonic.y)<radius+objSuperSonic.radius);
if __b__
{
superHit();
instance_destroy();
soundplay(global.sndExplosion);
i=instance_create(x,y,objSuperExplosion);
}
