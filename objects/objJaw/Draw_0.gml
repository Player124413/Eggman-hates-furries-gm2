var xx,yy,h1,v1,h2,v2,h3,v3,d,c,px1,py1,px0,py0;
c=c_white;
xx=x;
yy=y;


h1=cos(degtorad(final+open));
v1=-sin(degtorad(final+open));
h2=cos(degtorad(final-open));
v2=-sin(degtorad(final-open));

h3=cos(degtorad(dir[0]));
v3=-sin(degtorad(dir[0]));

draw_sprite_ext(sprJawArm,0,xx,yy,1,1,dir[0],c,1)
draw_sprite_ext(sprTopJaw,0,xx,yy,1,1,final+open,c,1);
draw_sprite_ext(sprBotJaw,0,xx,yy,1,1,final-open,c,1);
//HYDRAULICS FOR TOPJAW
//closer to base
px0=xx+20*h3-20*v3;
py0=yy+20*v3+20*h3;
//closer to jaw
px1=xx+46*h1+30*v1;
py1=yy+46*v1-30*h1;
//from base to jaw
d=point_direction(px0,py0,px1,py1);
draw_sprite_ext(sprPneumatica1,0,px1,py1,0.95,1,d+180,c,1);
draw_sprite_ext(sprPneumatica2,0,px0,py0,0.85,1,d,c,1);

//HYDRAULICS FOR BOTJAW
//closer to base
px0=xx+20*h3+20*v3;
py0=yy+20*v3-20*h3;
//closer to jaw
px1=xx+46*h2-30*v2;
py1=yy+46*v2+30*h2;
//from base to jaw
d=point_direction(px0,py0,px1,py1);
draw_sprite_ext(sprPneumatica1,0,px1,py1,0.95,1,d+180,c,1);
draw_sprite_ext(sprPneumatica2,0,px0,py0,0.85,1,d,c,1);

draw_sprite(sprJawBall,0,x,y);
