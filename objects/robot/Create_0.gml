remAcc=sonic.acc;
sonic.acc=0.32;
radius = 48;
image_angle = 270;
reye=1;
leye=1;
soundstop(global.sndWind);
soundloop(global.sndShaft);
sonic.windsound=global.sndShaft;
soundloop(global.sndRobot);

eightstage=0;
blink=0;

base=80;
ext=56;
arm=60;

sawimg=0;

platform=0;
plat_tip=0;

boost=1;
lastboost=1;
biglazor=0;
phase=0;

damaged=0;
destroyed=-1;//last item destroyed;

faps=0;
baps=0;

lastfaps=0;
lastbaps=0;


rotsp=1;

ps=1;
ps1=image_angle+225;
ps2=image_angle;
ms=1;
ms1=image_angle-225;
ms2=image_angle;
ph=1;
ph1=image_angle+225;
ph2=image_angle;
mh=1;
mh1=image_angle-225;
mh2=image_angle;


gps1=image_angle+225;
gps2=image_angle;

gms1=image_angle-225;
gms2=image_angle;

gph1=image_angle+225;
gph2=image_angle;

gmh1=image_angle-225;
gmh2=image_angle;

lgx=0;
lgy=0;

rgx=0;
rgy=0;

lastnnx=0;
lastnny=0;

bosul1=instance_create(0,0,movingline);
bosul2=instance_create(0,0,movingline);
bosul3=instance_create(0,0,movingline);

bosul4=instance_create(0,0,movingline);
bosul4.special=1;//use this to destroy robot eyes
bosul5=instance_create(0,0,movingline);
bosul6=instance_create(0,0,movingline);

bosuc=instance_create(0,0,movingball);
bosuc.radius=radius;
psx1=0;
psy1=0;

msx1=0;
msy1=0;

phx1=0;
phy1=0;

mhx1=0;
mhy1=0;

psx0=0;
psy0=0;

msx0=0;
msy0=0;

phx0=0;
phy0=0;

mhx0=0;
mhy0=0;
atk = -1;
action_set_alarm(120/global.time, 0);
timer = 0;
lasthspeed = 0;
lastvspeed = 0;
objectfg.flashlight = 1;
counter = -1;
advance = 64;
chargewave = 0;
chargeur = 0;
sequence = 0;
finalcount = 0;
sparetimer = 0;
assessment = 0;
dangerousBlades = 1;
spawnKillTimer = 0;
ux = 0;
uy = 1;
nx = 1;
ny = 0;
gnd = 0;
frict = 0;
