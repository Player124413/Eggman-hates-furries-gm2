orange=make_color_rgb(224,128,0);

right=-lengthdir_x(1,angle)
in=lengthdir_y(1,angle)

xx=x;
x+=in*10;

cc=360*c/mc+30;
rbob=+lengthdir_x(13,cc);
rbob=limitize(rbob,7);
rbob=(rbob+5)*right;
ry=min(1,-abs(lengthdir_y(11,cc))+4);

cc=360*c/mc-30;
lbob=lengthdir_x(13,cc);
lbob=limitize(lbob,7);
lbob=(lbob-5)*right;
ly=min(1,-abs(lengthdir_y(11,cc))+4);

cc=360*c/mc;
xbob=lengthdir_x(8,cc);
xbob=limitize(xbob,6);
xbob=xbob*right;
ybob=max(0,abs(lengthdir_y(8,cc))-2);

if (cc<50 || cc>340)
    sub=1;
else
    sub=0;

img=floor(angle*dirs/360);
hsc=1;
if (angle>=180)
    {hsc=-1;
    img=ceil((360-angle)*dirs/360)-1;
    }




if (angle>170)
    k=1;
else
    k=0;
ok=1;
repeat(2)   
    {if(k)
        {//RIGHT
        drawFoot(x+xbob+2*right-2*in,y-ybob-8, x+rbob*3/4-4*in,y-ybob/2+ry/2-2 ,x+rbob,y+ry ,img,hsc ,2,orange,true,sprTailsShoe);
        drawHand(x+xbob+right*4,y-ybob-16, x+xbob+right*6-4*in,y-12-ybob*3/4, x+xbob+right*8-8*in,y-12-ybob/2 ,2,orange,(angle<90 || angle>270),sprTailsHand);
        }
    if(!k)
        {//LEFT
        drawFoot(x+xbob-2*right-2*in,y-ybob-8, x+lbob-4*in,y-ybob/2+ly/2-2 ,x+lbob,y+ly ,img,hsc ,2,orange,true,sprTailsShoe);
        drawHand(x+xbob-right*4,y-ybob-16, x+xbob-right*8-5*in,y-ybob*3/4-17, x+xbob-right*13-9*in,y-ybob/2-20 ,2,orange,1,sprTailsHand);//(angle>45 && angle<360));
        }
    if(ok)
        {//MIDDLE
        if(abs(cos(degtorad(angle)))<0.6)
            geTail=sprTailsTails1;
        else
            geTail=sprTailsTails2;
        
        if(cos(degtorad(angle))>0)
            draw_sprite_ext(geTail,tailImg,x+xbob+6*in,y-ybob-8,hsc,1,0,c_white,1);
        
        draw_sprite_ext(sprTailsBody,img*subs+sub,x+xbob,y-ybob-8+sub,hsc,1,0,c_white,1);
        
        if(cos(degtorad(angle))<=0)
            draw_sprite_ext(geTail,tailImg,x+xbob+6*in,y-ybob-8,hsc,1,0,c_white,1);
        }
    ok=0;
    k=!k;
    }
x=xx;
