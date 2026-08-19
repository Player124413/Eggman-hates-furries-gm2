var __b__;
__b__ = action_if(on);
if __b__
{
var hn,vn,f, ok;
ok=0;
if (!instance_exists(dependency) || dependency.prog > 0)
    ok = 1;
if(ok)
    rot+=global.time*rotsp;

for(i=0; i<plats; i+=1)
    {
    h=lengthdir_x(1,rot+360*i/plats);
    v=lengthdir_y(1,rot+360*i/plats);  
    hn=lengthdir_x(1,rot+ok*rotsp+360*i/plats);
    vn=lengthdir_y(1,rot+ok*rotsp+360*i/plats);

    draw_sprite_ext(swheelarm,0,x+h*length*3/4,y+v*length*3/4,1,1,rot+360*i/plats,c_white,1)
    draw_sprite_ext(swheelarm,0,x+h*length,y+v*length,1,1,rot+360*i/plats,c_white,1)
    draw_sprite_ext(swheelplatform,0,x+h*length,y+v*length,1,1,0,c_white,1)
    plat[i].x=x+h*length-32;
    plat[i].y=y+v*length-14;
    plat[i].hspeed=length*(hn-h);
    plat[i].vspeed=length*(vn-v);
    with(plat[i])
        {
        x2=x+64;
        y2=y;
        event_perform(ev_alarm,0);
        }
    }
    
f=radius/128;
draw_sprite_ext(sprite_index,0,x,y,f,f,0,c_white,1);
draw_sprite_ext(sprite_index,0,x,y,-f,f,0,c_white,1);
draw_sprite_ext(sprite_index,0,x,y,f,-f,0,c_white,1);
draw_sprite_ext(sprite_index,0,x,y,-f,-f,0,c_white,1);
h=lengthdir_x(1,rot);
v=lengthdir_y(1,rot);
draw_sprite(swheelhole,0,x-h*60,y-v*60)

}
