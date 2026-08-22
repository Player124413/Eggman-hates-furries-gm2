if (!instance_exists(i1) || !instance_exists(i2) || !instance_exists(i3)
    || !instance_exists(i4) || !instance_exists(i5) || !instance_exists(i6))
    exit;

var h,v,h2,v2,c,d;
h=-32*sin(angle);
v=+32*cos(angle);
for(i=0.5; i<5.5; i+=1)
    {
    draw_sprite_ext(sprite_index,min(2,floor(i)),x+h*((1-prog)*5+i),y+v*((1-prog)*5+i),1,1,-radtodeg(angle),mycolor,1);
    draw_sprite_ext(sprite_index,min(2,floor(i)),x-h*((1-prog)*5+i),y-v*((1-prog)*5+i),1,-1,-radtodeg(angle),mycolor,1);
    }
h2=-16*sin(angle+pi/2);
v2=+16*cos(angle+pi/2);
c=(1-prog)*5;
d=6;
i1.x=x+c*h+h2;
i1.y=y+c*v+v2;
i1.x2=x+c*h-h2;
i1.y2=y+c*v-v2;
with i1//BOTTOM FLOOR
    event_perform(ev_alarm,0);
i2.x=x+d*h+h2;
i2.y=y+d*v+v2;
i2.x2=x+(c)*h+h2;
i2.y2=y+(c)*v+v2;
with i2
    event_perform(ev_alarm,0);
i3.x=x+(c)*h-h2;
i3.y=y+(c)*v-v2;
i3.x2=x+d*h-h2;
i3.y2=y+d*v-v2;
with i3
    event_perform(ev_alarm,0);

i4.x=x-c*h-h2;
i4.y=y-c*v-v2;
i4.x2=x-c*h+h2;
i4.y2=y-c*v+v2;
with i4//TOP FLOOR
    event_perform(ev_alarm,0);
i5.x=x-d*h-h2;
i5.y=y-d*v-v2;
i5.x2=x-c*h-h2;
i5.y2=y-c*v-v2;
with i5
    event_perform(ev_alarm,0);
i6.x=x-c*h+h2;
i6.y=y-c*v+v2;
i6.x2=x-d*h+h2;
i6.y2=y-d*v+v2;
with i6
    event_perform(ev_alarm,0);


