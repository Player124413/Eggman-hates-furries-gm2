image_index -= (1 - global.time) * image_speed;

var player = instance_find(sonic, 0);
if (instance_exists(player))
{
    // Dynamic tunnel/loop collision lines can leave gnd at zero for one frame
    // exactly as Sonic reaches a pad. The GM7 code then ignored the pad and
    // left the player unable to enter the loop. Trigger by proximity instead.
    var trigger_radius = max(48, abs(player.speed) + 40);
    if (point_distance(x, y, player.x, player.y) < trigger_radius && player.able)
    {
        if (trigger == 0)
        {
            player.speed = amount;
            player.direction = image_angle + (image_xscale < 0 ? 180 : 0);
            player.roll = 1;
            // Ignore seam/cap collision lines for a few frames so the boost
            // can carry Sonic into loop geometry before normal walls re-engage.
            player.lineCollisionGrace = entryAssist ? 10 : 4;
            if (entryAssist)
            {
                // Move past the zero-width cap generated at the converted
                // loop entrance. Normal pads never teleport the player.
                player.x += lengthdir_x(128, player.direction);
                player.y += lengthdir_y(128, player.direction);
            }
            player.sprite_index = sjump;
            player.image_speed = 1;
            soundplay(global.sndBooster);
        }
        trigger = 1;
    }
    else
    {
        trigger = 0;
    }
}
else
{
    trigger = 0;
}
