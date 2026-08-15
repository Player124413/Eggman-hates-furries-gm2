timer+=1;
if (timer>0 && timer mod 2 ==0 && timer<70)
    {
    soundstop(global.sndHit);
    soundplay(global.sndHit);
    i=instance_create(x-16+random(32),y-16+random(32),objFaceExplosion);
    i.z=-24+timer*3;
    i.image_xscale=0.1+0.15/(1+timer/20);
    i.image_yscale=0.1+0.15/(1+timer/20);
    }
