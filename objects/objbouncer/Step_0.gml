var __b__;
__b__ = action_if(on);
if __b__
{
with (sonic)
    {
    if (point_distance(x,y,other.x,other.y)<radius+other.radius+speed && other.image_single==0)
        {
        motion_set(other.image_angle,other.amount);
        sprite_index=sspjoing;
        other.image_single=1;
        other.timer=4;
        x=other.x+hspeed*3;
        y=other.y+vspeed*3;
        image_speed=1/15;
        roll=0;
        gnd=0;
        
        ux=image_xscale*hspeed/speed;
        uy=image_xscale*vspeed/speed;
        nx=uy;
        ny=-ux;
        
        soundplay(global.sndSpjoing);
        if (other.special)
            {
            with objWaterFront instance_destroy();
            with objWaterBack instance_destroy();
            instance_create(x-800,y-800,objtornado2);
            grassgenerator.phase=11;
            }
        }
    }
    
if (timer>0)
timer-=global.time;
else
image_single=0;
}
