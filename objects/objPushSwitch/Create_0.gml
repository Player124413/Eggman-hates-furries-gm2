it=instance_create(x-16,y-32,reportingline);
it.x2=it.x+32;
it.y2=it.y;
//Top should not report

il=instance_create(x-16,y-32,reportingline);
il.x2=il.x;
il.y2=il.y+32;
il.pp=id;

ir=instance_create(x+16,y-32,reportingline);
ir.x2=ir.x;
ir.y2=ir.y+32;
ir.pp=id;

image_single=0;
report = 0;
count = 0;
prog = 0;
timer = 0;
delay = 10;
