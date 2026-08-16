if(instance_exists(sonic))
    sonic.render=0;
if(instance_exists(objSuperSonic))
    objSuperSonic.visible=0;
if(instance_exists(sonails))
    sonails.visible=0;
if(instance_exists(bike))
    bike.mySonic=0;

if (instance_exists(controlbg))
    lev=controlbg.lev;
else
    lev=-1000;



soundvolume(global.sndEngine2,0.85);
with all
    {
    if (id!=other.id)
        instance_destroy();
    }
    
    // background_create_from_screen() no longer exists. Capture the
    // already-rendered application surface as a runtime sprite instead.
    mybg = sprite_create_from_surface(application_surface, 0, 0, 640, 480, false, false, 0, 0);
visible=1;
soundplay(global.sndDeath);

global.time=0.5;

if(global._drown)
    {
    soundplay(global.sndDrown);
    sprite_index=sdrown;
    }
else
    {
    soundplay(global.sndDeath);
    vspeed=-12;
    }
