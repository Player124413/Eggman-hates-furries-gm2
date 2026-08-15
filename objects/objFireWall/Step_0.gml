var __b__;
__b__ = action_if(sonic.x>x-40 && sonic.x<x+40 && sonic.y>y-72);
if __b__
{
game_over();//this is autodeath fire
}
image_index+=global.time*imgsp;
if (image_index<0)
    image_index+=image_number;
if (image_index>=image_number)
    image_index-=image_number;
    
if (x<__view_get( e__VW.XView, 0 )-960)
    instance_destroy();
