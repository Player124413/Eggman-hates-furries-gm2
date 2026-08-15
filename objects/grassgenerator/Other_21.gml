//with (tempWall)//This will happen in 1 frame because grasslines take 1 step to appear.
//    instance_destroy();//Thus this created a hole for 1 frame. It wasn't nice.

xx=lx;
yy=ly;

i=instance_create(xx,yy,line);//LEFT LINE 3
i.visible=1;
yy=ry;
i.x2=xx;
i.y2=yy;

a=4; b=-16;
event_user(1);i.deep=64; i.c4=i.c3;
a=8; b=-16;
event_user(1);i.deep=64; i.c4=i.c3;
a=12; b=-12;
event_user(1);i.deep=64; i.c4=i.c3;
a=16; b=-8;
event_user(1);i.deep=64; i.c4=i.c3;
a=16; b=-4;
event_user(1);i.deep=64; i.c4=i.c3;
a=8; b=0;//total 64.
event_user(1);i.deep=64; i.c4=i.c3;

i=instance_create(xx,yy,line);
i.visible=1;
yy-=64;
i.x2=xx;
i.y2=yy;

i=instance_create(lx,yy,grassline); i.c4=i.c3;
i.deep=64;
i.x2=xx;
i.y2=i.y;

xx=lx;

instance_create(xx+28,yy,objSandRock);
i=instance_create(xx+28,yy-46,objbouncer);
i.image_angle=90;
i.amount=18;

lx=xx;
ly=yy;

xx=rx;
yy=ry;

a=64;
b=0;
event_user(0);
i.c4=i.c3;
i.deep=closeY-yy;

dir=0;
for (dir=10; dir<=90; dir+=10)
    {
    a=lengthdir_x(18,dir);
    b=lengthdir_y(18,dir);
    event_user(0);
    i.c4=i.c3;
    i.deep=closeY-yy;
    }

rx=xx;//memory thing
memX2=xx;

for (dir=100; dir<=130; dir+=10)
    {
    a=lengthdir_x(18,dir);
    b=lengthdir_y(18,dir);
    event_user(1);
    i.c4=i.c3;
    i.deep=194;
    }
i=instance_create(xx,yy,line);//RIGHT LINE 3
i.visible=1;
yy-=352;
i.x2=xx;
i.y2=yy;
a=rx-xx;
b=0;
event_user(0);
i.c4=i.c3;
i.deep=256;
//a=64; b=0;
//event_user(0);
//i.c4=i.c3;
//i.deep=closeY-yy;;

rx=xx;
ry=yy;

xx=lx;
yy=ly;

i=instance_create(xx,yy,line);//LEFT LINE 4
i.visible=1;
yy-=224;
i.x2=xx;
i.y2=yy;

for (dir=140; dir>=90; dir-=10)
    {
    a=lengthdir_x(28,dir);
    b=lengthdir_y(28,dir);
    event_user(0);
    i.c4=i.c3;
    i.deep=memY-yy-32;
    }
memX=xx;//memory thing
for (dir=80; dir>=50; dir-=10)
    {
    a=lengthdir_x(28,dir);
    b=lengthdir_y(28,dir);
    event_user(1);
    i.c4=i.c3;
    i.deep=196;
    }
i=instance_create(xx,yy,objbouncer);
i.image_angle=0;
i.amount=24;

i=instance_create(xx,yy,line);//LEFT LINE 5
i.visible=1;
yy-=160;
i.x2=xx;
i.y2=yy+64;

lx=xx;
ly=yy;

xx=rx;
yy=ry;

for (dir=10; dir<=70; dir+=10)
    {
    a=lengthdir_x(48,dir);
    b=lengthdir_y(48,dir);
    event_user(0);
    i.c4=i.c3;
    i.deep=256;
    }
    
i=instance_create(memX2,ry,greatbrown2);
i.x2=xx;
i.y2=closeY;
i.c4=i.c3;
memX2=xx;

//a=96;       //right angle place
//b=-96;
//event_user(0);
//i.c4=i.c3;
//i.deep=closeY-yy;
i=instance_create(xx,yy,line);
i.visible=1;
yy-=64;
i.x2=xx;
i.y2=yy;


a=-320;
b=-320;
event_user(1);
i.c4=i.c3;
i.deep=320;
memY2=yy;

rx=xx;
ry=yy;

xx=lx;
yy=ly;
deep=64;

a=rx-xx;
b=0;
event_user(5);
a=96;
b=32;
event_user(5);
i=instance_create(xx,yy,line);//end
i.x2=i.x;//end
i.y2=yy+deep;//end
i.visible=1;//end

xx=lx;
yy=ly;
i=instance_create(xx,yy,line);//LEFT LINE 6
i.visible=1;
yy-=64;
i.x2=xx;
i.y2=yy;

a=memX-xx;
b=0;
event_user(0);
i.c4=i.c3;
i.deep=128;
a=closeX-xx;
b=0;
event_user(0);
i.c4=i.c3;
i.deep=memY-yy;

instance_create(xx+25,yy,objSandRock);
i=instance_create(xx+80,yy,objbouncer);
i.image_angle=90;
i.amount=30;

i=instance_create(xx,yy,line);//LEFT LINE 7(LAST)
i.visible=1;
yy-=2560;
i.x2=xx;
i.y2=yy;

lx=xx;
//ly=yy;//new position is garbage and unreachable

xx=rx;
yy=ry;

i=instance_create(xx,yy,line);//RIGHT LINE 4
i.visible=1;
yy-=480;
i.x2=xx;
i.y2=yy;

a=lx+128-xx;
b=-128;
event_user(1);
i.c4=i.c3;
i.deep=128;

i=instance_create(xx,yy,line);//RIGHT LINE 5(LAST)
i.visible=1;
yy-=128;
i.x2=xx;
i.y2=yy;

a=rx-xx; b=0;
event_user(0);
i.c4=i.c3;
i.deep=128;

a=memX2-xx; b=0;
event_user(0);
i.c4=i.c3;
i.deep=memY2-yy;

a=128; b=-32;
event_user(0);
i.c4=i.c3;
i.deep=closeY-yy;

a=128; b=-64;
event_user(0);
i.c4=i.c3;
i.deep=closeY-yy;

a=128; b=-32;
event_user(0);
i.c4=i.c3;
i.deep=closeY-yy;
a=640; b=0;
event_user(0);
i.depth=-11;
i.c4=i.c3;
i.deep=closeY-yy;
drillX=xx;
drillY=yy;

instance_create(xx-208,yy,objSandRock);
