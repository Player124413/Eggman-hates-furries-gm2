var a,yy;


yy=ystart;
do yy-=64;
until (yy<__view_get( e__VW.YView, 0 )+480)

while (yy>__view_get( e__VW.YView, 0 )-64) 
    {
    draw_sprite(sprelevatorlights,0,x,yy+64);
    yy-=64;
    }



for(a=0; a<48; a+=1;)
    {
    draw_sprite(sprElevatorChain,img,x+32,y-96-a*8);
    }
drawsprite();


