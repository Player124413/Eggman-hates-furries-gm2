action_set_relative(1);
var __b__;
__b__ = action_if(progsp>-1);
if __b__
{
{
prog += global.time/4;
__b__ = action_if(prog>=1);
if __b__
{
{
{
action_set_relative(0);
prog = 1;
action_set_relative(1);
}
{
action_set_relative(0);
progsp = -1;
action_set_relative(1);
}
}
}
}
}
__b__ = action_if(robot.y+64>y);
if __b__
{
var h,v;
soundplay(global.sndBreakDown);
h=-32*sin(angle);
v=+32*cos(angle);
for(i=0.5; i<5.5; i+=1)
    {
    a=instance_create(x+h*((1-prog)*5+i),y+v*((1-prog)*5+i),objdebris);
    a.sprite_index=sprite_index;
    a.image_single=min(2,floor(i));
    a.image_angle=-radtodeg(angle);
    a.hspeed=robot.hspeed/(0.6+i/4);
    a.vspeed=robot.vspeed/(0.6+i/4);
    a.rotation=a.image_yscale*(1+i)*4;
    a=instance_create(x-h*((1-prog)*5+i),y-v*((1-prog)*5+i),objdebris);
    a.image_yscale=-1;
    a.sprite_index=sprite_index;
    a.image_single=min(2,floor(i));
    a.image_angle=-radtodeg(angle);
    a.hspeed=robot.hspeed/(0.6+i/4);
    a.vspeed=robot.vspeed/(0.6+i/4);
    a.rotation=a.image_yscale*(1+i)*4;
    }
    
if(instance_number(objdoormaker)==1)
    {
    robot.sequence=1;
    robot.damaged=1;
    }
    
instance_destroy();

}
action_set_relative(0);
