var h,v,d;
d=image_angle+45+random(90);
image_index-=(1-global.time)*image_speed;
h=lengthdir_x(8,d);
v=lengthdir_y(8,d);
bubbleTimer+=global.time;
if (bubbleTimer>=150)
    {
    bubbleTimer=0;
    i=instance_create(x+h,y+v,objBubble);
    i.targetSize=1;
    }
else if (bubbleTimer mod 30 == 0)
    {
    i=instance_create(x+h,y+v,objBubble);
    }

