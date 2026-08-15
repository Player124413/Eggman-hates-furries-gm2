image_index-=(1-global.time)*image_speed;
image_blend=make_color_hsv(255-tutorialgenerator.hue,255,255);
image_angle=angle;
var __b__;
__b__ = action_if(active==0);
if __b__
{
active=1;
h=cos(degtorad(angle));
v=-sin(degtorad(angle));
h2=cos(degtorad(angle+90));
v2=-sin(degtorad(angle+90));
//show_message("Drx"+string(+16*h-64*h2)+"Dry"+string(+16*v-64*v2)+"h2"+string(h2)+"v2"+string(v2))

i1=instance_create(x-16*h-64*h2,y-16*v-64*v2,reportingline);
i1.pp=id;
i1.x2=x-16*h+64*h2;
i1.y2=y-16*v+64*v2;

i2=instance_create(x+16*h+64*h2,y+16*v+64*v2,reportingline);
i2.pp=id;
i2.x2=x+16*h-64*h2;
i2.y2=y+16*v-64*v2;

//Both order and depth is important.
}
__b__ = action_if((abs(report)>maxforce && maxforce!=-1 && cos(degtorad(angle-point_direction(x,y,sonic.x,sonic.y)))<0) || (report2<0));
if __b__
{
var h,v;
soundplay(global.sndRecovery);
objectfg.flashlight=1;
//(stars?)
    
sonic.speed=max(0,abs(report)-8);
sonic.direction=angle;
sonic.x+=lengthdir_x(64,angle);
sonic.y+=lengthdir_y(64,angle);
report=0;
}
report2 = 0;
