closeX=xx-r;
closeY=yy;
xx-=r;
i=instance_create(xx-640,yy-5120,grassline);
i.x2=xx;
i.c4=i.c3;
i.deep=yy-i.y;
i=instance_create(xx,yy,line); //LEFT LINE1
i.visible=1;
yy-=224;
i.x2=xx;
i.y2=yy+64;
lx=xx;
ly=yy;
deep=64;
a=16;
b=32;
event_user(5);
a=32;
b=32;
event_user(5);
a=32;
b=16;
event_user(5);

a=48; b=0;
event_user(5);
i=instance_create(xx,yy,line);//end
i.x2=i.x;//end
i.y2=yy+deep;//end
i.visible=1;//end

xx=lx;
yy=ly;

i=instance_create(xx,yy,line);//LEFT LINE 2
i.visible=1;
yy-=128;
i.x2=xx;
i.y2=yy;

a=112; b=-64;
event_user(1);
i.deep=224; i.c4=i.c3;
a=112; b=0;
event_user(1);
i.deep=64; i.c4=i.c3;
memY=yy;

lx=xx;
ly=yy;


xx=closeX+48;       //BOTTOM
yy=closeY;
instance_create(xx+16,yy-32,objring);
instance_create(xx+48,yy-32,objring);
xx+=192;

//i=instance_create(xx,yy-320,greatbrown2);
//i.x2=xx+64;
//i.y2=yy;
//i.c4=i.c3;
i=instance_create(xx,yy,line); //RIGHT LINE 1
i.visible=1;
yy-=256;
i.x2=xx;
i.y2=yy+64;

tempWall=instance_create(xx,yy,greatbrown2);
tempWall.c4=tempWall.c3;
tempWall.x2=xx+320;
tempWall.y2=closeY;

rx=xx;
ry=yy;

a=-96;
b=0;
deep=64;
event_user(5);
i=instance_create(xx,yy,line);//end
i.x2=i.x;//end
i.y2=yy+deep;//end
i.visible=1;//end

xx=rx;
yy=ry;
dir=0;
for (dir=10; dir<=90; dir+=10)
    {
    a=lengthdir_x(16,dir);
    b=lengthdir_y(16,dir);
    event_user(0);
    i.c4=i.c3;
    i.deep=closeY-yy;
    }

i=instance_create(xx,yy,line); //RIGHT LINE 2
i.visible=1;
yy=ly-224;
i.x2=xx;
i.y2=yy+160;

i=instance_create(xx-16,yy+128,objSpike);
i.image_angle=270;

rx=xx;
ry=yy;

deep=128;
a=-32;
b=0;
event_user(5);
i=instance_create(xx,yy,line);//end
i.x2=i.x;//end
i.y2=yy+deep;//end
i.visible=1;//end


