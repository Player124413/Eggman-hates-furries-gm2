image_index -= (1 - global.time) * image_speed;
if (!instance_exists(p))
{
    instance_destroy();
    exit;
}
x = p.x;
y = p.y;
