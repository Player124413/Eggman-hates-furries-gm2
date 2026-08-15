phase = 0;
timer = 0;
xx=0;
yy=320;
sx=xx;
sy=yy;
a=0;
b=0;

i=instance_create(xx-480,yy-1280,greatbrown);
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
xx-=128;

yy=yy-1280-1280;
i=instance_create(xx-2560,yy,grassline);
i.deep=1280;
i.x2=xx;
i.y2=i.y;

edge=instance_create(xx+96,yy,objSceneryStatic);
edge.sprite_index=sprGrassEdge;
edge.depth=-4;
i=instance_create(xx,yy,transBlock);
i.height=64;
i.depth=-3;
i.ssp=0.5;
i.ct=make_color_rgb(64,16,0);
i.cb=merge_color(i.ct,c_black,i.height/1280);
i.c1=make_color_rgb(16,142,0);
i.c2=i.c1;
i.LH=false;
i.width=96;
fragile=i;
i=instance_create(xx,yy,line);
i.x2=xx+96;
i.y2=i.y;
fragileLine=i;
view_xview=-650;
view_yview=yy-240;
instance_create(xx-330,yy-16,sonic);
sonic.able=0;
bling = 0;
