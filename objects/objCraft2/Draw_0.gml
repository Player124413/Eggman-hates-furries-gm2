var fx,fy;
image_angle=angle;
if(timer>=57 && phase==2)
    {
    fx=x+lengthdir_x(42,image_angle+270);
    fy=y+lengthdir_y(42,image_angle+270);
    draw_set_alpha(0.2+0.4*(timer mod 1));
    if(timer mod 1==0)
        {fh=lengthdir_x(960,image_angle-0.5+random(1));
        fv=lengthdir_y(960,image_angle-0.5+random(1));
        if(myFan>-1)
            {if(instance_exists(myFan))
                {if(fx+fh>myFan.x)
                    {fh=myFan.x-fx;
                    repeat(2)
                        {i=instance_create(fx+fh,fy+fv,objspark);
                        i.hspeed=hspeed+random(8);
                        i.vspeed=-4+random(8);}
                    }
                }
            }
        draw_line_color(fx,fy,fx+fh,fy+fv,c_white,c_black);
        draw_set_color(c_gray);
        draw_line_width(fx,fy,fx+fh,fy+fv,3);}
    else
        draw_line_color(fx,fy,fx+fh,fy+fv,c_black,c_white);
    draw_set_alpha(1);
    }

drawCraft();
if(blink && booster>0)
    draw_sprite_ext(sprCraftFlame,booster-1,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
h=lengthdir_x(17,angle+90)-lengthdir_x(24,angle);
v=lengthdir_y(17,angle+90)-lengthdir_y(24,angle);

if(phase>0 && (phase<8 || timer<180))
    {
    with sonic
        {
        hspeed=other.hspeed;
        vspeed=other.vspeed;
        x=other.x+other.h;
        y=other.y+other.v;
        sprite_index=scraftsonic;
        image_speed=0;
        if (other.timer<30 && other.phase==1)
            image_index=0+floor(other.tailimg);
        else if ((other.timer<120 && other.phase==6) || (other.phase==8 && other.timer>42))
            image_index=8+floor(other.tailimg);
        else if ((other.phase==3 && other.timer<20) || (other.pull==4 && other.phase>=5))
            image_index=6+floor(other.tailimg);
        else if ((other.phase==3 && other.angle>40) || other.phase==4)
            image_index=2+floor(other.tailimg);
        else
            image_index=4+floor(other.tailimg);
        image_xscale=1;
        image_angle=other.angle;
        }
    }
var __b__;
__b__ = action_if(phase==3 && angle>20);
if __b__
{
drawLazor(__view_get( e__VW.XView, 0 )-64,oyy-128,(timer-30)/6,20,fourstage,1);
}
__b__ = action_if(phase==4 && count==5);
if __b__
{
drawLazor(xx+64,__view_get( e__VW.YView, 0 )+640,85,24,fourstage,1);
}
__b__ = action_if(phase==6 && timer>=12 && timer<22);
if __b__
{
drawLazor(xx-128,yy,point_direction(xx-128,yy,x+72,y),60,fourstage,1);
}
