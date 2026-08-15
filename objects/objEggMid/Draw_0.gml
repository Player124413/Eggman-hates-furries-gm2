if(fixed)
    {x=doom.x;
    y=doom.y;}

draw_sprite(sprite_index,image_index,x,y+yplus);
if (phase==2 || phase==3)
    {
    c=1;
    if (timer<3)
        c=0;
    if (timer>60)
        c=2;
    if (phase==3)
        c=3;
    draw_sprite(sprEggman1,c,x,y+yplus);
    if (timer>360)
        {
        draw_set_blend_mode(bm_add);
        draw_set_alpha(min(1,(timer-360)/90));
        draw_circle_color(x,y-32,64+random(8)+timer-360,c_white,c_black,0);
        draw_set_alpha(1);
        draw_set_blend_mode(bm_normal);
        }
    }
if (phase==4)
    {
    c=0;
    if (timer mod 15<8)
        c=1;
    if (timer<120)
        draw_sprite_ext(sprEgg0_brite,c,x,y-12+yplus,1,1,0,c_white,1-timer/120);
    draw_sprite_ext(sprEgg0,c,x,y-12+yplus,1,1,0,c_white,min(1,timer/120));
    }
if (phase==5)
    {
    c=0;
    if (timer >17)
        {
        c=1;
        if(blink)
            draw_sprite(sprEggAura,0,x,y-56);
        }
    draw_sprite_ext(sprEgg1,c,x,y-12+yplus,1,1,0,c_white,1);
    if (timer>=17)
        {
        draw_set_blend_mode(bm_add);
        draw_set_alpha(random(1));
        draw_circle_color(x,y-64+yplus,64+random(8),c_white,c_black,0);
        draw_set_alpha(1);
        draw_set_blend_mode(bm_normal);
        }
    }
with doom
{
if(grav)
{
alp=max(0,min(1,(point_distance(x,y,sonic.x,sonic.y)-radius-point_distance(x,y,movingsector.x,movingsector.y))/64));
x2=sonic.x;
y2=sonic.y;
soundvolume(global.sndShield,0.5+0.5*power(alp,1/3));

draw_set_alpha(alp);

mm=12;
rr=1+32*alp;
px=x;
py=y;

c=floor(random(4));
if(c==0)
    draw_set_color(c_white);
if(c==1)
    draw_set_color(c_blue);
if(c==2)
    draw_set_color(c_aqua);
if(c==3)
    draw_set_color(c_yellow);
for(i=1; i<=mm; i+=1;)
    {
    xx=x*(1-i/mm)+x2*i/mm;
    yy=y*(1-i/mm)+y2*i/mm-64*sin(pi*i/mm);
    rx=-rr/2+random(rr);
    ry=-rr/2+random(rr);
    rx2=-rr/2+random(rr);
    ry2=-rr/2+random(rr);
    
    draw_line(px,py,xx+rx2,yy+ry2);
    draw_line(xx+rx2,yy+ry2,xx+rx,yy+ry);
    
    px=xx+rx;
    py=yy+ry;
    }
draw_line(px,py,x2,y2);

draw_set_blend_mode(bm_add);
draw_circle_color(x2,y2,alp*32+rr+random(rr),draw_get_color(),c_black,0);
draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
}
}
