var c,b;
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;

image_angle=dir;
if(!dead)
{
drillSpeed=speed/2;
c=min(drillSpeed/12,1);
b=1/(1+point_distance(x,y,sonic.x,sonic.y)/2560)
soundfrequency(global.sndRobot,0.7*c);
vol=b;
soundvolume(global.sndRobot,b*(1-power(1-c,3)));

drillImg+=global.time*drillSpeed;
if (drillImg>=8)
    drillImg-=8;
//
drillAngle=dir;

if ((destined==2 && layerPlus>-15) || (destined==0 && layerPlus>0))
    layerPlus-=global.time;
if ((destined==1 && layerPlus< 15) || (destined==0 && layerPlus<0))
    layerPlus+=global.time;

layerAngle=drillAngle+180+layerPlus;
    
mineX=xx+lengthdir_x(52,layerAngle+5);
mineY=yy+lengthdir_y(52,layerAngle+5);


d=point_distance(xp,yp,x,y);
while(d>8)
    {//instance_create(x,y,object15);
    xp+=(x-xp)*8/d;
    yp+=(y-yp)*8/d;
    current=upCyclic(current+1,9);
    pos=upCyclic(pos+1,9);
    px[current]=xp;
    py[current]=yp;
    d=point_distance(xp,yp,x,y);
    }
prog=d/8;
xx=px[upCyclic(pos+1,9)]*(prog)+px[pos]*(1-prog)+hspeed*global.time;
yy=py[upCyclic(pos+1,9)]*(prog)+py[pos]*(1-prog)+vspeed*global.time;
}

eightstage+=1;
if(eightstage>=8)
    eightstage=0;
stableCycle+=global.time;
if(stableCycle>=8)
    stableCycle=0;
var __b__;
__b__ = action_if(!dead);
if __b__
{
drillScript(x,y);
}
blink = !blink;
__b__ = action_if(on);
if __b__
{
__b__ = action_if(x-(radius+128)<__view_get( e__VW.XView, 0 )+640 && y-(radius+128)<__view_get( e__VW.YView, 0 )+480 && x+(radius+128)>__view_get( e__VW.XView, 0 ) && y+(radius+128)>__view_get( e__VW.YView, 0 ) || (instance_exists(controlbg) && controlbg.outsideOn));
if __b__
{
var a,b,c,d;
with (movable)
    {
    a=point_direction(other.xx,other.yy,x,y);
    
    c=point_distance(other.hspeed,other.vspeed,hspeed,vspeed);
    d=point_direction(other.hspeed,other.vspeed,hspeed,vspeed);
    b=-lengthdir_x(c,d-a);
    if(point_distance(x,y,other.xx,other.yy)<=radius+other.radius+b+min(4,c/8) && object_index!=robot && object_index!=objredlaser)
        {
        motion_add(a,b);
        
        x=other.xx+lengthdir_x(radius+other.radius,a);
        y=other.yy+lengthdir_y(radius+other.radius,a);
        
        e=lengthdir_x(c,d-(a-90));
        hspeed-=ux*sign(e)*min(abs(e),abs(b)*frict*other.frict);
        vspeed-=uy*sign(e)*min(abs(e),abs(b)*frict*other.frict);
        
        //inherit normal, set ground
        if(gnd!=2)
            {nullh=other.hspeed;
            nullv=other.vspeed;
            ux=cos(degtorad(a-90));
            uy=-sin(degtorad(a-90));
            nx=cos(degtorad(a));
            ny=-sin(degtorad(a));
            gnd=2;}
        }
    }
}
}
