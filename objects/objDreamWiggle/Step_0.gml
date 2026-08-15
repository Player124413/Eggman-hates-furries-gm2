image_index-=(1-global.time)*image_speed;
image_blend=make_color_hsv(tutorialgenerator.hue,255,max(0,255-(y-tutorialgenerator.refY)/40));

x=xstart+dreamXSkew(y-tutorialgenerator.refY);
x2=xstart+dreamXSkew(y2-tutorialgenerator.refY);

i1.x=x;
i1.x2=x2;
with i1
    event_perform(ev_alarm,0)
i2.x=x+w;
i2.x2=x2+w;
with i2
    event_perform(ev_alarm,0)
