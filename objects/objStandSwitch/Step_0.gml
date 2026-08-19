var __b__;
__b__ = action_if(instance_exists(sonic));
if __b__
{
{
__b__ = action_if(init==-1);
if __b__
{
if (prog<1)
    {
    prog+=global.time/15;
    if (prog>0.2)
        image_single=2;
    if (prog>=1)
        {
        prog=1;
        soundplay(global.sndClank);
        }
    }
}
else
{
{
__b__ = action_if(report2!=0 && sonic.sprite_index==sstand);
if __b__
{
init+=global.time;
if (init>0)
    {soundplay(global.sndRedWave);
    init=-1;
    supergenerator.phase+=1;
    image_single=1;
    
    //sonic.y+=4;
    
    /*with i1
        {
        y2+=4;
        event_perform(ev_alarm,0);
        }
    with i2
        {
        y2+=4;
        event_perform(ev_alarm,0);
        }*/
    with i3
        {
        //y+=4;
        //y2+=4;
        //event_perform(ev_alarm,0);
        }
    }
/* */
}
else
{
init = 0;
/* */
}
}
}
report2 = 0;
/* */
}
}
/*  */
