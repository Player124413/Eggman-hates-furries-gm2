var __b__;
__b__ = action_if(prog<1);
if __b__
{
prog+=global.time/15;
i=instance_create(x,y-192*prog,objsmoke);
i.depth=depth+1;
if(random(2)<global.time)
{i=instance_create(x-32+random(64),y,objdebris);
i.sprite_index=sprlaserdebris;
i.image_single=random(i.image_number);
i.direction=random(180);
i.speed=random(4)
i.depth=depth;
i.vspeed-=6;
i.rotation=-5+random(10);}
if (prog>=1)
    {
    prog=1;
    soundplay(global.sndCrush);
    }
}
