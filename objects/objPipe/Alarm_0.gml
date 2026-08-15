a=instance_nearest(x+24,y,object_index);
b=instance_nearest(x,y-24,object_index);
c=instance_nearest(x-24,y,object_index);
d=instance_nearest(x,y+24,object_index);

if (b==id && c==id)
    image_single=2;
if (b==id && a==id)
    image_single=3;
if (d==id && c==id)
    image_single=4;
if (d==id && a==id)
    image_single=5;
    
if (a==id && c==id)
    image_single=0;
if (b==id && d==id)
    image_single=1;

if(image_single==0 && b==id)
    image_single=6;
if(image_single==1 && a==id)
    image_single=9;
    
if(image_single==0 && (y div 32) mod 4 ==0)
    image_single=7;
if(image_single==1 && (x div 32) mod 4 ==0)
    image_single=8;

if (image_single>=7)
    {i=instance_create(x,y,objStatic);
    i.sprite_index=sprite_index;
    i.image_single=image_single;
    i.depth=depth+2;}

