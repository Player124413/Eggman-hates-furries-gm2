load_all_sounds();

globalvar CanYouFeelTheSunshine;
CanYouFeelTheSunshine = SS_LoadSound("Sunshine.ogg");

global.handle="";
global.introProg=0;
global.zeroRingMode=0;
global.tempRingsAllowed=0;//ALWAYS 0 EXCEPT FOR A NANOSECOND

global.upperGradSprite = background_set_alpha_from_background(bgWhite2, bgGradient2);
global.lowerGradSprite = background_set_alpha_from_background(bgWhite, bgGradient);
upperGrad = global.upperGradSprite;
lowerGrad = global.lowerGradSprite;



audio_sound_gain(Samwedo, 0.8, 0);


audio_sound_gain(FoxFace, 0.8, 0);




