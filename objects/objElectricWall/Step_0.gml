blink = !blink;
var __b__;
__b__ = action_if(r>640);
if __b__
{
action_kill_object();
}
r+=16*global.time;
d=point_distance(xx,yy,objSuperSonic.x,objSuperSonic.y);
s=point_direction(xx,yy,objSuperSonic.x,objSuperSonic.y);
if(d<r+objSuperSonic.radius-8 && d>r-f && (s<maximum-360 || s>minimum || maximum==360))
    {
    superHit();
    soundplay(global.sndBreakDown);
    objSuperFG.light=1;
    instance_destroy();
    }

if (r>384-yy)
    {
    if((timer>=0 && random(4)<global.time) || timer==-16)
        {
        i=instance_create(xx-sqrt(power(r,2)-power(384-yy,2))-32+random(64),384-32+random(64),objSuperExplosion);        
        if(timer==-16)
            soundplay(global.sndExplosion);
        else
            {soundplay(global.sndDarkDestroy);
            i.image_xscale=0.5;
            }
        i.image_yscale=i.image_xscale;
        }
    if (timer mod 2 == 0)
        {
        i=instance_create(xx-sqrt(power(r,2)-power(384-yy,2)),384,objdebris);
        i.sprite_index=sprlaserdebris;
        i.depth=-2;
        i.direction=random(180);
        i.hspeed-=objSuperEgg.spd/2;
        i.image_xscale=0.5+random(0.5);
        i.image_yscale=image_xscale*(0.9+random(0.2));
        i.rotation=-4+random(8);
        }
    timer+=global.time;
    }

