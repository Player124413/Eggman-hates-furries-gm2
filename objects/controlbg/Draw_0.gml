var __b__;
__b__ = action_if(lev<2 && lev>-10 && on);
if __b__
{
draw_rectangle_color(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,c_aqua,c_aqua,c_blue,c_blue,0);

h1=640*floor(__view_get( e__VW.XView, 0 )/640)+posMod(__view_get( e__VW.XView, 0 )/1.16,640);
v1=480+__view_get( e__VW.YView, 0 )/1.16;


h2=320*floor(__view_get( e__VW.XView, 0 )/320)+posMod(__view_get( e__VW.XView, 0 )/1.21,640);
v2=512+__view_get( e__VW.YView, 0 )/1.21;

h3=640*floor(__view_get( e__VW.XView, 0 )/640)+posMod(__view_get( e__VW.XView, 0 )/1.4,640);
v3=800+__view_get( e__VW.YView, 0 )/1.4;

h4=640*floor(__view_get( e__VW.XView, 0 )/640)+posMod(__view_get( e__VW.XView, 0 )/1.6,640);
v4=1600+__view_get( e__VW.YView, 0 )/1.6;


draw_set_blend_mode(bm_add);
draw_background(bgskies,h1-640,v1);
draw_background(bgskies,h1,v1);
draw_background(bgskies,h1+640,v1);
draw_background_ext(bgskies,h2-640,v2,0.5,0.5,0,c_white,1);
draw_background_ext(bgskies,h2-320,v2,0.5,0.5,0,c_white,1);
draw_background_ext(bgskies,h2,v2,0.5,0.5,0,c_white,1);
draw_background_ext(bgskies,h2+320,v2,0.5,0.5,0,c_white,1);
draw_background_ext(bgskies,h2+640,v2,0.5,0.5,0,c_white,1);
draw_set_blend_mode(bm_normal);

draw_background(bgstone,h3-640,v3);
draw_background(bgstone,h3,v3);
draw_background(bgstone,h3+640,v3);

c=make_color_rgb(16,10,8)
draw_set_color(c_white);
draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(__view_get( e__VW.XView, 0 ),v3+230,c_black,1);
draw_vertex_color(__view_get( e__VW.XView, 0 )+640,v3+230,c_black,1);
draw_vertex_color(__view_get( e__VW.XView, 0 ),max(v4,__view_get( e__VW.YView, 0 )+512),c,1);
draw_vertex_color(__view_get( e__VW.XView, 0 )+640,max(v4,__view_get( e__VW.YView, 0 )+512),c,1);
draw_primitive_end();

}
__b__ = action_if((lev>=11 && lev<15) && on);
if __b__
{
var a,aa1,aa2,b,bb1,bb2,c1,c2;
c1=64;
c2=80;
aa=__view_get( e__VW.XView, 0 )*0.1 mod c1 + c1*(__view_get( e__VW.XView, 0 ) div c1 -1);
bb=__view_get( e__VW.YView, 0 )*0.1 mod c1 + c1*(__view_get( e__VW.YView, 0 ) div c1 -1);

for(a=aa; a<__view_get( e__VW.XView, 0 )+640; a+=c1)
    for(b=bb; b<__view_get( e__VW.YView, 0 )+480; b+=c1)
        draw_background(bgCave1,a,b);

aa=__view_get( e__VW.XView, 0 )*0.1 mod c2 + c2*(__view_get( e__VW.XView, 0 ) div c2 -1);
bb=__view_get( e__VW.YView, 0 )*0.1 mod c2 + c2*(__view_get( e__VW.YView, 0 ) div c2 -1);

for(a=aa; a<__view_get( e__VW.XView, 0 )+640; a+=c2)
    for(b=bb; b<__view_get( e__VW.YView, 0 )+480; b+=c2)
        draw_background(bgCave2,a,b);
}
__b__ = action_if((lev==15 || lev==16) && on);
if __b__
{
var a,aa,aa,c1,k,lh,lv;
c1=128;
aa=/*view_xview*0.1 mod c1 + */c1*(__view_get( e__VW.XView, 0 ) div c1 -1);
bb=/*view_yview*0.1 mod c1 + */c1*(__view_get( e__VW.YView, 0 ) div c1 -1);

lh=__view_get( e__VW.XView, 0 )*scrollFactor mod 512;
if(fixedStars)
    lv=objCraft2.yy-428;
else
    lv=__view_get( e__VW.YView, 0 )-256-(__view_get( e__VW.YView, 0 )*scrollFactor mod 512);
if(minbgy!=-1 || lev==16)
    {
    draw_background(bgsky,__view_get( e__VW.XView, 0 )-lh,lv);
    draw_background(bgsky,__view_get( e__VW.XView, 0 )+512-lh,lv);
    draw_background(bgsky,__view_get( e__VW.XView, 0 )+1024-lh,lv);
    }
if(lev<16)
    {
    for(a=aa; a<__view_get( e__VW.XView, 0 )+640; a+=c1)
        for(b=bb; b<__view_get( e__VW.YView, 0 )+480; b+=c1)
            {
            if(minbgy==-1 || b>=minbgy)
                draw_background(bgCavity1,a,b);
            else if(b>minbgy-c1)
                {
                k=b-minbgy+c1;
                draw_background_part(bgCavity1,0,128-k,128,k,a,minbgy);
                }
            }
    }
/* */
}
/*  */
