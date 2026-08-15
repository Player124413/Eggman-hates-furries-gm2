x=__view_get( e__VW.XView, 0 );
y=__view_get( e__VW.YView, 0 );
var __b__;
__b__ = action_if(instance_exists(sonic));
if __b__
{
global.rings = sonic.rings;
}
__b__ = action_if(instance_exists(objSuperSonic));
if __b__
{
global.rings = objSuperSonic.rings;
}
__b__ = action_if(keyboard_check_direct(vk_tab));
if __b__
{
__b__ = action_if(keyboard_check_direct(vk_alt));
if !__b__
{
if(lastTab==0)
    {
    global.playerWantsControls=!showControls;
    if (global.gameWantsControls && showControls)
        {
        global.playerWantsControls=0;
        lastP=1;
        }
    }
lastTab=1;
}
else
{
lastTab = 0;
}
}
if(fps<room_speed*0.8)
    {
    slowDownTimer+=1;
    if(slowDownTimer>180)
        slowDownMessage=120;
    }
else if(slowDownMessage>0)
    slowDownMessage-=1;
else
    slowDownTimer=0;
