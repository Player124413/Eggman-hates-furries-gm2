prog = 1;
progsp = 0;
angle = 0;
//The order is important: These must perform calculations first
i1=instance_create(0,0,reportingline);
i1.pp=id;
i4=instance_create(0,0,reportingline);
i4.pp=id;


i2=instance_create(0,0,reportingline);
i2.pp=id;
i3=instance_create(0,0,reportingline);
i3.pp=id;

i5=instance_create(0,0,reportingline);
i5.pp=id;
i6=instance_create(0,0,reportingline);
i6.pp=id;

//PLAN: if we receive a report with a strange(negative) SIGN, you DIE

report = 0;
maxforce = 16;
dependency = self;
report2 = 0;
mycolor = c_red;
