image_index += (global.time * 2 - 1) * image_speed;

// The owner can disappear during room transitions or scripted cut-scenes.
// Never dereference a stale instance reference.
if (kill || !instance_exists(p))
{
    instance_destroy();
    exit;
}

x = p.x;
y = p.y;
image_angle = p.image_angle;
image_xscale = p.image_xscale;
