var __b__;
__b__ = action_if(lev==0 || lev==4 || lev==5 || lev==6);
if __b__
{
outsideOn = 0;
}
else
{
outsideOn = 1;
}
x=__view_get( e__VW.XView, 0 );
y=__view_get( e__VW.YView, 0 );
if(lev>global.gameProgress)
    {
    soundplay(global.sndType);
    global.gameProgress=lev;
    save();
    global.saved=1;
    lastLev=lev;
    }
