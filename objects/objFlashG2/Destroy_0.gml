var __b__;
__b__ = action_if(explosive==0);
if __b__
{
var timer,lol;
timer=1; lol=1;
        soundvolume(global.sndJump,timer/lol);
        soundvolume(global.sndRoll,timer/lol);
        soundvolume(global.sndSpin,timer/lol);
        soundvolume(global.sndDash,timer/lol);
        soundvolume(global.sndStop,timer/lol);
        soundvolume(global.sndRing,timer/lol);
        soundvolume(global.sndLoseRing,timer/lol);
        soundvolume(global.sndLand2,timer/lol);
        soundvolume(global.sndClank,timer/lol);
        soundvolume(global.sndSpjoing,timer/lol);
        //remember to reset these when someone dies
        soundvolume(global.handle,timer/lol);
        soundvolume(global.sndChopper,timer/lol);
}
