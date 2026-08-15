draw_sprite_ext(sprblackaccumulate,-1,objdoll.x,objdoll.y,sc,sc,0,c_white,image_alpha);
draw_sprite_ext(sprblackcharge,-1,x,y,1,sc,0,c_white,image_alpha);

if (timer<90)
    {xx=sonic.x;
    yy=sonic.y;}
if (timer>=90 && timer<120 && timer mod 5 < 3)
    {
    if(timer mod 5 ==0)
        soundplay(global.sndShortDark);
    draw_sprite(sprblackmark,0,xx,yy);
    }

if(timer<120 && phase==0)
    {
    draw_sprite_ext(sprblackspinner,0,xx,yy,sc/(1+a/2000),sc/(1+a/2000),-a,c_white,image_alpha);
    a+=14;
    }
if (timer>120 && instance_exists(objentangle2)) 
    {
    if (objentangle2.phase==2 || objentangle2.phase==3)
        draw_sprite(sprblackreveal,0,objentangle2.x,objentangle2.y);
    }
