var __b__;
__b__ = action_if(random(2)<global.time);
if __b__
{
j=random(1);
i=instance_create(x1*(1-j)+x2*j,y1*(1-j)+y2*j,objUltSmoke);
}
