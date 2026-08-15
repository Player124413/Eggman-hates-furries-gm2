with dLine
    {
    if(close>0)
        {
        draw_set_color(c_white);
        draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(sprCloser,0));
        draw_vertex_texture(fx,fy,(1-close),0)
        draw_vertex_texture(fx2,fy2,(1-close),1)
        draw_vertex_texture(x,y,1,0)
        draw_vertex_texture(x2,y2,1,1)
        draw_primitive_end();
        }
    }
var __b__;
__b__ = action_if(destined>0 && blink);
if __b__
{
var h,v,h2,v2;
h=lengthdir_x(192,layerAngle-5);
v=lengthdir_y(192,layerAngle-5);
h2=lengthdir_x(192,layerAngle+5);
v2=lengthdir_y(192,layerAngle+5);
if(signal>0)
    {signal-=global.time/2;
    draw_set_color(c_green);}
else
    {signal=0;
    draw_set_color(c_red);}
draw_primitive_begin(pr_trianglelist);
draw_vertex(xx,yy);
draw_vertex_color(xx+h,yy+v,draw_get_color(),0);
draw_vertex_color(xx+h2,yy+v2,draw_get_color(),0);

draw_primitive_end();
}
__b__ = action_if(blink || invulnerable==0);
if __b__
{
var h,v,h2,v2,profanity;
profanity=point_direction(xx,yy,x,y);
h=lengthdir_x(1,dir);
v=lengthdir_y(1,dir);
h2=lengthdir_x(1,dir+90);
v2=lengthdir_y(1,dir+90);
if(warning && stableCycle==0)
    soundplay(global.sndTargetConfirm);
if(warning && blink && stableCycle<4)
    {
    draw_set_color(c_red);
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex_color(x+h2*48,y+v2*48,draw_get_color(),0.8);
    draw_vertex_color(x-h2*48,y-v2*48,draw_get_color(),0.8);
    draw_vertex_color(x+h*1280+h2*48,y+v*640+v2*48,draw_get_color(),0);
    draw_vertex_color(x+h*1280-h2*48,y+v*640-v2*48,draw_get_color(),0);
    draw_primitive_end();
    }
if(warning && stableCycle==4)
    warning=0;

draw_sprite(coreSprite,image_index,xx,yy);
if(layerExists)
    draw_sprite_ext(sprMineLayer,2*max(0,min(damageCounter-1,2))+(shield || stableCycle<4),xx,yy,1,1,layerAngle,c_white,1);
draw_sprite_ext(sprDrillArm,0,xx,yy,1,1,profanity,c_white,1);
draw_sprite_ext(sprDrill,drillImg,x,y,1,1,drillAngle,c_white,1);

if((shield || shieldWarn>0) && blink && layerExists)
    draw_sprite_ext(sprDrillShield,eightstage/2,xx,yy,1,1,layerAngle,c_white,1);
if(shieldWarn>0)
    shieldWarn-=global.time/4;
}
