goalAngle=constant+option*360/7;

while (goalAngle<0)
    goalAngle+=360;
while (goalAngle>=360)
    goalAngle-=360;
while (rackAngle<0)
    rackAngle+=360;
while (rackAngle>=360)
    rackAngle-=360;

if(up>0 && acc<10)
    acc+=0.5;
else if(up<0 && acc>-10)
    acc-=0.5;
sin1=sin(degtorad(rackAngle-goalAngle));
sin2=sin(degtorad(acc));
if(abs(sin1)<abs(sin2) && sign(sin1)!=sign(sin2) && acc!=0 && cos(degtorad(rackAngle-goalAngle))>0)
    {
    up=0;
    rackAngle=goalAngle;
    acc=0;
    i=instance_create(x+lengthdir_x(192-36,constant),y+lengthdir_y(192-36,constant),objMenuAir);
    i.image_angle=constant+180;
    soundplay(global.sndElevatorStop);
    }
else
    rackAngle+=acc;
c=sin(timer/10);
soundvolume(global.sndDarkO,0.8+0.2*min(1,abs(acc/10)));
soundfrequency(global.sndDarkO,0.15+0.4*min(1,abs(acc/10))+0.05*c);
timer+=1;

