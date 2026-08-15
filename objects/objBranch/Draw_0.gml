var __b__;
__b__ = action_if(lol==0);
if __b__
{
var c;

c=1;
if(sp.count mod 13 == 0)
    c=2;

repeat(c)
    {
    endus=0;
    if(lol==0)
        {
        sp.count+=1;
        i=instance_create(x2,y2,objBranch);
        i.p=id;
        i.sp=sp;
        with i
            event_user(0);
        }
    }
lol=1;



}
__b__ = action_if(render);
if __b__
{
var s,c;
draw_set_alpha(alpha*(0.5+super/2));
draw_set_color(make_color_rgb(96,80,128));
draw_set_blend_mode(bm_add);

if(super)
    s=2;
else if(endus==1)
    s=0;
else
    s=1;

for(c=0; c<=s; c+=1)
    {
    draw_set_color(sp.color[c]);
    draw_line(__view_get( e__VW.XView, 0 )*objCloudMaker.scroll+x-s+c,__view_get( e__VW.YView, 0 )*objCloudMaker.scroll+y,__view_get( e__VW.XView, 0 )*objCloudMaker.scroll+x2+c,__view_get( e__VW.YView, 0 )*objCloudMaker.scroll+y2);
    }


draw_set_blend_mode(bm_normal);
draw_set_alpha(1);
}
render = 1;
