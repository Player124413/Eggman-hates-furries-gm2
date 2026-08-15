var q;
if(current_time>tt)
    {
    visible=1;
    image_index=0;
    if(tt==0)
        tt=current_time+n*1000;
    else
        tt+=n*1000;
    timer=0;
    image_xscale=1;
    x=0;
    }

q=n*15;
timer+=1;
image_index=0;
if (timer mod q >q/4)
    image_index=1;
if (timer mod q >q/2)
    image_index=2;
if (timer mod q >3*q/4)
    image_index=1;
if(timer>=q && x==0)
    {
    image_xscale=-1;
    image_index=0;
    x=320;
    }
