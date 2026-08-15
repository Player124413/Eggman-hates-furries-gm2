if (phs==0)
c+=global.time/100;
if (c>1)
phs=1;
if (phs==1)
c-=global.time/100;
if (c<0)
instance_destroy();

