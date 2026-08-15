var __b__;
__b__ = action_if(x<__view_get( e__VW.XView, 0 )+660);
if __b__
{
__b__ = action_if(active);
if __b__
{
gpu_set_texrepeat(1);
draw_primitive_begin_texture(pr_trianglestrip,tex);
draw_vertex_texture_color(x,y,l,t,ct,1);
draw_vertex_texture_color(x+width,y+yskew,r,t,ct,1);
draw_vertex_texture_color(x,y+height,l,b,cb,1);
draw_vertex_texture_color(x+width,y+yskew+height,r,b,cb,1);
draw_primitive_end();
gpu_set_texrepeat(0);

draw_set_color(c_black);
draw_set_alpha(0.3);
draw_rectangle(x,y,x+width,y+48,0);
draw_set_alpha(1);

c=ceil(width/16);
bb=0;
for(j=0.5; j<c; j+=1)
    {
    if (bb) a=c1; else a=c2;
    draw_sprite_ext(sgrass2,(j-0.5) mod 5,x*(c-j)/c+(x+width)*j/c,y*(c-j)/c+(y+yskew)*j/c,1,1,0,a,1);
    bb=!bb;
    }
draw_set_color(c_black);
draw_set_alpha(0.5);
if (RH)
    draw_line(x+width-1,y+yskew,x+width-1,y+yskew+height);
if (LH)
    draw_line(x,y,x,y+height);
draw_set_alpha(1);
}
}
