var player = instance_find(sonic, 0);
if (instance_exists(player))
    player.able = 1;
xx=0;
yy=320;
a=0;
b=0;

i=instance_create(xx-480,yy-1280,greatbrown2);
i.c3=c_black;
i.x2=xx;
i.y2=yy;
i.depth=4;
i=instance_create(xx,yy,line);
i.visible=1;
i.x2=i.x;
i.y2=yy-1280;

xx-=480;
a=480;
b=0;
event_user(0);

a=128;
b=0;
event_user(0);

for(f=0; f<10; f+=1)
    {
    a=256;
    b=960/(f+1);
    event_user(0);
    }
a=128;
b=0;
i=instance_create(xx-960,yy,sandline);
i.x2=xx+a;
i.y2=yy+b;
firstSand=i;
correctX=xx;
xx+=a;
yy+=b;

i=instance_create(xx-32,yy,objBoostPad);
i.amount=42;

instance_create(xx-48,yy-24,objring);
instance_create(xx-32,yy-24,objring);
instance_create(xx-16,yy-24,objring);

a=128;
b=32;
event_user(2);
a=64;
b=0;
event_user(2);
a=64;
b=16;
event_user(2);
a=96;
b=64;
event_user(2);
a=128;
b=96;
event_user(2);
a=64;
b=80;
event_user(2);
a=48;
b=320;
event_user(2);
phase = 0;
action_create_object(objWaterFront, 0, 0);
timer = 0;
win = 0;
stufu = 0;
panjanRespawned = false;
