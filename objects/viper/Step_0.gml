x-=hspeed*(1-global.time);
y-=vspeed*(1-global.time);

prog+=global.time*speed/len;

while (prog>=1)
    {
    for(a=num-1; a>0; a-=1)
        {
        px[a]=px[a-1];
        py[a]=py[a-1];
        }
    prog-=1;
    px[0]=x-(prog*len*hspeed/speed);
    py[0]=y-(prog*len*vspeed/speed);
    

    }
//
d=point_distance(x,y,__view_get( e__VW.XView, 0 )+320,__view_get( e__VW.YView, 0 )+240);
soundvolume(global.sndViper,1/(1+d/3000))
var d,s,h,v,obj,ind;
if ((x>__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )-256 || (y<__view_get( e__VW.YView, 0 ) && introgenerator.slope>60)) && phase==0)
    phase=1;
if (phase==0)
    {
    rocketTimer=0;
    if instance_exists(bike)
        obj=bike;
    else
        obj=objIntroSonic;
    xx=max(obj.x+lengthdir_x(128,introgenerator.slope+90),xx+lengthdir_x(9.9,introgenerator.slope+4*sin(xx/100)));
    yy=min(obj.y+lengthdir_y(128,introgenerator.slope+90),yy+lengthdir_y(9.9,introgenerator.slope+4*sin(xx/100)));
    d=point_direction(x,y,xx,yy);
    s=min(max(minima,obj.speed+minima),point_distance(x,y,xx,yy)/10);
    h=lengthdir_x(s,d);
    v=lengthdir_y(s,d);
    hspeed=approach(hspeed,8,h,1);
    vspeed=approach(vspeed,8,v,1);
    }
else if (phase==1)
    {
    direction+=global.time*6;
    speed=(speed*8+global.time*16)/(8+global.time);
    if(x<__view_get( e__VW.XView, 0 )+288 && direction<10)
        phase=0;
    if(instance_exists(bike))
        {
        if(bike.able)
            {
            if (rocketTimer<20)
                {
                if (rocketTimer mod 7 == 0)
                    {
                    ind=rocketTimer div 7;
                    i=instance_create(tailx[ind],taily[ind],objVipRocket);
                    i.image_angle=taild[ind]+45;
                    i.speed=speed;
                    i.direction=direction;
                    i.xx=bike.x+bike.hspeed*10;
                    i.yy=bike.y+bike.vspeed*10;
                    i.turnsp=10;

                    with i
                        {
                        motion_add(image_angle,8);
                        }
                    }
                rocketTimer+=global.time;
                }
            }
        }
    }
else if (phase==2)
    {
    d=point_direction(x,y,xx,yy);
    s=min(minima+8,point_distance(x,y,xx,yy)/10);
    h=lengthdir_x(s,d);
    v=lengthdir_y(s,d);
    hspeed=approach(hspeed,32,h,1);
    vspeed=approach(vspeed,32,v,1);
    }
else if (phase==3)
    {
    obj=objIntroEmerald;
    xx=obj.x+lengthdir_x(54,introgenerator.slope+90);
    yy=obj.y+lengthdir_y(54,introgenerator.slope+90);
    d=point_direction(x,y,xx,yy);
    s=min(max(minima,obj.speed+minima),point_distance(x,y,xx,yy)/(20-2*zuppa));
    h=lengthdir_x(s,d);
    v=lengthdir_y(s,d);
    hspeed=approach(hspeed,28-2*zuppa,h,1);
    vspeed=approach(vspeed,28-2*zuppa,v,1);
    //if (zuppa>6.1)
    //    soundvolume(global.handle,0.95*(1-power((zuppa-6.1)/3,2)));
    if (zuppa<9.1)
        zuppa+=global.time/30;
    else
        zuppa=9.1;
    if(zuppa<6)
        rocketTimer=0;
    if (zuppa>6 && rocketTimer<20)
        {
        if (rocketTimer mod 7 == 0)
            {
            ind=rocketTimer div 7;
            i=instance_create(tailx[ind],taily[ind],objVipRocket);
            i.image_angle=taild[ind]+45;
            i.hspeed=hspeed;
            i.vspeed=vspeed;
            i.xx=-128+64*ind;
            i.yy=128-64*ind;
            i.obj=objIntroSonic;
            with i
                {
                motion_add(image_angle,8);
                }
            }
        rocketTimer+=global.time;
        }
    if (zuppa>7 && handProg<1)
        {
        handProg+=global.time/30;
        }
    }
