var __b__;
__b__ = action_if(phase==0);
if __b__
{
objtails2.vspeed=0;

timer+=global.time;
if (timer>=45 && phase==0)
    {objtails2.x=x+20;
    objtails2.y=y-480;
    objtails2.vspeed=10;
    phase=1;
    timer=0;}
    
if (blink==0)
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) + (8) );
else
    __view_set( e__VW.YView, 0, __view_get( e__VW.YView, 0 ) - (8) );
    
}
action_move_to(x, (y/global.time+ystart+32)/(1/global.time+1));
__b__ = action_if(phase==1);
if __b__
{
timer+=global.time;

if (timer==160)
    {
    i=instance_create(nnx+400,nny-128,objFlashG1);
    i.hspeed=-8;
    i.vspeed=-4;
    
    }
}
__b__ = action_if(frac(timer)==0);
if __b__
{
i=instance_create(x+32,y-16,objsmoke);
i.vspeed=random(1);
i.hspeed=1+random(1)
}
blink = 1-blink;
__b__ = action_if(timer mod 30 <1 && random(2)<0.3);
if __b__
{
i=instance_create(x+26,y-22,objelectric);
i.depth=1;
if (random(2)<1)
    soundplay(global.sndElectric1);
else
    soundplay(global.sndElectric2);
//mogen
}
