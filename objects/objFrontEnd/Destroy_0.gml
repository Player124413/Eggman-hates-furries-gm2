__background_set(e__BG.Visible, 1, 0);
__background_set(e__BG.Alpha, 0, 1);
// Do not leak End's drawing state into Ultimate or the title screen.
draw_set_blend_mode(bm_normal);
draw_set_color(c_white);
draw_set_alpha(1);
