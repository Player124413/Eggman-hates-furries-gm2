action_create_object(ubgline, 0, 256);
action_create_object(ufore, 0, 0);
action_create_object(objRean, 96, 64);
action_create_object(sonails, 288, ubgline.y-16);
__view_set( e__VW.YView, 0, 0 );
__view_set( e__VW.XView, 0, 0 );
global.time=0.5;

xx=240;
/*lol=48;
while (xx<800)
    {
    i=instance_create(xx+lol,ubgline.y+128,rotBlock);
    i.wr=lol;
    xx+=2*lol;
    lol=16+16*floor(random(3));
    }
*/    
fx=0;
fxSpeedup=0;
camLock=-1;
nextCamLock=-1;

background_set_alpha_from_background(bgDustBottom,bgDustAlpha);

global.handle=SS_LoadSound("SuperUltraViolet2.ogg");
SS_LoopSound(global.handle);
/* */
phase = 0;
/* */
count = -1;
/* */
viewX = 0;
/* */
blink = 0;
/* */
trigger = 0;
/* */
tinyX = -1;
/* */
eightstage=0;

soundloop(global.sndQuake);
soundvolume(global.sndQuake,0.7);
/* */
shaking = 0;
/* */
shakeX = -600;
/* */
shakeInt = 2;
/* */
windVol = 0;
/* */
with objectfg
    instance_destroy();//Don't need and it caused bugs
/* */
viewPlus = 0;
/* */
/*  */
