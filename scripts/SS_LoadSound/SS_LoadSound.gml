function SS_LoadSound(argument0) {
	// Load a sound by filename -> bundled audio asset index.
	// argument0: e.g. "sound/sndThunder1.wav", "Library.ogg", "Sunshine.ogg"
	// return:   asset index, or -1 if the asset is missing.
	var _name, _base, _ext;
	_name = argument0;
	if (is_real(_name)) return -1;
	if (!is_string(_name)) return -1;

	_base = filename_name(_name);
	_ext  = filename_ext(_name);
	if (_ext != "")
	{
	    _base = string_delete(_base, string_length(_base) - string_length(_ext) + 1,
	                          string_length(_ext));
	}
    // Legacy MIDI filenames do not always match their converted sound asset
    // names, and Sunshine has both OGG and MIDI variants.
    var _lower = string_lower(_base);
    var _ext_lower = string_lower(_ext);
    var _is_midi = (_ext_lower == ".mid" || _ext_lower == "mid");
    if (_is_midi)
    {
        switch (_lower)
        {
            case "foxface":   _base = "FoxFace"; break;
            case "sulfur":    _base = "game"; break;
            case "orsmovr":   _base = "OrSmovrBos"; break;
            case "forbossen": _base = "ForBossenRepShort"; break;
            case "yellowspot":_base = "Spot"; break;
            case "timer":     _base = "oxygen"; break;
            case "sunshine":  _base = "SunshineMidi"; break;
        }
    }
    return asset_get_index(_base);



}
