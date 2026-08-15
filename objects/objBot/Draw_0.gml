if(blink || invulnerable==0)
    {
    if(kind) spr=sprCamApp;
    else spr=sprBombApp;
    draw_sprite_ext(spr,(excl mod 10 > 5),x,y,1,1,mainDir,c_white,1);
    draw_sprite_ext(sprBot,(damaged>0),x,y,1,1,0,c_white,1);
    draw_sprite_ext(sprite_index,image_index,x,y,1,1,angle+90-objWaterFront.hspeed/5,c_white,1);
    draw_sprite_ext(sprArmApp,0,x,y,1,1,secDir,c_white,1);
    }
if(shield || (shieldTimer<30 && shieldTimer mod 10 < 3))
    draw_sprite_ext(sprBotShield,fourstage,x,y,1,1,point_direction(x,y,sonic.x,sonic.y),c_white,1);


var __b__;
__b__ = action_if(excl>0);
if __b__
{
if (excl mod 10 <= 5)
    draw_sprite(sprBotExcl,0,x,y);
excl-=global.time;
}
