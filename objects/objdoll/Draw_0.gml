if (!instance_exists(p))
    exit;

var __b__;
__b__ = action_if(blink || p.invulnerable==0);
if __b__
{
var h,v,h2,v2;
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
h=cos(degtorad(image_angle));
v=-sin(degtorad(image_angle));
h2=-image_yscale*cos(degtorad(image_angle+90));
v2=image_yscale*sin(degtorad(image_angle+90));
draw_sprite_ext(sdollarm,0,x+14*h+2*h2,y+14*v+2*v2,1,image_yscale,image_angle+image_yscale*armrot,image_blend,image_alpha);


if(blink && p.shield)
draw_sprite_ext(sshield,image_index,x/*+16*h*/,y/*+16*v*/,1,1,0,image_blend,image_alpha);

draw_set_blend_mode(bm_add);
if(p.atk==3 && p.subphs==1)
    {
    if ((p.timer>=60 && p.timer mod 10 ==0) || p.timer>=90)
        {
        draw_sprite_ext(sdollaser,blink,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
        for(a=0; a<640 a+=32)
            draw_sprite_ext(sdollaser2,blink,x+4*h-a*h2,y+4*v-a*v2,image_yscale,1,image_angle+90,image_blend,image_alpha);
        }
    }

draw_set_blend_mode(bm_normal);
/* */
}
blink=1-blink;
/* */
/*  */
