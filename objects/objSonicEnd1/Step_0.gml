delay=45;
delay2=60;
timer+=1;
switch (timer)
    {
    case -8:
        i=instance_create(objTailsEnd1.x-100+80,objTailsEnd1.y-32-320,objSingleRain);
        i.destX=objTailsEnd1.x-100;
        i.destY=objTailsEnd1.y-32;
        i.time=20-12;
        break;
    case 0:
        b.img=37;
        break;
    case 2:
        b.img=38;
        break;
    case 4:
        b.img=39;
        break;
    case 6:
        b.img=0;
        break;
     /*
    case 14:
        i=instance_create(480,-64,objSingleRain);
        i.destX=i.x-120;
        i.destY=i.y+480;
        i.time=8;
        break;*/
    case 18:
        i=instance_create(640,-128,objSingleRain);
        i.destX=i.x-120;
        i.destY=i.y+480;
        i.time=7;
        break;   
    case 24:
        i=instance_create(256,-8,objSingleRain);
        i.destX=i.x-120;
        i.depth=-4;
        i.destY=i.y+480;
        i.time=6;
        break;
    
    case 215:
        img=28;
        break;
               
    case 245:
        img=25;
        break;
        
    case 320:
        img=26;
        break;
    case 323:
        img=27;
        break;
        
    case 355:
        b.img=34;
        break;
    case 359:
        b.img=35;
        break;
    case 363:
        b.img=36;
        break;
    case 435:
        objFrontEnd.next=1;
        break;
    }
//

if (timer==30)
    soundloop(global.sndRain);
if (timer>28 && rain<1)
    {
    rain=(timer-28)/30;
    soundvolume(global.sndRain,1-power(1-rain,2));
    objRainEnd.rain=rain;
    }


a=50;
c=3;
if (timer>a && floor((timer-a)/c)<14)
    {
    img=floor((timer-a)/c);
    }    
a=55;
c=2.5;
if (timer==a+c*2+6)
    soundplay(global.sndGetUp);
if (timer>a && floor((timer-a)/c)<15)
    {
    b.img=floor((timer-a)/c);
    }
a=118;
c=3;
if (timer>a && floor((timer-a)/c)<24-15)//untighten grip
    {
    b.img=15+floor((timer-a)/c);
    }
a=108;
c=3;
if (timer>a && floor((timer-a)/c)<18-14)
    {
    img=14+floor((timer-a)/c);
    }    
a=160+delay;    
c=5;
if (timer>a && floor((timer-a)/c)<34-23)
    {
    b.img=23+floor((timer-a)/c);
    }    

a=230+delay+delay2;
c=5;
if (timer>a && floor((timer-a)/c)<25-18)
    {
    img=18+floor((timer-a)/c);
    } 
/* */
image_index=img;
/* */
/*  */
