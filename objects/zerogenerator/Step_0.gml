var __b__;
// sandline creates its collision helper from Alarm 0, which runs after the
// first Step. Wait until both references exist before adjusting it.
if (instance_exists(firstSand))
{
    if (variable_instance_exists(firstSand, "i"))
    {
        var sand_collision = firstSand.i;
        if (instance_exists(sand_collision))
        {
            sand_collision.x = correctX;
            firstSand = noone;
        }
    }
}
else
{
    firstSand = noone;
}
var player = instance_find(sonic, 0);
var water = instance_find(objWaterFront, 0);
var foreground = instance_find(objectfg, 0);

// This controller may survive broad instance clean-ups. Without the player or
// water plane there is no valid level state to update this frame.
if (!instance_exists(player) || !instance_exists(water))
    exit;

// Some converted Panjan transitions advance this controller to phase 2 in the
// same frame that the wheel is removed. Recover once unless the boss has
// legitimately completed and set win=1.
if (phase==2 && win==0 && !panjanRespawned
    && !instance_exists(panjan) && !instance_exists(objPanjanCore))
{
    var restoredPanjan=instance_create(player.x-320,water.y-64,panjan);
    restoredPanjan.phase=0;
    restoredPanjan.subphs=0;
    restoredPanjan.firstCrash=0;
    restoredPanjan.hspeed=max(20,player.hspeed);
    restoredPanjan.visible=true;
    panjanRespawned=true;
    phase=1;
    timer=0;
}

__b__ = action_if(phase==0 && player.x>xx+640);
if __b__
{
phase=1;
timer=0;
i=instance_create(__view_get( e__VW.XView, 0 )-256,water.y,panjan);
i.hspeed=player.hspeed+4;

soundplay(global.sndBreakDown);
if (instance_exists(foreground))
    foreground.flashlight = 1;

event_user(3);
}
__b__ = action_if(phase==1);
if __b__
{
    var target = instance_find(panjan, 0);
    if (!instance_exists(target))
        target = instance_find(objPanjanCore, 0);

    timer += global.time;
    if (!instance_exists(target) && !panjanRespawned)
    {
        // If the round Panjan vanished during the converted platform/loop
        // transition, recreate the boss from this persistent level controller.
        // Unlike Panjan's own Step, this still runs after the boss is gone.
        target = instance_create(player.x - 320, water.y - 64, panjan);
        target.phase = 0;
        target.subphs = 0;
        target.firstCrash = 0;
        target.hspeed = max(20, player.hspeed);
        target.vspeed = 0;
        target.visible = true;
        panjanRespawned = true;
        timer = 0;
        soundplay(global.sndExplosion);
        soundloop(global.sndTurbulence);
    }

    if (!instance_exists(target))
    {
        // A replacement was already used, so this is the real boss completion.
        phase = 2;
        timer = 0;
    }
    else
    {
        if (timer == 100)
        {
            soundloop(global.handle);
            i = instance_create(__view_get(e__VW.XView, 0) - 256, __view_get(e__VW.YView, 0) - 192, tornado);
            i.hspeed = player.hspeed + 8;
            i.vspeed = i.hspeed / 16;
        }

        var camera_weight = power(stufu / 8, 6);
        __view_set(e__VW.XView, 0,
            (__view_get(e__VW.XView, 0) * (7 + camera_weight) + target.x - 320) / (8 + camera_weight));

        if (target.invulnerable > 30 && target.phase == 3)
        {
            __view_set(e__VW.XView, 0, __view_get(e__VW.XView, 0) - min((16 - stufu) * 16, 32));
            if (stufu < 16)
                stufu += global.time * 16 / 90;
        }
        if (__view_get(e__VW.XView, 0) < player.x - 608)
            __view_set(e__VW.XView, 0, player.x - 608);
        if (__view_get(e__VW.XView, 0) > player.x - 16)
            __view_set(e__VW.XView, 0, player.x - 16);
        if (target.phase != 3 || target.subphs >= 2)
            stufu = max(0, stufu - global.time * 16 / 90);

        if (timer == 23)
        {
            soundplay(global.sndBreakDownBuffer);
            if (instance_exists(foreground)) foreground.flashlight = 0.9;
        }
        if (timer == 46)
        {
            soundplay(global.sndBreakDown);
            if (instance_exists(foreground)) foreground.flashlight = 0.8;
        }

        var explosion_y = target.y;
        if (timer <= 18)
            explosion_y = target.y - 128 + 128 * timer / 18;
        else if (timer <= 36)
            explosion_y = target.y - 128 * (timer - 18) / 18;
        else if (timer <= 54)
            explosion_y = target.y - 128 + 128 * (timer - 36) / 18;
        else if (timer <= 72)
            explosion_y = target.y - 128 * (timer - 54) / 18;

        if (timer <= 72)
        {
            i = instance_create(target.x + 96 + random(64), explosion_y - 32 + random(64), objmedexp);
            i.vspeed = random(32);
        }
    }
}
__b__ = action_if(phase==2);
if __b__
{
    var target = instance_find(panjan, 0);
    if (!instance_exists(target))
        target = instance_find(objPanjanCore, 0);

    timer += global.time;
    var fade = 1 - min(1, timer / 180);
    var camera_weight = power(stufu / 8, 6);
    if (instance_exists(target))
    {
        __view_set(e__VW.XView, 0,
            (__view_get(e__VW.XView, 0) * (7 + camera_weight) + (target.x - 320) * fade)
            / (8 + camera_weight + fade));
    }
    __view_set(e__VW.XView, 0,
        __view_get(e__VW.XView, 0) - min((16 - stufu) * 16, 32) * fade);
    stufu = max(0, stufu - global.time * 16 / 90);
}

if (__view_get(e__VW.YView, 0) > water.y - 128)
    __view_set(e__VW.YView, 0, water.y - 128);
if (player.y > water.y - 128 + 496)
    game_over();
