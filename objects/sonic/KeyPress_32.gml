// Space: charge a spin dash while Down is held, otherwise jump.
//
// The converted GMS1 code required the crouch sprite and a long standcount
// delay before accepting Space. In the Dream tutorial this made the first
// press jump (event ordering updates the crouch sprite later) and often made
// charging impossible on animated ground. Read the actual input instead.
if (gnd > 0 && able)
{
    var wants_spin_dash = keyboard_check(vk_down) || dash > 0;

    if (wants_spin_dash)
    {
        if (dash == 0)
        {
            dash = 1;
            myfish = instance_create(x, y, objdashfish);
            myfish.p = id;
            myfish.image_xscale = image_xscale;
            myfish.image_angle = image_angle;
        }

        if (dash < 6)
            dash += 1;

        // Refresh the fail-safe while the player actively taps Space.
        dash_charge_timeout = 45;
        sprite_index = sdash;
        image_speed = 1;
        soundfrequency(global.sndSpin, 0.15 + dash / 40);
        soundplay(global.sndSpin);
    }
    else
    {
        soundplay(global.sndJump);
        hspeed += nx * jump;
        vspeed += ny * jump;
        x += nx * 4;
        y += ny * 4;
        roll = 0;
        sprite_index = sjump;
        gnd = 0;
        image_speed = 1;
    }
}
