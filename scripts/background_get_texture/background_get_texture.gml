/// @description Returns a repeat-safe texture for a legacy background asset.
/// @param back The background/sprite asset index.
/// @returns {pointer} Texture handle.
function background_get_texture(argument0) {
    // Packed GMS2 sprite pages cannot be repeated with UV values outside 0..1:
    // the whole atlas repeats, producing white blocks and unrelated graphics.
    // A runtime duplicate receives its own texture and matches GM7 backgrounds.
    if (!variable_global_exists("__legacy_background_sprites"))
        global.__legacy_background_sprites = ds_map_create();

    var key = string(argument0);
    var duplicate = noone;
    if (ds_map_exists(global.__legacy_background_sprites, key))
        duplicate = global.__legacy_background_sprites[? key];

    if (!sprite_exists(duplicate))
    {
        duplicate = sprite_duplicate(argument0);
        global.__legacy_background_sprites[? key] = duplicate;
    }

    return sprite_get_texture(duplicate, 0);
}
