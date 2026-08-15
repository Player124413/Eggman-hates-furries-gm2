var __b__;
__b__ = action_if(on);
if __b__
{
r+=ra;
if r<128
ra+=0.15;
else
ra-=0.15;
if ba=1
b+=1;
else
b-=1;
if b>253
ba=0;
if b<3 
ba=1;
g+=ga;
if g<128
ga+=0.35;
else
ga-=0.35;
__background_set_colour( make_color_rgb(r,g,b) )
}
