/// @description Changes the alpha (transparency) of one given background based on the intensity/value map of another.
/// @param ind The index of the background to change the transparency map of.
/// @param back The index of the background to take the transparency map data from.
/// @returns 
function background_set_alpha_from_background(argument0, argument1) {
    // Asset sprites are immutable in modern GameMaker. Legacy backgrounds
    // were mutable, so reproduce that behaviour with a runtime duplicate.
    var result = sprite_duplicate(argument0);
    var alpha_source = sprite_duplicate(argument1);
    sprite_set_alpha_from_sprite(result, alpha_source);
    sprite_delete(alpha_source);
    return result;
}
