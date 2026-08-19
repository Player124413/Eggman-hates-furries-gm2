if (!instance_exists(doom) || !instance_exists(p))
{
    instance_destroy();
    exit;
}
image_angle = angle + doom.image_angle;
