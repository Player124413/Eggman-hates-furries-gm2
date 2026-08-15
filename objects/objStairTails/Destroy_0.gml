        audio_stop_sound(Spot);
        __background_set_colour( c_black );
        with (objMenuCreds)
            instance_destroy();
        with (objBGStairs)
            instance_destroy();
        with (BottomFloor)
            instance_destroy();
        with (makestairs)
            instance_destroy();
        with (stair)
            instance_destroy();
        instance_create(0,0,objMenu);
