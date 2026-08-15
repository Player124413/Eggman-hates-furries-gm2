fixSpeeds();
frictionize();
vspeed+=g*global.time;

vol+=(global.time/150);
if (vol>1)
    vol=1;
soundvolume(global.handle,1-power(vol,4));
var __b__;
__b__ = action_if(x<__view_get( e__VW.XView, 0 )-1280);
if __b__
{
introgenerator.whiteOut = 1;
}
