repeat( 1+round(random(2)) )b=0;
with sparkables
    {
    other.a[other.b]=id;
    other.b+=1;
    }
//for(i=0; i<b; i+=1)
c=floor(random(b));
do
d=floor(random(b));
until (d!=c);

i=instance_create(a[c].x0,a[c].y0,objElArc);
i.x2=a[d].x0;
i.y2=a[d].y0;
var __b__;
__b__ = action_if_dice(2);
if __b__
{
soundplay(global.sndElectric1);
}
else
{
soundplay(global.sndElectric2);
}
