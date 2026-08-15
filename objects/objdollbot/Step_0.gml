x+=hspeed*(2*global.time-1);
y+=vspeed*(2*global.time-1);
var __b__;
__b__ = action_if(phase>0);
if __b__
{
//speed-=0.01*speed*speed;
if (speed<0) speed=0;

if(y>y0-height)
    {
    vspeed-=0.075*floater;
    }
else
    {
    vspeed+=0.075*floater;
    }
    
if(atk==0)//jes' hanging out
    doll_hang();
if(atk==1)
    doll_sweep();
if(atk==2)
    doll_spin();
if(atk==3)
    doll_eyebeams();
if(atk==4)
    doll_ooze();
if(atk==5)
    doll_sunshine();
if(atk==6)
    doll_entangle();
}
ground.x=x0-144;
ground.x2=x1+144;
with ground
    event_perform(ev_alarm,0);
if(invulnerable>0)
    {invulnerable-=1;
    visible=objdoll.blink;}
else
    {invulnerable=0;
    visible=1;}
__b__ = action_if(shield);
if __b__
{
if (point_distance(x,y,sonic.x,sonic.y)<40)
    {sonic.damaged=1;
    sonic.damagex=x;
    sonic.damagey=y;}
}
__b__ = action_if(instance_exists(objassessment));
if __b__
{
objassessment.x=x;
objassessment.y=y;
}
