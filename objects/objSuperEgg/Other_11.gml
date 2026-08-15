
if (lProg<30)
{
if (lazor==0)
    soundplay(global.sndBigGun);

xx=x-32;
yy=y+12;
lazor=1;
sprite_index=sprSuperEgg5;
lazorDir=225;
alarm[0]=2;

if (lProg mod 4 == 0)
    {
    i=instance_create(x-(384-y),384, objNuke);
    soundplay(global.sndGunstar1);
    }
}
