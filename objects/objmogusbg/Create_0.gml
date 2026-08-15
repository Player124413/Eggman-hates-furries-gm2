action_move_point(random(640), random(480), 1+random(1));
rot=-1+random(2);
image_speed=0;
image_angle=random(360);
do
    sprite_index=floor(random(400));
    until (sprite_exists(sprite_index) && sprite_width+sprite_height<145);

image_alpha=0.5+random(0.5);
image_blend=make_color_rgb(random(32),random(32),random(32));
image_index=floor(random(image_number));
image_xscale=0.5+random(0.5);
image_yscale=0.5+random(0.5);
kill = 0;
