var xxx,yyy,a,b,c;

draw_sprite_ext(sprVipHand,handImg,x+lengthdir_x(32*handProg,image_angle-45),y+lengthdir_y(32*handProg,image_angle-45),1,1,image_angle,c_white,image_alpha);

image_angle=direction;
lightDir=direction-45;
nx=x;
ny=y;
c=0;
q=0;
for(a=2; a<num; a+=1)
    {
    b=1-prog;
    xxx=px[a]*b+px[a-1]*prog+hspeed*global.time;
    yyy=py[a]*b+py[a-1]*prog+vspeed*global.time;
    d=point_direction(xxx,yyy,nx,ny);
    if(c)
        {
        spr=sprVipButt;
        tailx[q]=xxx;
        taily[q]=yyy;
        taild[q]=d;
        q+=1;
        }
    else
        spr=sprVipArm;
    draw_sprite_ext(spr,image_index,xxx,yyy,1,1,d,c_white,image_alpha);
    nx=xxx;
    ny=yyy;
    c=!c;
    }

draw_sprite_ext(sprite_index,image_index,x,y,1,1,image_angle,c_white,image_alpha);
engineTimer+=global.time;
if (engineTimer>22)
    engineTimer=0;
if (engineTimer mod 2 == 0 && engineTimer div 2 <4)
    {
    i=instance_create(x+lengthdir_x(23,image_angle+90)+lengthdir_x(57-7*engineTimer div 2,image_angle+180)
        ,y+lengthdir_y(23,image_angle+90)+lengthdir_y(57-7*engineTimer div 2,image_angle+180),objVipFlame);
    i.image_angle=image_angle;
    i.hspeed=hspeed*0.9;
    i.vspeed=vspeed*0.9;
    }
