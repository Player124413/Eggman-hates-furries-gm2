tailImg+=1;
if (tailImg>=6)
    tailImg-=6;

angle=danceTa.angle+172;

if (angle>=360)
    angle-=360;
    
c=danceTa.c+mc/2;
if (c>=mc)
    c-=mc;
    
if (cos(degtorad(angle))>0)
    depth=1;
else
    depth=-1;
