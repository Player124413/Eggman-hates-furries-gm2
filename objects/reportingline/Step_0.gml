var __b__;
__b__ = action_if(on);
if __b__
{
__b__ = action_if(xi-128<__view_get( e__VW.XView, 0 )+640 && yi-128<__view_get( e__VW.YView, 0 )+480 && xa+128>__view_get( e__VW.XView, 0 ) && ya+128>__view_get( e__VW.YView, 0 ) || (instance_exists(controlbg) && controlbg.outsideOn));
if __b__
{
var a,b,f,c;

with (movable)
    {
    if(x+radius+abs(hspeed)>=other.xi && y+radius+abs(vspeed)>=other.yi && 
            x-radius-abs(hspeed)<=other.xa && y-radius-abs(vspeed)<=other.ya)
        {
        with(other)    
            {
            if(i1>-1 && instance_exists(i1))
                i1.compute=1;
            if(i2>-1 && instance_exists(i2))
                i2.compute=1;
            
            b=(other.y*ux-y*ux-other.x*uy+x*uy)/(-nx*uy+ny*ux);
            
            if(abs(uy)<0.1)
                {a=(other.x-nx*b-x)/ux;}
            else
                a=(other.y-ny*b-y)/uy;
            
            f=other.speed*cos(degtorad(p-90-other.direction));
                
            if(abs(b)<=sign(b)*f+other.radius+min(4,other.speed/12) && a>=0 && a<=d)
                {
                //normal force
                other.hspeed+=nx*f;
                other.vspeed+=ny*f;
                pp.report=f;
                pp.report2=b;
                //friction
                c=lengthdir_x(other.speed,other.direction-p);
                other.hspeed-=ux*sign(c)*min(abs(c),abs(f)*frict*other.frict);
                other.vspeed-=uy*sign(c)*min(abs(c),abs(f)*frict*other.frict);
                //set position
                other.x=x+ux*a+nx*sign(b)*other.radius;
                other.y=y+uy*a+ny*sign(b)*other.radius;
                //inherit normal, set ground
                if(other.gnd!=2 || (abs(other.ny)<abs(ny) && pp.object_index!=objDreamDoor))//ATTN: WEIRD WORKAROUND
                    {other.ux=ux*sign(b);
                    other.uy=uy*sign(b);
                    other.nx=nx*sign(b);
                    other.ny=ny*sign(b);
                    other.nullh=hspeed;
                    other.nullv=vspeed;
                    other.gnd=2;}
                
                }
            }
        }
    }
}
}
