var __b__;
__b__ = action_if(point_distance(x,y,objSuperSonic.x,objSuperSonic.y)<160+16 && abs(x-objSuperSonic.x)<130);
if __b__
{
superHit();
}
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

image_index-=(1-global.time)*image_speed;

x-=objSuperEgg.spd*global.time;
