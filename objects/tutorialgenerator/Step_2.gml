var __b__;
__b__ = action_if(phase<8);
if __b__
{
var a,xxx,yyy;
a=nu-1;
repeat(nu-1)
{xv[a]=xv[a-1];
a-=1;}
xv[a]=xss;

if yss>xmax
xmax=yss;
a=0;
repeat(nu-1)
{vh[a]=vh[a+1];
yv[a]=yv[a+1]-vh[a];
a+=1;}

vh[a]=(480/nu)*(1+(yss/(xmax*10)));
yv[a]=480-vh[a];

xss+=hss*global.time;
if (xss>0)
    hss-=0.003*global.time;
else
    hss+=0.003*global.time;

yss+=vss*global.time;
if (yss>0)
    vss-=0.003*global.time;
else
    vss+=0.003*global.time;
    
xxx=__view_get( e__VW.XView, 0 );
yyy=__view_get( e__VW.YView, 0 );
a=0;
repeat(nu)
{
__view_set( e__VW.HView, a, vh[a] )
__view_set( e__VW.XView, a, xxx+xv[a] );
__view_set( e__VW.YView, a, yyy+yv[a] );
a+=1;}
}
