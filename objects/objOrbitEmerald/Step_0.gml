action_set_relative(0);
if (!instance_exists(p))
{
    instance_destroy();
    exit;
}
var __b__;
__b__ = action_if(active==0);
if __b__
{
image_blend=controlbg.emerald_c[index];
}
active = 1;
__b__ = action_if(prog<1);
if __b__
{
{
prog = (prog*9+1*global.time)/(9+global.time);
{
action_set_relative(1);
prog += global.time/90;
action_set_relative(0);
}
}
}
else
{
prog = 1;
}
sid+=global.time*sp;
cod+=global.time*sp*1.01;

if (sid>2*pi)
    sid-=2*pi;

if (cod>2*pi)
    cod-=2*pi;
if (cod>pi)
    depth=p.depth+1;
else
    depth=p.depth-1;
action_set_relative(0);
