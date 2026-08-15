instance_create(xx-128,yy,objCavityLight);

with greatbrown
    {
    instance_destroy();
    }
with greattexture
    {
    if(y2>__view_get( e__VW.YView, 0 )+480 && y>__view_get( e__VW.YView, 0 )+480)
        instance_destroy();
    }
with (rockline)
    {
    if(y2>__view_get( e__VW.YView, 0 )+480 && y>__view_get( e__VW.YView, 0 )+480)
        {
        with (i)
            instance_destroy();
        instance_destroy();
        }
    }
count+=1;
if(count==1)
    {
    makeCavityV(-32,-320,1280);
    makeCavityV(48,-320,1280);
    makeCavityV(0,-480,1280);
    makeCavityV(-16,-160,1280);
    }
else if(count==2)
    {
    makeCavityV(32,-320,1280);
    makeCavityV(64,-640,1280);
    }
else if(count==3)
    {
    makeCavityV(32,-320,1280);
    }
else if(count==4)
    {
    makeCavityV(-40,-320,1280);
    makeCavityV(-80,-320,1280);
    }
else if(count==5)
    {
    makeCavityV(-16,-320,1280);
    makeCavityV(0,-640,1280);
    soundplay(global.sndBigGun);
    }
else if (count==6)
    {
    soundplay(global.sndAfterBurnerLong);
    makeCavityV(4,-1280,1280);
    a=0;
    for(j=0; j<60-global.zeroRingMode*30-sonic.rings; j+=1;)
        {
        instance_create(xx-128,yy-j*24-a,objring);
        a=128*(j div 8);
        }
    }
else if(count==11)
    {
    makeCavityV(4,-1280,1280);
    i=instance_create(xx-256,yy,metaline);
    i.x2=xx;
    i.y2=yy;
    i.deep=0;
    phase=5;
    timer=0;
    count=0;
    i=instance_create(xx,yy,objStatic);
    i.depth=3;
    i.sprite_index=sprCavityExit;
    i=instance_create(xx-2816,yy,objLimitedGrass);
    i.x2=xx-256;
    i=instance_create(xx,yy,objLimitedGrass);
    i.x2=xx+1600;
    controlbg.minbgy=yy;
    }
else
    {
    makeCavityV(0,-1280,1280);
    }
