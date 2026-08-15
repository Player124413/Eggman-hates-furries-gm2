blink = 0;
imgsp = 0.38;
if(random(2)<1)
    image_xscale=-1;
    
image_index=random(image_number);
image_speed=0;
soundplay(global.sndFlame);
image_xscale = image_xscale*1.15;
