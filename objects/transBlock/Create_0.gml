yskew = 0;
width = 64;
if(instance_exists(sonails))
    {
    i=instance_create(x,y,uline);
    i.y2=y+yskew;
    i.x2=x+width;
    i.pp=id;
    i.doomable=false;
    }
else
    i = noone;
c1=make_color_rgb(8,96,24);
c2=make_color_rgb(16,160,64);

ct=make_color_rgb(72,47,57);
cb=make_color_rgb(0,0,0);

RH=true;
LH=true;

tex=background_get_texture(bgChequer);
active = 0;
timer = 0;
report = 0;
height = 32;
ssp = 3;
fragile = true;
l=0;
r=1;
t=0;
b=1;
on = 0;
