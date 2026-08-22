// Reset the GPU state before clearing: the atomic/3D scene may leave an
// inverted blend mode active for the first End frame.
draw_set_blend_mode(bm_normal);
draw_set_color(c_white);
draw_set_alpha(1);
// Draw a self-contained fallback background. This avoids the magenta texture
// placeholder produced by legacy End background resources after conversion.
draw_clear(c_black);
draw_set_alpha(1);
draw_rectangle_color(0,0,640,300,
    make_color_rgb(8,2,18),make_color_rgb(8,2,18),
    make_color_rgb(24,30,64),make_color_rgb(24,30,64),false);
draw_rectangle_color(0,300,640,480,
    make_color_rgb(20,32,50),make_color_rgb(20,32,50),
    make_color_rgb(4,8,16),make_color_rgb(4,8,16),false);

// Add a subtle fade-in without clearing the background each frame.
if (endTimer<60)
{
    draw_set_alpha(1-endTimer/60);
    draw_set_color(c_black);
    draw_rectangle(0,0,640,480,false);
    draw_set_alpha(1);
}

// Do not leak End's black fade/color state into Sonic, Tails or the ring UI.
draw_set_blend_mode(bm_normal);
draw_set_color(c_white);
draw_set_alpha(1);
