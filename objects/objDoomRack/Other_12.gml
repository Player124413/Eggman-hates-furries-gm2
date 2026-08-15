emeralds-=1;

c=360/7;
h=lengthdir_x(92,rackAngle+emeralds*c);
v=lengthdir_y(92,rackAngle+emeralds*c);

i=instance_create(x+h,y+v,objOrbitEmerald);
i.index=emeralds;
i.p=objEggMid;

i=instance_create(x+h,y+v,objCutFlash);
i.image_angle=40+emeralds*3;

soundplay(global.sndBreakDown);
