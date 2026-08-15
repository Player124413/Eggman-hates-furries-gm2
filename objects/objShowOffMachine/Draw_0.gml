var f;
f=4*sin(cc);
y+=f;
draw_sprite(sprite_index,2,x,y);
draw_sprite(sprEggman2,img,x,ceil(y));
drawsprite();
y-=f;
cc+=global.time*pi/30;
