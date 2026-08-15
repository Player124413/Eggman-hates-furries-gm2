if (alpha<1)
    alpha+=global.time/8;
ip=prog;
ap=min(1,prog+1/12);
pp=min(1,prog-1/12);

xi=x*(1-ip)+x2*(ip);
yi=y*(1-ip)+y2*(ip);

xa=x*(1-ap)+x2*(ap);
ya=y*(1-ap)+y2*(ap);

xp=x*(1-pp)+x2*(pp);
yp=y*(1-pp)+y2*(pp);

xi+=__view_get( e__VW.XView, 0 );
xa+=__view_get( e__VW.XView, 0 );
xp+=__view_get( e__VW.XView, 0 );


draw_set_blend_mode(bm_subtract);
c=make_color_hsv(0,0,128*alpha);
draw_set_color(c);
draw_line(xi,yi,xp,yp);
c=make_color_hsv(0,0,255*alpha);
draw_set_color(c);
draw_line(xi,yi,xa,ya);
draw_sprite_ext(sprite_index,image_index,xa,ya,1,1,0,c,1);
draw_set_blend_mode(bm_normal);

prog+=(global.time*(0.10+prog)/6)
if (prog>1)
    instance_destroy();

