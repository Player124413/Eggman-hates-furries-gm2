var __b__;
__b__ = action_if(close<1);
if __b__
{
{
if(n1>=0)
{if(doesNotHave(n1,id))
    {
    show_message("inconsistency1")
    game_end();
    }}
if(n2>=0)
{if(doesNotHave(n2,id))
    {
    show_message("inconsistency2")
    game_end();
    }}
if(drill.change)
{if(n1==-1 || n2==-1)
{if((drill.lastLeft==-1) xor !(drill.lastRight==-1))
{if(id!=drill.lastLeft && id!=drill.lastRight)
deleteSelf();
}}}
__b__ = action_if(on);
if __b__
{
__b__ = action_if(xi-128<__view_get( e__VW.XView, 0 )+640 && yi-128<__view_get( e__VW.YView, 0 )+480 && xa+128>__view_get( e__VW.XView, 0 ) && ya+128>__view_get( e__VW.YView, 0 ) || controlbg.outsideOn);
if __b__
{
var a,b,f,c,hk;

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
            
            if(abs(uy)<0.1 && ux!=0)
                {a=(other.x-nx*b-x)/ux;}
            else if (uy!=0)
                a=(other.y-ny*b-y)/uy;
            else
                a=-1;
            
            f=other.speed*cos(degtorad(p-90-other.direction));
            if(right)
                hk=1;
            else
                hk=1-ny*sign(b);
            
            if(abs(b)<=sign(b)*f+other.radius+min(4,hk*other.speed/24) && a>=0 && a<=d)
                {
                //normal force
                other.hspeed+=nx*f;
                other.vspeed+=ny*f;
                if(other.object_index==sonic)
                    {
                    pp.report=f;
                    pp.report2=b;
                    }
                //friction
                c=lengthdir_x(other.speed,other.direction-p);
                other.hspeed-=ux*sign(c)*min(abs(c),abs(f)*frict*other.frict);
                other.vspeed-=uy*sign(c)*min(abs(c),abs(f)*frict*other.frict);
                //set position
                other.x=x+ux*a+nx*sign(b)*other.radius;
                other.y=y+uy*a+ny*sign(b)*other.radius;
                other.nullh=0;
                other.nullv=0;
                //inherit normal, set ground
                if(other.gnd!=2 || abs(other.ny)<abs(ny))
                    {other.ux=ux*sign(b);
                    other.uy=uy*sign(b);
                    other.nx=nx*sign(b);
                    other.ny=ny*sign(b);
                    other.gnd=2;}
                
                }
            }
        }
    }
}
}
}
}
__b__ = action_if(!special && (x2<drill.closeX || close>0 || forceClose));
if __b__
{
if (close==0)
    {
    iR=instance_create(x2,y2,line);
    iR.makePoints=false;
    iR.on=1;
    }
if(close<1)
    {
    close+=global.time/10;
    if(close>=0.5 && sprite_index==-1)
        {
        sprite_index=sprPixel;
        image_xscale=d;
        image_yscale=drill.closeS/2;
        if(right)
            image_angle=p;
        else
            image_angle=p+180;
        }
    if (close>=1)
        {
        sprite_index=sprPixel;
        image_xscale=d;
        image_yscale=drill.closeS;
        if(right)
            image_angle=p;
        else
            image_angle=p+180;
        close=1;
        }
    x=fx+nx*drill.closeS*close*ck;
    y=fy+ny*drill.closeS*close*ck;
    x2=fx2+nx*drill.closeS*close*ck;
    y2=fy2+ny*drill.closeS*close*ck;
    
    iR.x2=x2;
    iR.y2=y2;
    with iR event_perform(ev_alarm,0);
    on=-2;
    event_user(0);
    }
else if (xa<drill.closeX-720)
    {
    validDeletion();
    }
}
