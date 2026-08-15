var px,py,pxx,pyy;
px=x;
py=y;
pxx=xx;
pyy=yy;
if (xx>=x)
    x+=spd*global.time;
if (xx<=x)
    x-=spd*global.time;

if (yy>=y)
    y+=spd*global.time;
if (yy<=y)
    y-=spd*global.time;
        
if (x==px && y==py)
    {
    x=16+32*floor(x/32);
    y=16+32*floor(y/32);
    curr+=1;
    if (curr>=pp.pipes)
        {i=instance_create(x,y,sonic);
        i.rings=rings;
        if(ypp==y)
            i.hspeed=spd;
        else
            i.vspeed=-spd;
        soundplay(global.sndRedWave);
        instance_destroy();}
    else
        {
        if (curr<=0)
            spd=spd*2;
        if (curr==-3)
            xx+=32;
        else if (curr==-2)
            yy+=32;
        else if (curr==-1)
            xx-=32;
        else
            {xx=pp.pipe[curr].x+16;
            yy=pp.pipe[curr].y+16;}
        }
    if(curr<=0 || (yy!=pyy && x!=xpp) || (xx!=pxx && y!=ypp))
        {soundstop(global.sndRoll);
        soundplay(global.sndRoll);}
    }
xpp=xprevious;
ypp=yprevious;
__view_set( e__VW.XView, 0, x-320 );
__view_set( e__VW.YView, 0, y-240 );
image_speed = global.time*spd/16;
