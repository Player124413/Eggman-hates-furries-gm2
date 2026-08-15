x+=hs*sp*sc;
y+=vs*sp*sc;
prop+=sp*37;

tailImg+=sp/7;
if (tailImg>=3)
    tailImg-=3;
//
if (freq>-0.04)
    freq-=fuu*sp/4000;
fuu=fuu*650/(650+sp)

soundfrequency(global.sndEngine,0.22+freq);

sc=sc/(1+ku*sp/100)

angle+=rotsp*sp;
if (timer>150)
    {
    if (ku>0)
        ku-=sp/300;
    if (lul<1)
        lul+=sp/60;
    vs-=lul*sp/28;
    hs+=lul*sp/80;
    if (angle<1)
    rotsp+=sp/600;
    }
if(timer<215)
    {
    instance_create(x-192*sc,y+16+155*sc,objTakeOffSmoke);
    }
else
    {
    if (vol>0)
        {vol-=sp/600;
        if (vol<=0)
            vol=0;
        soundvolume(global.sndEngine,0.9*(1-power(1-vol,3)));
        }
    }

image_angle=angle;
image_xscale=sc;
image_yscale=sc;

timer+=sp;

if (timer>815)//600
    {
    //objectfg.darkness+=1/215;
    //if (objectfg.darkness>=1)
    make=1;
    instance_destroy();
    }
w=background_get_width(fgLand);
h=background_get_height(fgLand);

if surface_exists(surf)
    surface_free(surf);

surf=surface_create(w,h);
surface_set_target(surf);

draw_background(fgLand,0,0);
draw_sprite_ext(planeShadowSprite, 0, x, y - 288, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

gpu_set_blendmode_ext(13,0);
draw_background(fgLand,0,0)

draw_set_blend_mode(bm_normal);
surface_reset_target();
