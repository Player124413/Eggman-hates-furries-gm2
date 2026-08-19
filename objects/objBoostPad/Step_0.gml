image_index -= (1 - global.time) * image_speed;

var player = instance_find(sonic, 0);
if (instance_exists(player))
{
    if (point_distance(x, y, player.x, player.y) < player.speed + 32 && player.gnd > 0)
    {
        if (trigger == 0)
        {
            player.speed = amount;
            player.direction = image_angle;
            if (image_xscale < 0)
                player.direction += 180;
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
