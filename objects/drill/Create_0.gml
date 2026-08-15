drillImg=0;
drillSpeed=1;
drillAngle=0;
layerAngle=180;


xx=x-64;
yy=y;

for(current=0; current<9; current+=1)
    {
    prog=current/8;
    px[current]=xx*(1-prog)+x*prog;
    py[current]=yy*(1-prog)+y*prog;
    }
current-=1;
pos=0;
prog=0;

xp=x;
yp=y;
dir=0;
sp=0;

xp=x;
yp=y;

lx=x;
ly=y-48;
rx=x;
ry=y+48;

lastRight=-2;//-2 means valid but nonexistent. 
lastLeft=-2;//this makes much sense, no?
action_create_object(objCaveDrawer, 0, 0);
closeX = 0;
radius=48;
frict=1;

blink=0;
timer=0;
timer2=0;
counter=0;
phase=0;
subphs=0;

shield=1;
invulnerable=0;
damaged=0;

eightstage=0;
stableCycle=0;

lavaImg=0;
lavaTex=sprite_get_texture(sprCloser,lavaImg);
lavaCol=make_color_rgb(255,134,0);
on = 1;
vol = 0;
destined = 0;
layerPlus = 0;
damageCounter = 0;
remX = -1;
signal = 0;
precision = 48;
respawn = 0;
closeProggy = 0;
warning = 0;
closeS = 80;
lastTri = -1;
layerExists = 1;
coreSprite = sprcore;
shieldWarn = 0;
dead = 0;
