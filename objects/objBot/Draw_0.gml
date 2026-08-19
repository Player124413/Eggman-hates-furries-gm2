if (dead)
    exit;

var water = instance_find(objWaterFront, 0);
var player = instance_find(sonic, 0);
var water_speed = instance_exists(water) ? water.hspeed : 0;

if(blink || invulnerable==0)
    {
    if(kind) spr=sprCamApp;
    else spr=sprBombApp;
    draw_sprite_ext(spr,(excl mod 10 > 5),x,y,1,1,mainDir,c_white,1);
    draw_sprite_ext(sprBot,(damaged>0),x,y,1,1,0,c_white,1);
    draw_sprite_ext(sprite_index,image_index,x,y,1,1,angle+90-water_speed/5,c_white,1);
    draw_sprite_ext(sprArmApp,0,x,y,1,1,secDir,c_white,1);
    }
if(shield || (shieldTimer<30 && shieldTimer mod 10 < 3))
{
    var shield_direction = instance_exists(player) ? point_direction(x, y, player.x, player.y) : mainDir;
    draw_sprite_ext(sprBotShield,fourstage,x,y,1,1,shield_direction,c_white,1);
}


var __b__;
__b__ = action_if(excl>0);
if __b__
{
if (excl mod 10 <= 5)
    draw_sprite(sprBotExcl,0,x,y);
excl-=global.time;
}
