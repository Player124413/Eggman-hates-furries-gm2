action_set_relative(0);
var __b__;
__b__ = action_if(flap==1);
if __b__
{
{
a = 13;
ang = objRean.wingAngle;
{
action_set_relative(1);
timer += spd*global.time;
action_set_relative(0);
}
__b__ = action_if(timer>=3.3*f);
if __b__
{
{
action_set_relative(1);
timer += -3.3*f;
action_set_relative(0);
}
}
__b__ = action_if(timer<f || timer>3*f);
if __b__
{
ply=0; 
d1=(d1*a+80*2*global.time)/(a+2*global.time);
d2=(d2*a+180*2*global.time)/(a+2*global.time);
d3=(d3*a-30*2*global.time)/(a+2*global.time);
s3=(s3*a+5*2*global.time)/(a+2*global.time);


}
__b__ = action_if(timer>=0.66*f && timer<1.66*f);
if __b__
{

d1=(d1*a+68*2*global.time)/(a+2*global.time);
d2=(d2*a+58*2*global.time)/(a+2*global.time);
d3=(d3*a+53*2*global.time)/(a+2*global.time);

s3=(s3*a+25*2*global.time)/(a+2*global.time);


}
__b__ = action_if(timer>=1.66*f && timer<2.75*f);
if __b__
{
if (ply==0 && hsc>0)
{soundplay(global.sndFlap);
ply=1;}


d1=(d1*a-140*2*global.time)/(a+2*global.time);
d2=(d2*a-100*2*global.time)/(a+2*global.time);
d3=(d3*a-140*2*global.time)/(a+2*global.time);
s3=(s3*a+20*2*global.time)/(a+2*global.time);


}
__b__ = action_if(timer>=2.5*f);
if __b__
{


d1=(d1*a-80*2*global.time)/(a+2*global.time);
d2=(d2*a+82*2*global.time)/(a+2*global.time);
d3=(d3*a-67*2*global.time)/(a+2*global.time);
s3=(s3*a+5*2*global.time)/(a+2*global.time);


}
}
}
__b__ = action_if(flap==2);
if __b__
{

a=4;

d1=(d1*a+68*2*global.time)/(a+2*global.time);
d2=(d2*a+58*2*global.time)/(a+2*global.time);
d3=(d3*a+53*2*global.time)/(a+2*global.time);

s3=(s3*a+25*2*global.time)/(a+2*global.time);


}
__b__ = action_if(flap==3);
if __b__
{

a=4;

d1=(d1*a-60*2*global.time)/(a+2*global.time);
d2=(d2*a-45*2*global.time)/(a+2*global.time);
d3=(d3*a-55*2*global.time)/(a+2*global.time);
s3=(s3*a+20*2*global.time)/(a+2*global.time);


}
action_set_relative(0);
