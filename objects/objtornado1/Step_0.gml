tailsBlink+=global.time;
if (tailsBlink>=2)
    tailsBlink=0;


if (x<grassgenerator.xmark2)
    {
    if(y>ystart-96)
        {
        dir=dir*(1-global.time)+(dir*24/25)*global.time;
        if(dir>-1)
            sp=(sp*9+max(sonic.hspeed+(sonic.x-x)/30,20))/10;
        }
    else
        sp=(sp*29+32)/30;
    }
else
    {
    dir+=global.time*2;
    sp=(sp*49+32)/50;
    if(dir>90 && y<ystart-1280)
    instance_destroy();
    }

image_angle = dir;
x+=lengthdir_x(sp*global.time,dir);
y+=lengthdir_y(sp*global.time,dir);
