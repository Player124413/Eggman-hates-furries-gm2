{
    var i;
    var gx, gy, r, pressed;
    var gui_w, gui_h;

    gui_w = display_get_gui_width();
    gui_h = display_get_gui_height();

    draw_set_alpha(1);

    // ---------- game buttons ----------
    for (i = 0; i < global.tc_count; i += 1)
    {
        // hidden buttons are only shown (dimmed) while editing
        if (!global.tc_vis[i] && !global.tc_edit) continue;

        gx = global.tc_x[i] * gui_w;
        gy = global.tc_y[i] * gui_h;
        r  = global.tc_size[i] * gui_h;

        pressed = global.tc_pressed[i];

        if (!global.tc_vis[i]) draw_set_alpha(0.22);

        // body
        draw_set_color(c_white);
        draw_set_alpha(draw_get_alpha() * (pressed ? 0.55 : 0.30));
        draw_circle(gx, gy, r, 0);

        draw_set_alpha(1);
        if (!global.tc_vis[i]) draw_set_alpha(0.22);
        draw_set_color(pressed ? c_yellow : c_white);
        draw_circle(gx, gy, r, 1);

        // label
        draw_set_color(pressed ? c_yellow : c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(gx, gy, string_hash_to_newline(global.tc_label[i]));
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);

        if (global.tc_edit)
        {
            draw_set_alpha(1);
            draw_set_color(c_lime);
            draw_circle(gx, gy, r, 1);

            // eye (visibility) toggle
            draw_set_color(global.tc_vis[i] ? c_lime : c_red);
            draw_circle(gx - r * 0.7, gy - r * 0.7, r * 0.32, 0);
            draw_set_color(c_black);
            draw_circle(gx - r * 0.7, gy - r * 0.7, r * 0.32, 1);

            // resize handle
            draw_set_color(c_aqua);
            draw_circle(gx + r * 0.7, gy + r * 0.7, r * 0.28, 0);
            draw_set_color(c_black);
            draw_circle(gx + r * 0.7, gy + r * 0.7, r * 0.28, 1);
        }

        draw_set_alpha(1);
    }

    // ---------- EDIT button (always visible, top-right) ----------
    draw_set_color(global.tc_edit ? c_lime : c_gray);
    draw_circle(gui_w - 40, 34, 30, 0);
    draw_set_color(c_black);
    draw_circle(gui_w - 40, 34, 30, 1);
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(gui_w - 40, 34, string_hash_to_newline("EDIT"));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // ---------- SAVE / RESET (editor only) ----------
    if (global.tc_edit)
    {
        draw_set_color(c_lime);
        draw_circle(gui_w / 2 - 70, gui_h - 40, 28, 0);
        draw_set_color(c_black);
        draw_circle(gui_w / 2 - 70, gui_h - 40, 28, 1);
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text(gui_w / 2 - 70, gui_h - 40, string_hash_to_newline("SAVE"));

        draw_set_color(c_orange);
        draw_circle(gui_w / 2 + 70, gui_h - 40, 28, 0);
        draw_set_color(c_black);
        draw_circle(gui_w / 2 + 70, gui_h - 40, 28, 1);
        draw_set_color(c_white);
        draw_text(gui_w / 2 + 70, gui_h - 40, string_hash_to_newline("RESET"));

        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }

    draw_set_alpha(1);
    draw_set_color(c_white);
}

