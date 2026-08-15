x2+=hspeed*global.time;
y2+=vspeed*global.time;

xi+=hspeed*global.time;
yi+=vspeed*global.time;
xa+=hspeed*global.time;
ya+=vspeed*global.time;

/*
i1.x+=hspeed*global.time;
i1.y+=vspeed*global.time;

i2.x+=hspeed*global.time;
i2.y+=vspeed*global.time;
*/
/* */
var __b__;
__b__ = action_if(on);
if __b__
{
__b__ = action_if(xi-128<__view_get( e__VW.XView, 0 )+640 && yi-128<__view_get( e__VW.YView, 0 )+480 && xa+128>__view_get( e__VW.XView, 0 ) && ya+128>__view_get( e__VW.YView, 0 ) || controlbg.outsideOn);
if __b__
{
x+=hspeed*global.time;
y+=vspeed*global.time;

var a,b,f,c,e,g;

with (movable)
    {
    if(x+radius+abs(hspeed)+8>=other.xi && y+radius+abs(vspeed)+8>=other.yi && 
            x-radius-abs(hspeed)-8<=other.xa && y-radius-abs(vspeed)-8<=other.ya
                && object_index!=robot && object_index!=objredlaser && object_index!=objredblob && object_index!=doom)
        {
        with(other)    
            {
            if(i1>-1 && instance_exists(i1))
                i1.compute=1;
            if(i2>-1 && instance_exists(i2))
                i2.compute=1;
            
            e=point_distance(hspeed,vspeed,other.hspeed,other.vspeed);
            g=point_direction(hspeed,vspeed,other.hspeed,other.vspeed);
            
            b=(other.y*ux-y*ux-other.x*uy+x*uy)/(-nx*uy+ny*ux);
            
            if(uy==0)
                a=(other.x-nx*b-x)/ux;
            else
                a=(other.y-ny*b-y)/uy;
            
            f=e*cos(degtorad(p-90-g));//normal
                
            if(abs(b)<=sign(b)*f+other.radius+min(mindist,e/12)+abs(nx) && a>=0 && a<=d)
                {
                pp.report=f;
                
                if (b>0 && special)
                    {f=-f;
                    b=-b;}
                
                if (abs(f)>16 && special && other.object_index==sonic)
                    {
                    if(robot.sequence==0)
                        {i=instance_create(other.x,other.y,objmedexp);
                        robot.damaged=1;}
                    }
                //Can has normal force?
                other.hspeed+=nx*f;
                other.vspeed+=ny*f;
                //friction
                c=lengthdir_x(e,g-p);
                other.hspeed-=ux*sign(c)*min(abs(c),abs(f)*frict*other.frict);
                other.vspeed-=uy*sign(c)*min(abs(c),abs(f)*frict*other.frict);
                //set position
                other.x=x+ux*a+nx*sign(b)*other.radius;
                other.y=y+uy*a+ny*sign(b)*other.radius;
                //inherit normal, set ground
                if(other.gnd!=2 || sign(b)*ny<other.ny)
                    {other.ux=ux*sign(b);
                    other.uy=uy*sign(b);
                    other.nx=nx*sign(b);
                    other.ny=ny*sign(b);
                    other.gnd=2;
                    other.nullh=hspeed;
                    other.nullv=vspeed;}
                
                }
            }
        }
    }
    
x-=hspeed*global.time;
y-=vspeed*global.time;
/* */
}
}
x-=(1-global.time)*hspeed;
y-=(1-global.time)*vspeed;
/* */
/*  */
