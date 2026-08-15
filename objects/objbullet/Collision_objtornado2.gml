other.hx[other.holes]=x-other.x;
other.hy[other.holes]=y-other.y;

i=other.holes;

repeat(50)
    {
    if(other.hy[other.holes]<-16)//!position_meeting(other.x+other.hx[other.holes],other.y+other.hy[other.holes],other))
        {
        other.hx[i]-=hspeed/25;
        other.hy[i]-=vspeed/25;
        }
    }


if(other.hx[i]>-82&&other.hx[i]<20&&position_meeting(other.x+lengthdir_x(other.hx[i],other.dir)+lengthdir_x(other.hy[i],other.dir+90),2+other.y+lengthdir_y(other.hx[i],other.dir)+lengthdir_y(other.hy[i],other.dir+90),other.id))
    {
    other.holes+=1;
    soundplay(global.sndBlth);
    other.alarm[0]=16;
    other.alarm[1]=2;
    }

