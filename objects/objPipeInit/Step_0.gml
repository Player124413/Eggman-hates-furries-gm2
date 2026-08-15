var __b__;
__b__ = action_if(instance_exists(sonic));
if __b__
{
if(point_distance(x-16,y+16,sonic.x,sonic.y)<4+sonic.speed && sonic.gnd>0)
    {    
    i=instance_create(x-16,y+16,objPipeFollower);
    i.pp=id;
    i.rings=sonic.rings;
    if (!sonic.roll)
        soundplay(global.sndRoll);
    with sonic
        instance_destroy();
    if (special)
        controlbg.lev=5;//OH YEAH
    }
}
