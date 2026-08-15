if (report!=0)
    {timer=0;
    sonic.sprite_index=spush;
    sonic.image_speed=1/16;
    sonic.image_xscale=-sign(report);
    count+=global.time;
    if (count>=20)
        {
        x-=sign(report)*2;
        if (x>xstart)
            {
            x=xstart;
            if(xprevious<xstart)
                soundplay(global.sndClosePush);
            }
        else if (x<xstart-32)
            x=xstart-32;
        else
            {sonic.x-=sign(report)*2;
            soundplay(global.sndPush);}
        count=0;
        }
    }
else if (delay!=-1)
    {
    count=0;
    timer+=global.time;
    if (timer>=delay)
        {
        if (x<xstart)
            {
            x+=1;
            if(x>=xstart)
                soundplay(global.sndClosePush);
            else
                soundplay(global.sndUnPush);
            }
        timer=0;
        }
    }
report = 0;

it.x=x-16;
it.y=y-32;
it.x2=it.x+32;
it.y2=it.y;
with it event_perform(ev_alarm,0);
il.x=x-16;
il.y=y-32;
il.x2=il.x;
il.y2=il.y+32;
with il event_perform(ev_alarm,0);
ir.x=x+16;
ir.y=y-32;
ir.x2=ir.x;
ir.y2=ir.y+32;
with ir event_perform(ev_alarm,0);
prog = (xstart-x)/32;
