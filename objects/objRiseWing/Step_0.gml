action_set_relative(1);
timer += spd;
var __b__;
__b__ = action_if(timer>=3.3*f);
if __b__
{
timer += -3.3*f;
}
__b__ = action_if(timer<f || timer>3*f);
if __b__
{
ply=0;
d1=(d1*a+80)/(a+1);
d2=(d2*a+180)/(a+1);
d3=(d3*a-30)/(a+1);
s3=(s3*a+5)/(a+1);


}
__b__ = action_if(timer>=0.66*f && timer<1.66*f);
if __b__
{

d1=(d1*a+60)/(a+1);
d2=(d2*a+60)/(a+1);
d3=(d3*a+45)/(a+1);

s3=(s3*a+22)/(a+1);


}
__b__ = action_if(timer>=1.66*f && timer<2.75*f);
if __b__
{
if (ply==0 && hsc>0)
{soundplay(global.sndFlap);
ply=1;}

d1=(d1*a-100)/(a+1);
d2=(d2*a-80)/(a+1);
d3=(d3*a-100)/(a+1);
s3=(s3*a+20)/(a+1);

}
__b__ = action_if(timer>=2.5*f);
if __b__
{

d1=(d1*a-80)/(a+1);
d2=(d2*a+82)/(a+1);
d3=(d3*a-67)/(a+1);
s3=(s3*a+5)/(a+1);


}
action_set_relative(0);
