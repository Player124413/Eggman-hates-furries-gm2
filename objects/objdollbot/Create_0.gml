meantimer = -90;
count = 0;
soundloop(CanYouFeelTheSunshine);
soundvolume(CanYouFeelTheSunshine,0);

soundloop(global.sndDoll);
wire[0]=id;

i=instance_create(x,y+8,objdoll);
i.p=id;
doll=i;
wire[4]=i;

i=instance_create(x,y,objwire);
i.p1=id;
i.d=8;
i.p2=doll;
middle=i;
wire[2]=i;

i=instance_create(x,y,objwire);
i.p1=id;
i.p2=middle;
wire[1]=i;

i=instance_create(x,y,objwire);
i.p1=middle;
i.p2=doll;
wire[3]=i;

nf=i;

wires=5;

global.time=0.5;
shield = 0;
atk = 0;
timer = 0;
action_set_vspeed(-3);
phase = 1;
height = 128;
size = 0;
y0 = objtdl.y;
x0 = objtdl.x;
x1 = objtdr.x;
right = 1;
subphs = 0;
floater = 1;
mood = 0;
invulnerable = 0;
life = 9;
