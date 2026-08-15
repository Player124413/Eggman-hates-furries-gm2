prog=0;
len=32;
num=8;
xx=x+32;
yy=y-32;
direction=0;
lightDir=direction-45;
h=lengthdir_x(1,direction);
v=lengthdir_y(1,direction);
phase=0;

defaultMinima=16;
minima=defaultMinima;

for(a=0; a<num; a+=1)
    {
    px[a]=x-len*a*h;
    py[a]=y-len*a*v;
    }
zuppa=1;

handProg=0;
handImg=0;
rocketTimer=0;

engineTimer=0;

for(a=0; a<3; a+=1)
    {
    tailx[a]=0;
    taily[a]=0;
    taild[a]=0;
    }
soundloop(global.sndViper);
