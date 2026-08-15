image_angle = 330;
for(a=0; a<32; a+=4)
    {
    for(b=0; b<12; b+=4)
        {
        i=instance_create(x-16+a,y-6+b,objHaloPieces);
        i.depth=-9;
        i.l=a;
        i.t=b;
        i.w=4;
        i.h=4;
        i.hspeed=(a-16)/32;
        i.vspeed=(b-4)/32;
        }    
    }
