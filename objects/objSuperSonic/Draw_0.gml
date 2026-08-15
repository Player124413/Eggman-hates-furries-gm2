script_execute(drawsprite,0,0,0,0,0);
var __b__;
__b__ = action_if(setUp>=1);
if __b__
{
draw_set_blend_mode(bm_add);
draw_sprite_ext(sprSuperShield2,eightstage,x,y,1,1,0,c_white,(2-setUp));
if(random(2)<global.time)
    {repeat(8)
        draw_sprite_ext(sprSuperShield2,eightstage,x-4+random(8),y-16+random(32),1,1,0,c_white,0.5*(2-setUp));
    }
draw_set_blend_mode(bm_normal);
}
