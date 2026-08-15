image_speed = 0.1;
timer = 0;
i1=instance_create(x-8,y,objInGameWing);
i1.hsc=-1;
i1.correction=16;

i2=instance_create(x+8,y,objInGameWing);
i2.hsc=1;
i2.correction=-16;

wingAngle=0;//-38 for dashing
phase=0;
subphs=0;
tima=0;


sp = 4;
lastVX = 0;
forceReturn = 0;
maxY = 0;
yplus = 0;
i3=instance_create(x,y,objReanAura);
i3.depth=depth+2;
i3.p=id;

up = 0;
halo = 1;
minY = 0;
accumulant = 0;
hacc = 0;
