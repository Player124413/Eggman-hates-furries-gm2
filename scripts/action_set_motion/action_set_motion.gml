/// @description (Old DnD) - set or add motion
/// @param dir direction
/// @param spd speed
function action_set_motion(argument0, argument1) {
    if (global.__argument_relative)
    {
        // Relative "Set Direction and Speed" adds a motion vector. Adding
        // direction and speed as plain scalars rotated the current velocity
        // every Step (notably Dream gravity), making Sonic accelerate wildly.
        motion_add(argument0, argument1);
    }
    else
    {
        direction = argument0;
        speed = argument1;
    }
}
