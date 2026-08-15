xx=x;
yy=y;
a=0;
b=0;


a=64;
b=0;
for(a=0.2; a<1; a+=0.2)
    {
    event_user(0);
    i.c4=merge_color(i.c4,i.c3,a);
    }

xmark1=xx+640;
ymark1=yy-800;

for(f=0; f<60; f+=1)
    {
    a=256;
    b=lengthdir_y(56,21*f);
    event_user(0);
    }

xmark2=xx-960;
    
rx0=xx;
ry0=yy;

xx+=192;

rx1=xx;
ry1=yy;

//
//sonic.x=xx-640;
//sonic.y=yy-16;
//

for(f=0; f<8; f+=1)
    {
    a=lengthdir_x(64,11.25*f);
    b=lengthdir_y(64,11.25*f);
    event_user(0);
    }
remLX=i.x2;
remMY=i.y2;
remDY=i.y2+i.deep;

remRX=remLX+960;
j=instance_create(xx,yy,greatbrown2);//Upper wall
j.x2=remRX;
j.y2=yy-2560;
j.c4=j.c3;
j=instance_create(xx,yy,greatbrown2);//lower wall
j.x2=remRX+128;
j.y2=yy+i.deep;
j.depth=10;

for(f=0; f<16; f+=1)
    {
    a=lengthdir_x(48,90+11.25*f);
    b=lengthdir_y(48,90+11.25*f);
    event_user(1);
    i.c4=i.c3;
    }
    
a=-128;
b=0;
event_user(1);
i.c4=i.c3;
i=instance_create(xx,yy,line);
i.x2=xx;
i.y2=yy-1280;
i.visible=1;

i=instance_create(rx0,ry0,greatbrown2);
i.x2=rx1;
i.y2=ry1+2560;
i.depth=10;

xx=(rx0+rx1)/2;//BEGIN TUNNELING
yy=ry0;

lx1=rx1;
ly1=yy;
lx2=rx0;
ly2=yy;

r=72;
len=objWaterFront.y-yy;
dir=270;
event_user(4);
i.tex=background_get_texture(bgTunnelHR);
r=64;
len=96;
dir+=5;
event_user(4);
i.tex=background_get_texture(bgTunnelHR);
r=48;
dir+=5;
event_user(4);
r=32;
dir-=5;
event_user(4);
r=24;
dir-=5;
event_user(4);
event_user(4);
len=32;
r=32;
event_user(4);
lx1=lx2;
ly1=ly2;
xx=lx2;
yy=ly2+64;
lx2=lx2;
ly2=ly2+128;

len=64;
r=64;
dir=0;

event_user(4);
i.down=1;
i.left=0;
i.tex=background_get_texture(bgTunnelT);
len=130;
i=instance_create(lx2+48,ly2,objBubbler);
event_user(4);
