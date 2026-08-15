mc=30;
//audio_play_sound(0, 10, true)
x=320;
y=120;
__background_set_colour( c_black );
a=instance_create(x+192,y+224-8,danceSo);
b=instance_create(x+192,y+224-8,danceTa);


instance_create(x+128,y+224,objFirePlace);

i=instance_create(x+16,y+224,danceStatic) i.sprite_index=sprStool;
i=instance_create(x+48,y+224,danceStatic) i.sprite_index=sprTable;
i=instance_create(x+64,y+224,danceStatic) i.sprite_index=sprStool;

i=instance_create(x+176,y+96,danceStatic) i.sprite_index=sprBooks;
i=instance_create(x+256,y+224,danceStatic) i.sprite_index=sprRadio;

for(yy=y; yy<y+192; yy+=32)
    {i=instance_create(x+112,yy,danceStatic) i.sprite_index=sprStovePipe;}
