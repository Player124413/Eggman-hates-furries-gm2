r = 10;
z = 24;
xrot=0;
yrot=0;
zrot=0;
gunrot = 0;
gunblink = 0;
blink = 0;
engine = 1;
modelBall=d3d_model_create();
modelWing=d3d_model_create();

d3d_model_ellipsoid(modelBall,-1,-1,-1 ,1,1,1, 2,1 ,16);


t=background_get_texture(bgWing);
for(a=0; a<1/r; a+=0.05/r)
    {d3d_model_floor(modelWing,-2,0,-a ,1,2,-a ,1,1);
    d3d_model_floor(modelWing,-2,0,-a ,1,-2,-a ,1,1);}
