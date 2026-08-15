var __b__;
__b__ = action_if(following);
if __b__
{
var j;
sonic_log();
j=-1;
with (objMoveLogger)
    {
    if (timer>other.maxt)
        {
        j=id;
        }
    }
    
if (j>-1)
    {
    x=j.x;
    y=j.y;
    image_speed=j.image_speed;
    gnd=j.gnd;
    roll=j.roll;
    dash=j.dash;
    
    if (dash>pdash)
        {
        soundfrequency(global.sndSpin,0.15+dash/40);
        soundplay(global.sndSpin);
        if(myfish==-1)
            {    
            myfish=instance_create(x,y,objdashfish);
            myfish.p=id;
            myfish.image_xscale=image_xscale;
            myfish.image_angle=image_angle;
            }
        }
    if (dash==0 && pdash!=0)
        {
        soundplay(global.sndDash);
        with (myfish)
            kill=1;
        myfish=-1;
        }
    
    if(j.sprite_index==sstand)
        {sprite_index=stailstand;
        image_speed=global.time/5;}
    else if(j.sprite_index==swalk)
        sprite_index=stailwalk;
    else if(j.sprite_index==srun)
        sprite_index=stailrun;
    else if(j.sprite_index==sjump)
        sprite_index=stailroll;
        //image_speed=global.time;}
    else if(j.sprite_index==sstop)
        sprite_index=stailstop;
    else if(j.sprite_index==slookup)
        sprite_index=stailseeup;
    else if(j.sprite_index==sduck)
        {sprite_index=stailduck;
        image_speed=global.time/5;}
    else if(j.sprite_index==sdash)
        sprite_index=stailspin;
    //
      
        if (roll==1 && proll==0)
        soundplay(global.sndRoll);
    if (gnd==0 && sprite_index==stailroll && roll==0 && (psprite!=stailroll || proll==1) && abs(j.hsp-phsp)+abs(j.vsp-pvsp)>2)
        soundplay(global.sndJump);
    if (sprite_index==stailstop && psprite!=stailstop)
       soundplay(global.sndStop);
    if (image_speed==j.image_speed)
        image_index=j.image_index;
    image_xscale=j.image_xscale;        
    image_yscale=j.image_yscale;
    image_angle=j.image_angle;
    image_blend=j.image_blend;
    image_alpha=j.image_alpha;
    
    phsp=j.hsp;
    pvsp=j.vsp;
    
    with (j) instance_destroy();
    }
    
psprite=sprite_index;
proll=roll;
pdash=dash;

if (maek==0 && !instance_exists(objMoveLogger))
    {
    following=0;
    sprite_index=stailstand;
    image_speed=global.time/5;
    image_xscale=1;
    y+=2;
    }
}
