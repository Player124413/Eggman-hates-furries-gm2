var __b__;
__b__ = action_if(x<__view_get( e__VW.XView, 0 )+660);
if __b__
{
__b__ = action_if(active);
if __b__
{
draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(x,y,ct,1);
draw_vertex_color(x+width,y+yskew,ct,1);
draw_vertex_color(x,y+height,cb,1);
draw_vertex_color(x+width,y+yskew+height,cb,1);
draw_primitive_end();

c=ceil(width/16);
b=0;
for(j=0.5; j<c; j+=1)
    {
    if (b) a=c1; else a=c2;
    draw_sprite_ext(sgrass2,(j-0.5) mod 5,x*(c-j)/c+(x+width)*j/c,y*(c-j)/c+(y+yskew)*j/c,1,1,0,a,1);
    b=!b;
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
