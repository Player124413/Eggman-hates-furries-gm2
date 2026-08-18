xx=-640;
yy=1280;

phase=0;
timer=0;
uberphase=0;

slope=45;
count=0;

// Route markers are written while phases 4/6 generate the level and read on
// later Step frames in phase 7. They must be instance variables, not locals.
rxx = xx;
ryy = yy;
mxx = xx;
myy = yy;

surf=surface_create(640,480);

rainmove=0;
action_create_object(objBG, 0, 0);
txtAlpha = 0;
textTime = 0;
textProg = 0;
baseSurf=surface_create(320,960);
textSurf=surface_create(320,480);
txt="";

// Runtime duplicates are created by presentation's Game Start event because
// modern GameMaker does not allow modifying asset sprites directly.
upperGrad = global.upperGradSprite;
lowerGrad = global.lowerGradSprite;
/*background_delete(bgGradient);//is done at presentation
background_delete(bgGradient2);*/

/* */
tutorialText = "";
/* */
tutorialBlink = 0;
/* */
action_set_alarm(30, 0);
uninterruptableTimer = 0;
/* */
var __b__;
__b__ = action_if(global.introProg==4);
if __b__
{
event_user(7);
event_user(4);
with bike 
    instance_destroy();
i=instance_create(320,240,objIntroSonic);
i.hspeed=40;
i.vspeed=-40;
i.sprite_index=srun;


/* */
}
__b__ = action_if(global.introProg==3);
if __b__
{
moveBike(0,0);
event_user(7);
event_user(3);

/* */
}
__b__ = action_if(global.introProg==2);
if __b__
{
moveBike(0,0);
event_user(7);
event_user(2);


/* */
}
__b__ = action_if(global.introProg==1);
if __b__
{
moveBike(-80,-80);
event_user(7);
event_user(1);

/* */
}
maxCam = -1;
/* */
whiteOut = 0;
/* */
white = 0;
/* */
newText = false;
/* */
/*  */
