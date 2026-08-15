var a,b,c;
uu=instance_create(xx,yy,line);
uu.y2=uu.y;
dd=instance_create(xx,yy+16,line);
dd.y2=dd.y;

ss=instance_create(xx,yy+16,line);
ss.y2=ss.y-16;
ss.x2=ss.x;



c=0;
b=xx;
while (b<xx+len)
    {
    i=instance_create(b,yy,objStatic);
    i.sprite_index=sprlavawalk;
    i.depth=-7;
    c+=1;
    if (c>3)
        {
        c=0;
        a=yy;
        while (a<objLava.y)
            {
            i=instance_create(b,a,objLavaGirder);
            i.image_angle=270;
            a+=64;
            }
        }
    b+=32;
    }
//
dd.x2=b;
uu.x2=b;

ss=instance_create(b,yy,line);
ss.y2=ss.y+16;
ss.x2=ss.x;
