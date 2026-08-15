for(a=0; a<640; a+=8)
    {
    draw_background(bgMenu,a,0);
    }

draw_background_ext(bgFlashy3,3,32+3,1,1,0,c_black,1);
draw_background_ext(bgFlashy3,0,32,1,1,0,c_white,1);


c=360/7;
for (i=0; i<360; i+=90)
    draw_sprite_ext(sprDoomRackM1,0,x,y,1,1,rackAngle+i,image_blend,image_alpha);
for (i=0; i<7; i+=1)
    {
    h=lengthdir_x(192,rackAngle+i*c);
    v=lengthdir_y(192,rackAngle+i*c);
    draw_sprite_ext(sprDoomRackM2,0,x+h,y+v,1,1,rackAngle+i*c,image_blend,image_alpha);
    if(i<emeralds)
    {
    draw_sprite_ext(sprEmeraldM,0,x+h,y+v,1,1,0,emerald_c[i],image_alpha);
    if (cos(degtorad(rackAngle+i*c-constant))>0)
        {    
        draw_textM(x+h+64,y+v-16,emerald_t[i],1-abs(sin(degtorad(rackAngle+i*c-constant))));
        }
    if (charge>0)
        {draw_set_blend_mode(bm_add);
        draw_set_alpha(power(charge,2));
        draw_circle_color(x+h,y+v,64,emerald_c[i],c_black,0);
        draw_set_alpha(1);
        draw_set_blend_mode(bm_normal);
        }
    /*if (timerReset && cos(degtorad(rackAngle+i*c))<-0.8)
        {
        i=instance_create(x+h,y+v,objElArc);
        i.x2=x;
        i.y2=y;
        }*/
    }
    }
if(-option+7==2 && up==0)
    {
    draw_set_color(c_maroon);
    draw_set_halign(fa_right);
    draw_set_valign(fa_bottom);
    draw_text(640,448,string_hash_to_newline("Not for new players# #Some rings will still be#present in certain areas"));
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    }

draw_set_blend_mode(bm_add);
draw_set_alpha(power(charge,2));
draw_circle_color(x,y,96+64*charge+random(16),c_red,c_black,0);
draw_set_alpha(1);
draw_set_blend_mode(bm_normal);
/* */
/*  */
