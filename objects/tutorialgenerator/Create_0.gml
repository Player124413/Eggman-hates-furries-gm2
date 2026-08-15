global.handle=SS_LoadSound("Dass.ogg");
soundloop(global.handle);



xss=0;
hss=0.1;

yss=0;
vss=-0.05;

xmax=1; 
a=0;
nu=4;
repeat(nu)
{__view_set( e__VW.Visible, a, 1 )
xv[a]=0;
yv[a]=a*480/nu;
vh[a]=480/nu;
__view_set( e__VW.YView, a, a*480/nu );
__view_set( e__VW.HView, a, 480/nu );
__view_set( e__VW.HPort, a, 480/nu );
__view_set( e__VW.YPort, a, a*480/nu );
a+=1;}
phase = -1;
global.gameWantsControls = 1;
ws = 0;
action_set_alarm(60, 0);
cs = 0;
wiggle = 0;
var __b__;
__b__ = action_if(1);
if __b__
{
sonic.specialStopCase=1;
trigger=0;

i=instance_create(0,0,objDreamCircle);
i.steps=32;
i.radius=240;
sonic.x=i.x;
sonic.y=i.y+i.radius-16;

hue=0;

__background_set_colour( c_black );
for(a=0; a<360; a+=60)
    {
    instance_create(lengthdir_x(224,a),lengthdir_y(224,a),objring);
    }
for(a=45; a<405; a+=90)
    {
    instance_create(lengthdir_x(160,a),lengthdir_y(160,a),objring);
    }
xx=0;
yy=0;
}
else
{
sonic.specialStopCase=1;
trigger=1;
timer=0;
phase=5;

i=instance_create(0,0,objDreamCircle);
event_user(0);
i.steps=64;
i.radius=320;
sonic.x=i.x;
sonic.y=i.y+i.radius-16;

hue=0;

__background_set_colour( c_black );
xx=-320;
yy=-320;
}
lst = -1;
mogusTimer = 0;
dir = 0;
