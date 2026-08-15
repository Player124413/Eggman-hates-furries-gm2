c=floor(random(4));
if(c==0)
    draw_set_color(c_white);
if(c==1)
    draw_set_color(c_blue);
if(c==2)
    draw_set_color(c_aqua);
if(c==3)
    draw_set_color(c_yellow);
action_draw_line(x, y, xprevious, yprevious);
