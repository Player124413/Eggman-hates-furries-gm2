action_set_relative(1);
image_index += -image_speed*(1-global.time);
speed-=global.air*speed*speed*global.time;

x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
action_set_vspeed(global.grav/global.meter*global.time);
var lol;
if (gnd>0)
    {
    timer+=global.time;
    if (timer>30 && phase==0)
        {
        visible=0;
        phase=1;
        timer=0;
        sonic.physics=0;
        sonic.sprite_index=sduck;
        sonic.image_speed=0;
        sonic.image_index=1;
        objtails2.sprite_index=stailfly3;
        soundplay(global.sndFlashOut);
        a=instance_create(objcore2.nnx+480,objcore2.nny-128,chopper);
        a.goalx=objtails2.x+172;
        a.goaly=a.y+28;
        a.phase=0;

        }
    lol=120;
    if (timer<=lol&&phase==1)
        {
        if (timer==100)
            {
            sonic.sprite_index=sshockup;
            soundplay(global.sndSurprise);
            }
        if (instance_exists(objtails2))
            {
            with (objtails2)
                {
                if (y>objcore2.nny-24)
                    y=objcore2.nny-24;
                if (y<objcore2.nny-58)
                    y=objcore2.nny-58;
                }
            }
        objectfg.flashlight=1-power(timer/lol,3);
        soundvolume(global.sndShaft,0.9*timer/lol);
        soundvolume(global.sndChopper,timer/lol);
        soundvolume(global.sndElectric1,timer/lol);
        soundvolume(global.sndElectric2,timer/lol);
        soundvolume(global.sndTailsFly,timer/lol);
        }
    if(timer==lol)
        objJaw.open=objJaw.open/2;
    if(timer==lol+1)
        {
        objJaw.open=0;
        soundplay(global.sndClank);
        with (objtails2)
            instance_destroy();
        }
    
    if (timer==lol+30)
        {
        soundplay(global.sndArmChange);
        sonic.physics=1;
        sonic.able=1;
        chopper.phase=1;
        chopper.goaly-=48;
        }
        
    }

if(gnd==2 && lastgnd==0)
    {
    soundplay(global.sndClink);
    }
lastgnd=gnd;
if (gnd>0)
    gnd-=1;
action_set_relative(0);
