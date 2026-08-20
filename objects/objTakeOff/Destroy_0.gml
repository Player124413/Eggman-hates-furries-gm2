
if (instance_exists(objectfg))
    objectfg.darkness = 0;
if (sprite_exists(planeShadowSprite))
    sprite_delete(planeShadowSprite);
if surface_exists(surf)
    surface_free(surf);
with objTakeOffSmoke
    instance_destroy();
soundfrequency(global.sndEngine,0.22);
   
if(make)
    {
    room_speed=60;
    controlbg.on=1;
    controlbg.lev=-7;
    instance_create(0,0,transitiongenerator);
    }
