function soundvelocity(argument0, argument1, argument2) {
	//??

	//arg.0: the sound
	//arg.1: volume offset(0-500 or so) <- that WILL interfere with stuff. make it pan or something?
	//arg.2: relative frequency +- 1000

	SS_SetSoundPan(argument0,-max(-10000,min(10000,8*argument1)));
	SS_SetSoundFreq(argument0,min(100000,max(0,22050-argument2*40)));


}
