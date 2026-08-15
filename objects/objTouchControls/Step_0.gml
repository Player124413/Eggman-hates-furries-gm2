{
    var d, i, b;
    var px, py, gx, gy, r;
    var gui_w, gui_h;

    gui_w = display_get_gui_width();
    gui_h = display_get_gui_height();

    // ---------- touch press / release handling ----------
    for (d = 0; d < 5; d += 1)
    {
        // ----- a finger just touched down -----
        if (device_mouse_check_button_pressed(d, mb_left))
        {
            px = device_mouse_x_to_gui(d);
            py = device_mouse_y_to_gui(d);

            // 1) EDIT button (top-right)
            if (point_distance(px, py, gui_w - 40, 34) <= 30)
            {
                tc_release_all();
                global.tc_edit = 1 - global.tc_edit;
                global.tc_dev_btn[d] = -1;
                continue;
            }

            // 2) editor-only buttons
            if (global.tc_edit)
            {
                if (point_distance(px, py, gui_w / 2 - 70, gui_h - 40) <= 28)  // SAVE
                {
                    tc_save();
                    global.tc_dev_btn[d] = -1;
                    continue;
                }
                if (point_distance(px, py, gui_w / 2 + 70, gui_h - 40) <= 28)  // RESET
                {
                    tc_defaults();
                    tc_save();
                    global.tc_dev_btn[d] = -1;
                    continue;
                }
            }

            // 3) the game buttons themselves (topmost = last drawn = first checked)
            for (i = global.tc_count - 1; i >= 0; i -= 1)
            {
                gx = global.tc_x[i] * gui_w;
                gy = global.tc_y[i] * gui_h;
                r  = global.tc_size[i] * gui_h;

                if (global.tc_edit)
                {
                    // eye toggle (visibility)
                    if (point_distance(px, py, gx - r * 0.7, gy - r * 0.7) <= r * 0.32)
                    {
                        global.tc_vis[i] = 1 - global.tc_vis[i];
                        global.tc_dev_btn[d] = -1;
                        break;
                    }
                    // resize handle (bottom-right)
                    if (point_distance(px, py, gx + r * 0.7, gy + r * 0.7) <= r * 0.28)
                    {
                        global.tc_dev_btn[d] = 100 + i;   // "resizing button i"
                        break;
                    }
                }

                // button body
                if (point_distance(px, py, gx, gy) <= r)
                {
                    global.tc_dev_btn[d] = i;
                    global.tc_grabx[d] = (px - gx) / gui_w;
                    global.tc_graby[d] = (py - gy) / gui_h;

                    if (!global.tc_edit)
                    {
                        keyboard_key_press(global.tc_key[i]);
                        global.tc_pressed[i] = 1;
                    }
                    break;
                }
            }
        }

        // ----- a finger was lifted -----
        if (device_mouse_check_button_released(d, mb_left))
        {
            i = global.tc_dev_btn[d];
            if (i >= 0 && i < 100)
            {
                keyboard_key_release(global.tc_key[i]);
                global.tc_pressed[i] = 0;
            }
            global.tc_dev_btn[d] = -1;
        }
    }

    // ---------- continuous drag / pinch while fingers are down ----------
    for (i = 0; i < global.tc_count; i += 1)
    {
        var cnt = 0, f1 = -1, f2 = -1;
        for (d = 0; d < 5; d += 1)
        {
            if (global.tc_dev_btn[d] == i)
            {
                if (cnt == 0) f1 = d; else f2 = d;
                cnt += 1;
            }
        }

        if (global.tc_edit)
        {
            if (cnt == 1)   // one finger on the body => move
            {
                px = device_mouse_x_to_gui(f1);
                py = device_mouse_y_to_gui(f1);
                global.tc_x[i] = clamp(px / gui_w - global.tc_grabx[f1], 0, 1);
                global.tc_y[i] = clamp(py / gui_h - global.tc_graby[f1], 0, 1);
            }
            else if (cnt >= 2)   // two fingers => pinch resize
            {
                px = device_mouse_x_to_gui(f1);
                py = device_mouse_y_to_gui(f1);
                gx = device_mouse_x_to_gui(f2);
                gy = device_mouse_y_to_gui(f2);
                global.tc_size[i] = clamp(point_distance(px, py, gx, gy) / 2 / gui_h, 0.02, 0.4);
            }
        }
    }

    // ---------- single-finger resize via the corner handle ----------
    for (d = 0; d < 5; d += 1)
    {
        b = global.tc_dev_btn[d];
        if (b >= 100 && global.tc_edit)
        {
            b -= 100;
            gx = global.tc_x[b] * gui_w;
            gy = global.tc_y[b] * gui_h;
            px = device_mouse_x_to_gui(d);
            py = device_mouse_y_to_gui(d);
            global.tc_size[b] = clamp(point_distance(gx, gy, px, py) / gui_h, 0.02, 0.4);
        }
    }
}

