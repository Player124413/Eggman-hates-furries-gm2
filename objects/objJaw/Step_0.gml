//var goal;
x+=hspeed*(2*global.time-1);
y+=vspeed*(2*global.time-1);

if (pendulum)   
    {dir[0]=point_direction(x,y,chopper.x,chopper.y);
    vspeed+=0.3*global.time;
    motion_add(dir[0],speed*cos(degtorad(dir[0]+180-direction)));
    
    goal=dir[0]+180;
    
    goal = goal mod 360;
    final= final mod 360;
    
    while (final>270 && goal<90)
    final-=360;
    while (final<90 && goal>270)
    final+=360;
    
    final=(final*9+goal)/10;

    radius=32;
    }
else
    {radius=-32;//avoid collisions.
    speed=0;}
x=chopper.x-lengthdir_x(dist,dir[0]);
y=chopper.y-lengthdir_y(dist,dir[0]);

pspeed=speed;
if (chopper.phase==1 && dir[0]>10)
    {
    dir[0]-=1;    
    final-=2;
    }
var k;
if(gnd==2)
    {

    if (uy<0)
        {ux=-ux;
        uy=-uy;}
        
        
        
        if (chopper.life>0 || pspeed>1 || lasthit)
            {if (chopper.life<=0 && abs(nx)<0.5)
                lasthit=0;
            a=floor(random(3));
            if (a==0)
            soundplay(global.sndMetal1);
            else if (a==1)
            soundplay(global.sndMetal2);
            else soundplay(global.sndMetal3);
            k=1;}
        else
            k=0;
        
        repeat(k*min(ceil(pspeed*4),40))
            {
            i=instance_create(x-nx*radius+ux*random(40),y-ny*radius+uy*random(40),objspark);
            i.hspeed+=hspeed+nx*12;
            i.vspeed+=vspeed+ny*12;
            i.depth=-1;
            }
    //speed=speed/1.01;
    if(k)
        {hspeed+=nx*(4+speed/12);
        vspeed+=ny*(4+speed/12);}
    if (chopper.life<=0)
        vspeed=vspeed*0.66;
    }
    
if(gnd>0)
    {gnd-=1;}
var __b__;
__b__ = action_if(ik!=-1);
if __b__
{
ik.x=x;
ik.y=y;
with (ik)
    event_perform(ev_alarm,0);
ik.hspeed=hspeed;
ik.vspeed=vspeed;
}
__b__ = action_if(ia!=-1);
if __b__
{
ia.x=x;
ia.y=y;
ia.image_angle=final+open;
}
__b__ = action_if(ib!=-1);
if __b__
{
ib.x=x;
ib.y=y;
ib.image_angle=final-open;
}
visible = chopper.visible;
