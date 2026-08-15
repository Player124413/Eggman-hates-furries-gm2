{
    var i;

    // --- how many buttons we have ---
    global.tc_count = 7;

    // --- labels (ASCII only, so they render on every device/font) ---
    global.tc_label[0] = "<";
    global.tc_label[1] = ">";
    global.tc_label[2] = "^";
    global.tc_label[3] = "v";
    global.tc_label[4] = "JUMP";
    global.tc_label[5] = "START";
    global.tc_label[6] = "BACK";

    // --- the keyboard key each button simulates ---
    global.tc_key[0] = vk_left;
    global.tc_key[1] = vk_right;
    global.tc_key[2] = vk_up;
    global.tc_key[3] = vk_down;
    global.tc_key[4] = vk_space;   // jump
    global.tc_key[5] = vk_enter;   // start / confirm
    global.tc_key[6] = vk_escape;  // pause / back / quit

    // --- default layout (normalized 0..1; size = radius / screen height) ---
    //   [d-pad on the left, jump on the right, start/back up top]
    global.tc_dx[0] = 0.14;  global.tc_dy[0] = 0.72;  global.tc_dsize[0] = 0.07;  global.tc_dvis[0] = 1;
    global.tc_dx[1] = 0.30;  global.tc_dy[1] = 0.72;  global.tc_dsize[1] = 0.07;  global.tc_dvis[1] = 1;
    global.tc_dx[2] = 0.22;  global.tc_dy[2] = 0.55;  global.tc_dsize[2] = 0.06;  global.tc_dvis[2] = 1;
    global.tc_dx[3] = 0.22;  global.tc_dy[3] = 0.88;  global.tc_dsize[3] = 0.06;  global.tc_dvis[3] = 1;
    global.tc_dx[4] = 0.84;  global.tc_dy[4] = 0.74;  global.tc_dsize[4] = 0.11;  global.tc_dvis[4] = 1;
    global.tc_dx[5] = 0.93;  global.tc_dy[5] = 0.10;  global.tc_dsize[5] = 0.05;  global.tc_dvis[5] = 1;
    global.tc_dx[6] = 0.07;  global.tc_dy[6] = 0.10;  global.tc_dsize[6] = 0.05;  global.tc_dvis[6] = 1;

    // --- live layout (copied from defaults, then overwritten by the save) ---
    for (i = 0; i < global.tc_count; i += 1)
    {
        global.tc_x[i]    = global.tc_dx[i];
        global.tc_y[i]    = global.tc_dy[i];
        global.tc_size[i] = global.tc_dsize[i];
        global.tc_vis[i]  = global.tc_dvis[i];
    }

    // --- runtime state ---
    global.tc_edit = 0;                    // 1 = editor is open
    for (i = 0; i < global.tc_count; i += 1) global.tc_pressed[i] = 0;
    for (i = 0; i < 5; i += 1)
    {
        global.tc_dev_btn[i] = -1;         // which button finger i controls
        global.tc_grabx[i]   = 0;          // grab offset (normalized)
        global.tc_graby[i]   = 0;
    }

    // --- load a saved layout if one exists ---
    tc_load();

    // --- modern-device scaling (fit the 640x480 game into the screen) ---
    tc_fit_screen();
}

