prog+=1/time;
if (prog>=1)
    {
    soundplay(global.sndClick);
    i=instance_create(destX,destY,objRainHit);
    i.depth=depth;
    instance_destroy();
    }

c=prog;
x=xstart*(1-c)+destX*c;
y=ystart*(1-c)+destY*c;
