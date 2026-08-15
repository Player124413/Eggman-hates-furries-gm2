mm=12;
rr=16;
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
draw_circle_color(x,y,rr+random(rr),draw_get_color(),c_black,0);
draw_circle_color(x2,y2,rr+random(rr),draw_get_color(),c_black,0);
draw_set_blend_mode(bm_normal);

