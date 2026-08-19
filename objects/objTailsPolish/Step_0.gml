image_index -= image_speed*(1-global.time);

rubTimer-=global.time;
if (rubTimer<=0)
    {
    rub=!rub;
    rubTimer=15;
    }
if (trigger==0 && sonic.x>x+8)
    {
    trigger=1;
    rub=2;
    rubTimer=45;
    }
if (trigger==1 && sonic.x>x+400 || sonic.lockMovement==-1)
    {
    if (sonic.hspeed>0)
        sonic.hspeed-=0.5*global.time;
    sonic.able=0;
    sonic.lockMovement=-1;
    if (sonic.image_xscale<0 || sonic.hspeed<-1)
        {
        sonic.hspeed=0;
        sonic.lockMovement=0;
        trigger=2;
        }
    }
if (trigger>=2)
    {
    sonic.standcount=1;
    trigger+=global.time;
    if (trigger==45)
        {soundplay(global.sndEngineStart);
        visible=0; objTornadoLanded.engine=1;}
    if (trigger>45 && (trigger-45)/45<1)
        soundvolume(global.sndEngine,0.9*(1-power(1-(trigger-45)/45,2)));
    else if(freq<0.1)
        freq+=0.1*global.time/70;
    soundfrequency(global.sndEngine,0.22+freq);
    if(trigger>90)
        {
        objTornadoLanded.hspeed+=global.time/5;
        }
    if (objTornadoLanded.x>sonic.x)
        sonic.image_xscale=1;
    if (objTornadoLanded.x>__view_get( e__VW.XView, 0 )+512)
        {
        with (all)
            {
            if(object_index!=controlbg && object_index!=objectfg)
                instance_destroy();
            }
        instance_create(0,0,objTakeOff);
        controlbg.on=0;
        controlbg.lev=-8;
        }
    }
