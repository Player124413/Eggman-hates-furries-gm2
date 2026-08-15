action_set_relative(1);
var __b__;
__b__ = action_if(progsp>-1);
if __b__
{
{
prog += closesp*global.time/10;
__b__ = action_if(abs(prog)>=(sign(closesp)+1)/2);
if __b__
{
{
{
action_set_relative(0);
prog = (sign(closesp)+1)/2;
action_set_relative(1);
}
soundplay(global.sndClank);
if(closesp<0)
    {
    with i1
        instance_destroy();
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
__b__ = action_if(abs(report)>maxforce && maxforce!=-1);
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
    a.hspeed=-report/(0.6+i/4);
    a.vspeed=-i;
    a.rotation=a.image_yscale*(1+i)*4;
    a=instance_create(x-h*((1-prog)*5+i),y-v*((1-prog)*5+i),objdebris);
    a.image_yscale=-1;
    a.sprite_index=sprite_index;
    a.image_single=min(2,floor(i));
    a.image_angle=-radtodeg(angle);
    a.hspeed=-report/(0.6+i/4);
    a.vspeed=-i;
    a.rotation=a.image_yscale*(1+i)*4;
    }
    
sonic.hspeed=abs(report)-4;
//with (sonic)
//    startroll();

with i1
    instance_destroy();
with objassessment
    instance_destroy();        
instance_destroy();

}
action_set_relative(0);
