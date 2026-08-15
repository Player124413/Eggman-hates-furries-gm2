var __b__;
__b__ = action_if(fragile);
if __b__
{
{
__b__ = action_if(report!=0 && timer==0 && report2>0);
if __b__
{
soundplay(global.sndRaze);
for(i=0; i<reps; i+=1)
    {
    pp[i].timer=1+i*reps;
    }

}
__b__ = action_if(report2!=0);
if __b__
{
oldreport2=report2;
alarm[0]=5;

report2=0;
}
__b__ = action_if(timer!=0);
if __b__
{
timer-=global.time;
if(timer<=0 && timer>-1)
    {
    
    
    for(a=0; a<sprite_width; a+=16)
        {
        for(b=0; b<sprite_width; b+=16)
            {
            i=instance_create(x+a,y+b,partialdebris);
            i.sprite_index=sprite_index;
            i.image_single=image_index;
            i.depth=depth;
            if(sig==1)
                i.timer=16-b/4-a/8;
            else
               i.timer=10-b/4+a/8;
            i.x0=a;
            i.y0=b;
            i.h=16;
            i.v=16;
            }
        }
    visible=0;
    timer=-1;
    }
if (timer<0)
    {
    if (timer<-10)
        {
        with (i1)
            instance_destroy();
        instance_destroy();
        if (oldreport2!=0)
            {//stop the spindash when ground disappears
            with (sonic)
                {if(dash!=0)
                    {with (objdashfish)kill=1;
                        dash=0;
                    }
                standcount=0;
                }
            }
        }
    }

}
}
}
