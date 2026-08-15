action_set_relative(1);
action_draw_sprite(sprtarget, 0, 0, -1);
action_font(assessmentfont, 0);
action_color(65280);
{
action_set_relative(0);
action_draw_line(x+16*rr, y, x+(16+ext1*32)*rr, y);
action_set_relative(1);
}
{
action_set_relative(0);
action_draw_line(x+(48)*rr, y, x+(48+ext2*32)*rr, y+32*ext2);
action_set_relative(1);
}
action_draw_text(""+string(text), 80*rr, 36);
action_set_relative(0);
