mc=30;
x=320;
y=120;
background_color=c_black;

i=instance_create(x+128,y+224,objFirePlace);
i.burning=0;

i=instance_create(x+16,y+224,danceStatic) i.sprite_index=sprStool;
i=instance_create(x+48,y+224,danceStatic) i.sprite_index=sprTable;
i=instance_create(x+64,y+224,danceStatic) i.sprite_index=sprStool;

i=instance_create(x+176,y+96,danceStatic) i.sprite_index=sprBooks;
i=instance_create(x+256,y+224,danceStatic) i.sprite_index=sprRadio;

for(yy=y; yy<y+192; yy+=32)
    {i=instance_create(x+112,yy,danceStatic) i.sprite_index=sprStovePipe;}
    
view_xview=-256;
view_yview=128;

i=instance_create(x+320+32,y+224,danceStatic) i.sprite_index=sprOpenDoor;


i=instance_create(x-96,y+224,danceStatic) i.sprite_index=sprBed;
sonic.x=i.x;
sonic.y=i.y-15;
sonic.able=0;
sonic.physics=0;
sonic.image_speed=0;
sonic.image_index=0;
sonic.sprite_index=sbed;
i=instance_create(x-96-56,y+224-40,danceStatic) i.sprite_index=sprLamp;
i=instance_create(x-96-56,y+224-80,danceStatic) i.sprite_index=sprLamp;

objectfg.flashlight=1;
//floor,roof
i=instance_create(x-128-32,y+224,line);
i.x2=x+320+32;
i.y2=i.y;
i=instance_create(x-128-32,y,line);
i.x2=x+320;
i.y2=i.y;
//the rest
i=instance_create(x-128-32,y,line);
i.x2=i.x;
i.y2=y+224;
i=instance_create(x+320,y,line);
i.x2=i.x;
i.y2=y+224-64;
//(DOOR:)
i=instance_create(x+320,y+224-64,line);
i.x2=x+320+32;
i.y2=i.y;
i=instance_create(x+320+32,y+224-64,line);
i.x2=i.x;
i.y2=y-640;

i=instance_create(x-32,y,line);
i.x2=i.x;
i.y2=y+160;
i=instance_create(x,y,line);
i.x2=i.x;
i.y2=y+160;
i=instance_create(x-32,y+160,line);
i.x2=x;
i.y2=i.y;

nx=x+320+32;
ny=y+224;

i=instance_create(nx,ny,grassline);
nx+=32;
i.x2=nx;
i.y2=ny;
i=instance_create(nx,ny,grassline);
nx+=80;
ny+=16;
i.x2=nx;
i.y2=ny;
i=instance_create(nx,ny,grassline);
nx+=48;
ny-=8;
i.x2=nx;
i.y2=ny;
i=instance_create(nx,ny,grassline);
j=instance_create(nx+64,ny,objSceneryStatic); j.sprite_index=sprBush1;
j.depth=4;
nx+=640;
i.x2=nx;
i.y2=ny;

with danceStatic
    depth+=4;
with objFirePlace
    depth+=4;
    
instance_create(nx-320,ny,objTornadoLanded);
instance_create(nx-320,ny,objTailsPolish);

i=instance_create(nx,ny,grassline);
nx+=960;
i.x2=nx;
i.y2=ny;

i=instance_create(nx,ny,grassline);
nx+=960;
i.x2=nx;
i.y2=ny;

with grassline
    deep=1280;
phase = 0;
timer = -60;
