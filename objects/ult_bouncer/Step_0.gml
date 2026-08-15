var __b__;
__b__ = action_if(on);
if __b__
{
with (sonails)
    {
    if (point_distance(x,y,other.x,other.y)<radius+other.radius+speed && other.image_single==0)
        {
        motion_set(other.image_angle,other.amount);
        hspeed+=other.hspeed;
        vspeed+=other.vspeed;
        other.image_single=1;
        other.timer=4;
        x=other.x+hspeed*3;
        y=other.y+vspeed*3;
        
        standTime=0;
        gnd=0;
        
        ux=image_xscale*hspeed/speed;
        uy=image_xscale*vspeed/speed;
        nx=-uy;
        ny=-ux;
        
        soundplay(global.sndSpjoing);
        }
    }
    
if (timer>0)
timer-=global.time;
else
image_single=0;
}
__b__ = action_if(stick>-1);
if __b__
{
if(instance_exists(stick))
    {
    if(lx!=-1)
        {
        x+=stick.x-lx;
        y+=stick.y-ly;
        }
    lx=stick.x;
    ly=stick.y;
    }
else
    {
    vspeed+=sonails.g*global.time;
    if(y>__view_get( e__VW.YView, 0 )+800)
        {
        instance_destroy();
        }
    }
}
