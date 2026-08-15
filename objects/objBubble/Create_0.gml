action_set_relative(0);
image_single=random(image_number);
image_xscale=0;
image_yscale=0;

targetSize=0.2+random(0.4);
action_set_motion(random(360), random(0.1));
{
action_set_relative(1);
action_set_vspeed(-0.5);
action_set_relative(0);
}
action_set_relative(0);
