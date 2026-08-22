


if (!instance_exists(a1) || !instance_exists(a2)
    || !instance_exists(a3) || !instance_exists(a4))
    exit;

h=lengthdir_x(32,open+image_angle);
v=lengthdir_y(32,open+image_angle);
h2=lengthdir_x(32,image_angle);
v2=lengthdir_y(32,image_angle);

a1.x=x-3*v-h; a1.y=y+3*h-v;
a1.image_angle=image_angle;
a2.x=x+3*h-v; a2.y=y+3*v+h;
a2.image_angle=image_angle+90;
a3.x=x+3*v+h; a3.y=y-3*h+v;
a3.image_angle=image_angle+180;
a4.x=x-3*h+v; a4.y=y-3*v-h;
a4.image_angle=image_angle+270;

xx=a1.x+h2*2.3+v2*2.3;
yy=a1.y+v2*2.3-h2*2.3;
d=point_direction(x,y,xx,yy);
draw_sprite_ext(sprFinalHydraulic2,image_index,xx,yy,image_xscale,image_yscale,d+180,image_blend,image_alpha);
draw_sprite_ext(sprFinalHydraulic1,image_index,x,y,image_xscale,image_yscale,d,image_blend,image_alpha);
xx=a2.x+v2*2.3-h2*2.3;
yy=a2.y-h2*2.3-v2*2.3;
d=point_direction(x,y,xx,yy);
draw_sprite_ext(sprFinalHydraulic2,image_index,xx,yy,image_xscale,image_yscale,d+180,image_blend,image_alpha);
draw_sprite_ext(sprFinalHydraulic1,image_index,x,y,image_xscale,image_yscale,d,image_blend,image_alpha);
xx=a3.x-h2*2.3-v2*2.3;
yy=a3.y-v2*2.3+h2*2.3;
d=point_direction(x,y,xx,yy);
draw_sprite_ext(sprFinalHydraulic2,image_index,xx,yy,image_xscale,image_yscale,d+180,image_blend,image_alpha);
draw_sprite_ext(sprFinalHydraulic1,image_index,x,y,image_xscale,image_yscale,d,image_blend,image_alpha);
xx=a4.x-v2*2.3+h2*2.3;
yy=a4.y+h2*2.3+v2*2.3;
d=point_direction(x,y,xx,yy);
draw_sprite_ext(sprFinalHydraulic2,image_index,xx,yy,image_xscale,image_yscale,d+180,image_blend,image_alpha);
draw_sprite_ext(sprFinalHydraulic1,image_index,x,y,image_xscale,image_yscale,d,image_blend,image_alpha);


draw_sprite_ext(sprFinalArm,image_index,x,y,image_xscale,image_yscale,image_angle+open,image_blend,image_alpha);
draw_sprite_ext(sprFinalArm,image_index,x,y,image_xscale,image_yscale,image_angle+90+open,image_blend,image_alpha);
draw_sprite_ext(sprFinalArm,image_index,x,y,image_xscale,image_yscale,image_angle+180+open,image_blend,image_alpha);
draw_sprite_ext(sprFinalArm,image_index,x,y,image_xscale,image_yscale,image_angle+270+open,image_blend,image_alpha);
draw_sprite_ext(sprFinalBall1,image_index,a1.x,a1.y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
draw_sprite_ext(sprFinalBall1,image_index,a2.x,a2.y,image_xscale,image_yscale,image_angle+90,image_blend,image_alpha);
draw_sprite_ext(sprFinalBall1,image_index,a3.x,a3.y,image_xscale,image_yscale,image_angle+180,image_blend,image_alpha);
draw_sprite_ext(sprFinalBall1,image_index,a4.x,a4.y,image_xscale,image_yscale,image_angle+270,image_blend,image_alpha);


