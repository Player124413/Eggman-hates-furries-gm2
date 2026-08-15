modelBlock=d3d_model_create();
r=24;
d3d_model_wall(modelBlock,-r,+r,0-800 ,-r,-r,0 ,1,1);
d3d_model_wall(modelBlock,-r,-r,0-800 ,+r,-r,0 ,1,1);
d3d_model_wall(modelBlock,+r,+r,0-800 ,-r,+r,0 ,1,1);
d3d_model_wall(modelBlock,+r,-r,0-800 ,+r,+r,0 ,1,1);

modelFloor=d3d_model_create();
d3d_model_floor(modelFloor,-r,+r,0 ,+r,-r,0 ,3,3);

d3d_start();
z=8;

xto=0;
yto=0;
zto=0;

dir=30;
sp=128;
d3d_set_culling(1);

a=-12;
b=-12;

while (b<=12)
    {
    while(a<=12)
        {instance_create(a*48,b*48,objGrass);
        a+=1;}
    a=-12;
    b+=1;
    }
    
with objGrass
    {dist=point_distance(x,y,0,0);
    if(dist<16*32)
        immune=0;
    else
        immune=1;    
    }
fogdist=800;
timer = 0;
phase = -1;
if (false)
    {
    phase=4;
    i=instance_create(-480,-3,objCraft);
    }
else
    {
    phase=0;
    x=-1800;
    y=0;
    z=16;
    i=instance_create(0,0,objCraft);
    
    i=instance_create(0,0,objEggRoll);
    
    i=instance_create(0,0,objSonic)
    }

subphs = 0;
action_set_alarm(3, 0);
halfblink = 0;
subby = 0;
fogcolor = make_color_rgb(128,128,128);
