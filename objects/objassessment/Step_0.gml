action_set_relative(1);
if (timer==0||timer==10||timer==20)
    {soundplay(global.sndBeep);
    visible=1;
    alarm[0]=4;}
    
if (timer==45)
    {visible=1;}
    
if (timer>45&&ext1<1)
    ext1+=global.time/15
if (timer>60&&ext2<1)
    ext2+=global.time/15;
    
if (timer>75 && timer mod 2 == 0 && txt!="")
    {soundplay(global.sndType);
    text+=string_copy(txt,1,1);
    txt=string_delete(txt,1,1);}
    
if (txt=="")
timer+=global.time;

if (timer>360)
instance_destroy();
timer += global.time;
action_set_relative(0);
