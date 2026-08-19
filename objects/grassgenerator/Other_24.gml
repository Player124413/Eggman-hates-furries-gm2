dir=0;
len=130;
r=64;
event_user(4);

// Reliable run-up into the loop. The original pad could sit beyond a collision
// seam after conversion, so place one in the straight entrance corridor.
var loop_entry_pad = instance_create(xx - 64, yy, objBoostPad);
loop_entry_pad.amount = 48;
loop_entry_pad.image_angle = 0;

lx1=lx2;
ly1=ly2;
xx=lx2+24;
yy=ly2;
lx2=lx2+48;
ly2=ly2;

r=24;
dir=90;
len=128;
event_user(4);
i.left=0;
i.tex=background_get_texture(bgTunnelT);

len=64;
for(dir=90; dir>-90; dir-=10)
    {event_user(4); len=32;}
dir=270;
len=512;
event_user(4);

len=128;
event_user(4);
i.left=0;
i.tex=background_get_texture(bgTunnelT);
remX=lx1;
remY=ly1;

i=instance_create(xx+r,yy+32,objBoostPad);
i.image_xscale=-1;
i.amount=48;
i.image_angle=90;
i=instance_create(xx-r,yy+32,objBoostPad);
i.amount=48;
i.image_angle=270;

/*i=instance_create(xx+r,yy-384,objBoostPad);
i.image_xscale=-1;
i.amount=40;
i.image_angle=90;
i=instance_create(xx-r,yy-384,objBoostPad);
i.amount=40;
i.image_angle=270;*/


len=64;
for(dir=270; dir>90; dir-=10)
    {event_user(4); len=32;}
dir=90;
len=512;
event_user(4);
i=instance_create(xx-r,yy+48,objBoostPad);
i.image_xscale=-1;
i.amount=48;
i.image_angle=270;
i=instance_create(xx+r,yy-16,objBoostPad);
i.amount=48;
i.image_angle=90;

i=instance_create(xx-r,yy+448,objBoostPad);
i.image_xscale=-1;
i.amount=48;
i.image_angle=270;
i=instance_create(xx+r,yy+480,objBoostPad);
i.amount=48;
i.image_angle=90;


lx1=remX;
ly1=remY-128;
xx=remX;
yy=remY-48;
lx2=remX;
ly2=remY;
r=48;
len=128;
dir=0;
event_user(4);

len=remRX-xx;
event_user(4);
lx1=lx2;
ly1=ly2;
xx=lx2+64;
yy=ly2;
lx2=lx2+128;
ly2=ly2;
r=64;
len=96;
dir=90;
i=instance_create(xx-192,yy,objBubbler);
event_user(4);
i.tex=background_get_texture(bgTunnelT);
i.left=0;
i.down=1;

a=xx+r;
b=yy+56
while (b>2000)
    {
    i=instance_create(a,b,objBoostPad);
    i.amount=18;
    i.image_angle=90;
    b-=800;
    }

a=xx-r;
b=yy+56-400;
while (b>2000)
    {
    i=instance_create(a,b,objBoostPad);
    i.amount=18;
    i.image_angle=270;
    i.image_xscale=-1;
    b-=800;
    }
    
len=(yy-2000)
event_user(4);//that is all.

i=instance_create(xx-r,yy,line);
i.visible=1;
i.x2=i.x;
i.y2=i.y-2560;

xx=xx+r;
a=2560;
b=0;
event_user(0);
a=2560;
b=0;
event_user(0);
a=2560;
b=0;
event_user(0);
xmark3=xx;
a=2560;
b=0;
event_user(0);
//Pile of BOMBS
i=instance_create(xx,yy,objbouncer);
i.image_angle=45;
i.special=1;
a=2560;
b=0;
event_user(0);
i=instance_create(xx,yy,line);
i.visible=1;
i.x2=xx;
i.y2=yy+2560;

/* */
/*  */
