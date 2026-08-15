var __b__;
__b__ = action_if(rain>0);
if __b__
{
rainmove+=9;
if (rainmove>=192)
    rainmove-=192;
    
px=-rainmove-192;
py=(rainmove*4 mod 192)-192;


draw_set_blend_mode(bm_add);
while (px<640)
    {
    yy=py;

    while (yy<480)
        {
        draw_background_ext(bgRain,px,yy,1,1*2,0,c_white,rain);
        yy+=192;
        }
    px+=192;
    }
draw_set_blend_mode(bm_normal);
}
