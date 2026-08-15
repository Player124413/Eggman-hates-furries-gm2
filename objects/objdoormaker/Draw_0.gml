var h,v;
h=-32*sin(angle);
v=+32*cos(angle);
for(i=0.5; i<5.5; i+=1)
    {
    draw_sprite_ext(sprite_index,min(2,floor(i)),x+h*((1-prog)*5+i),y+v*((1-prog)*5+i),1,1,-radtodeg(angle),c_white,1);
    draw_sprite_ext(sprite_index,min(2,floor(i)),x-h*((1-prog)*5+i),y-v*((1-prog)*5+i),1,-1,-radtodeg(angle),c_white,1);
    }
