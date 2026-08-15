var __b__;
__b__ = action_if(x<__view_get( e__VW.XView, 0 )+640+wr+hr && x>__view_get( e__VW.XView, 0 )-wr-hr);
if __b__
{
__b__ = action_if(active);
if __b__
{


draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(x1,y1,ct,1);
draw_vertex_color(x2,y2,ct,1);
draw_vertex_color(x3,y3,cb,1);
draw_vertex_color(x4,y4,cb,1);
draw_primitive_end();

c=ceil(point_distance(x1,y1,x2,y2)/16);
b=0;
for(j=0.5; j<c; j+=1)
    {
    if (b) a=c1; else a=c2;
    draw_sprite_ext(sgrass2,(j-0.5) mod 5,x1*(c-j)/c+x2*j/c,y1*(c-j)/c+y2*j/c,1,1,point_direction(x1,y1,x2,y2),a,1);
    b=!b;
    }
if (RH)
    {
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_line(x2,y2,x4,y4);
    draw_set_alpha(1);
    }
if (LH)
    {
    draw_set_color(c_black);
    draw_set_alpha(0.5);
    draw_line(x1,y1,x3,y3);
    draw_set_alpha(1);
    }
}
}
