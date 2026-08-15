if (objSuperEgg.makeShock>0)
    {if (alpha<1)
        alpha+=global.time/8;
    }
else
    {alpha-=global.time/8;
    if (alpha<=0)
        instance_destroy()
    }    
ip=prog;
ap=min(1,prog+1/12);
pp=min(1,prog-1/12);

xi=x*(1-ip)+x2*(ip);
yi=y*(1-ip)+y2*(ip);

xa=x*(1-ap)+x2*(ap);
ya=y*(1-ap)+y2*(ap);

xp=x*(1-pp)+x2*(pp);
yp=y*(1-pp)+y2*(pp);

draw_set_alpha(alpha);
draw_set_color(c_white);
draw_line(xi,yi,xa,ya);
draw_set_alpha(alpha/2);
draw_line(xi,yi,xp,yp);
draw_set_alpha(1);
draw_sprite_ext(sprite_index,image_index,xa,ya,1,1,0,c_white,alpha);


prog+=(global.time*(0.10+prog)/6)
if (prog>1)
    instance_destroy();

