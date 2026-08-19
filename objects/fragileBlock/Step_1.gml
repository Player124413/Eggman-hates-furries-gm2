if (instance_exists(i))
{
    i.y2 = y + yskew;
    i.x2 = x + width;
    i.hspeed = hspeed;
    i.vspeed = vspeed;
    i.hspeed2 = hspeed;
    i.vspeed2 = vspeed;
}

if (active==0)
    height+=16;
active = 1;
x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);
image_index-=image_speed*(1-global.time);

if (x+width<__view_get( e__VW.XView, 0 )-128)
    instance_destroy();
var __b__;
__b__ = action_if(x<__view_get( e__VW.XView, 0 )+660);
if __b__
{
__b__ = action_if(fragile);
if __b__
{
{
__b__ = action_if(abs(report)>0 && timer==0);
if __b__
{
soundplay(global.sndRaze);
timer=ssp*width*(height+16)/256;
visible=0;

for(a=0; a<width; a+=16)
    {
    skewStart=yskew;
    widthStart=width;
    for(b=16; b<height; b+=16)
        {
        j=instance_create(x+a,y+b+yskew*a/width,ult_fraction);
        j.pp=id;
        j.depth=depth+1;
        j.yskew=16*yskew/width;
        j.ct=merge_color(ct,cb,b/height);
        j.cb=merge_color(ct,cb,(16+b)/height);
        j.timer=timer-ssp*(a/16+((b+16)*width/256));
        }
    }
a=0;
c=ceil(width/16);
b=0;
for(j=0.5; j<c; j+=1)
    {
    if (b) a=c1; else a=c2;
    k=instance_create(x*(c-j)/c+(x+width)*j/c,y*(c-j)/c+(y+yskew)*j/c,ult_fraction);
    k.sprite_index=sgrass2;
    k.image_single=(j-0.5) mod 5;
    k.image_blend=a;
    
    k.pp=id;
    k.depth=depth+1;
    k.timer=timer-ssp*(j/c)*width/16;
    
    k.yskew=16*yskew/width;
    k.ct=merge_color(ct,cb,0);
    k.cb=merge_color(ct,cb,(16)/height);
    
    a+=16;
    b=!b;
    }
}
__b__ = action_if(timer>0);
if __b__
{
timer-=global.time;
if (timer<ssp*widthStart/16)
    {
    width-=16/ssp*global.time;
    yskew-=global.time*skewStart/(ssp*widthStart/16);
    }

if (timer<=0 || width<0)
    {
    instance_destroy();
    }
}
}
}
}
