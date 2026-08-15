if(gnd>0 && able)
{
if((((sprite_index==sduck) || dash>0)) && ((controlbg.lev==2 && standcount>3) || (standcount>6 && abs(ts)<0.6) || standcount>12))
    {
    if (dash==0)
        {dash+=1;
        myfish=instance_create(x,y,objdashfish);
        myfish.p=id;
        myfish.image_xscale=image_xscale;
        myfish.image_angle=image_angle;}
    
    if(dash<6)
    dash+=1;
    sprite_index=sdash;
    //soundvelocity(global.sndSpin,0,120-dash*30);
    soundfrequency(global.sndSpin,0.15+dash/40);
    soundplay(global.sndSpin);
    }
else if (sprite_index!=sduck)//That was annoying
    {
    soundplay(global.sndJump);
    hspeed+=nx*jump;
    vspeed+=ny*jump;
    x+=nx*4;
    y+=ny*4;
    roll=0;
    sprite_index=sjump;
    gnd=0;
    image_speed=1;
    }
}
