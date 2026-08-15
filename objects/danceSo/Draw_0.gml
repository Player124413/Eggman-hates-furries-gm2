blue=make_color_rgb(33,66,198);
skin=make_color_rgb(231,165,132);

right=-lengthdir_x(1,angle)
in=lengthdir_y(1,angle)

xx=x;
x+=in*10;

cc=360*c/mc+18;
rbob=+lengthdir_x(13,cc);
rbob=limitize(rbob,7);
rbob=(rbob+5)*right;
ry=min(1,-abs(lengthdir_y(11,cc))+4);

cc=360*c/mc-22;
lbob=lengthdir_x(13,cc);
lbob=limitize(lbob,7);
lbob=(lbob-5)*right;
ly=min(1,-abs(lengthdir_y(11,cc))+4);

cc=360*c/mc;
xbob=lengthdir_x(8,cc);
xbob=limitize(xbob,6);
xbob=xbob*right;
ybob=max(0,abs(lengthdir_y(8,cc))-2);

img=floor(angle*dirs/360);
hsc=1;
if (angle>=180)
    {hsc=-1;
    img=ceil((360-angle)*dirs/360)-1;
    }




if (angle>150)
    k=1;
else
    k=0;
ok=1;
repeat(2)   
    {if(k)
        {//RIGHT
        drawFoot(x+xbob+2*right-2*in,y-ybob-8, x+rbob*3/4-in,y-ybob/2+ry/2-3 ,x+rbob+3*in,y+ry ,img,hsc ,2,blue,true,sprSonicShoe);
        drawHand(x+xbob+right*4,y-ybob-16, x+xbob+right*8-5*in,y-ybob*3/4-17, x+xbob+right*13-9*in,y-ybob/2-20 ,2,skin,(angle>60 && angle<330),sprSonicHand);
        }
    if(!k)
        {//LEFT
        drawFoot(x+xbob-2*right-2*in,y-ybob-8, x+lbob*3/4-in,y-ybob/2+ly/2-3 ,x+lbob+3*in,y+ly ,img,hsc ,2,blue,true,sprSonicShoe);
        drawHand(x+xbob-right*4,y-ybob-16, x+xbob-right*6-4*in,y-12-ybob*3/4, x+xbob-right*8-8*in,y-12-ybob/2 ,2,skin,(angle<90 || angle>270),sprSonicHand);
        }
    if(ok)
        {//MIDDLE        
        draw_sprite_ext(sprSonicBody,img*subs+sub,x+xbob,y-ybob-8+sub,hsc,1,0,c_white,1);
        }
    ok=0;
    k=!k;
    }
x=xx;
