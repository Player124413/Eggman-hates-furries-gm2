if (!instance_exists(doom))
    exit;
x=doom.x;
y=doom.y;

c=360/7;
for (i=0; i<360; i+=90)
    draw_sprite_ext(sprDoomRack1,0,x,y,1,1,rackAngle+i,image_blend,image_alpha);
for (var slot=0; slot<7; slot+=1)
    {
    h=lengthdir_x(92,rackAngle+slot*c);
    v=lengthdir_y(92,rackAngle+slot*c);
    draw_sprite_ext(sprDoomRack2,0,x+h,y+v,1,1,rackAngle+slot*c,image_blend,image_alpha);
    if(slot<emeralds)
    {
    draw_sprite_ext(sprEmerald,0,x+h,y+v,1,1,0,controlbg.emerald_c[slot],image_alpha);
    if (charge>0)
        {draw_sprite_ext(sprElectroSpin,timer,x+h,y+v,1,1,rackAngle+slot*c+timer*12,c_white,sqrt(charge));
        draw_set_blend_mode(bm_add);
        draw_set_alpha(power(charge,2));
        draw_circle_color(x+h,y+v,32,controlbg.emerald_c[slot],c_black,0);
        draw_set_alpha(1);
        draw_set_blend_mode(bm_normal);
        }
    if (timerReset && cos(degtorad(rackAngle+slot*c))<-0.8)
        {
        i=instance_create(x+h,y+v,objElArc);
        i.x2=x;
        i.y2=y;
        }
    }
    }
draw_set_blend_mode(bm_add);
draw_set_alpha(power(charge,2));
draw_circle_color(x,y,48+16*charge+random(8),c_white,c_black,0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
var __b__;
__b__ = action_if(lazor>0 || lastlazor==1);
if __b__
{
__b__ = action_if(noMoreLazors==0);
if __b__
{
var a,b,c,d,e,h,v;
draw_set_blend_mode(bm_add);
a=max(lastlazor*0.8,lazor);
draw_circle_color(x,y,a*192+random(16),c_white,c_black,0);
draw_circle_color(x,y,a*192+random(16),c_white,c_black,0);

if (lazor==1 || lastlazor==1)
{
for(a=0; a<360; a+=90)
    {
    c=doom.image_angle+a;
    h=lengthdir_x(1,c+90);
    v=lengthdir_y(1,c+90);
    d=point_distance(x+48*h,y+48*v,sonic.x,sonic.y);
    e=point_distance(x+48*h+lengthdir_x(d,c+10),y+48*v+lengthdir_y(d,c+10),sonic.x,sonic.y);
    if (e<44+d*0.17)
        {
        sonic.damaged=1;
        }
    b=1; if(lastlazor>lazor) b=0.5;
    drawLazor(x+56*h,y+56*v,c,20,fourstage,b);
    drawLazor(x+40*h,y+40*v,c+20,20,fourstage,b);
    }
}

draw_set_blend_mode(bm_normal);
}
}
