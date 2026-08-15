radius = 192;
open = 0;
action_create_object(objEggMid, 0, 0);
action_create_object(objDoomRack, 0, 0);
a1=instance_create(x,y,objFinalOuter);
a1.image_angle=0;
a2=instance_create(x,y,objFinalOuter);
a2.image_angle=90;
a3=instance_create(x,y,objFinalOuter);
a3.image_angle=180;
a4=instance_create(x,y,objFinalOuter);
a4.image_angle=270;

outer[0]=a1;
outer[1]=a2;
outer[2]=a3;
outer[3]=a4;


maxlife2=5;//How many hits does it take the second time?
dist = 300;
grav = 0;
bh = 0;
i1 = -1;
phase = -1;
camtimer = 0;
timer = 0;
count = 0;
invulnerable = 0;
life = 8;
rotsp = 0;
falling = 0;
lastgnd = 0;
lastspeed = 0;
lastdirection = 0;
lineDir = 0;
blink = 0;
lineDirsp = 0;
yMax = -1;
ux = 0;
uy = 1;
nx = 1;
ny = 0;
gnd = 0;
frict = 0;
