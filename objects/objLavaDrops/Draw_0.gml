var __b__;
__b__ = action_if(y<objLava.y);
if __b__
{
{
action_color(255);
var yy;
yy=(objLava.y+y)/2;
draw_primitive_begin(pr_trianglelist);
draw_vertex(x-16,objLava.y);
draw_vertex(x-12,yy);
draw_vertex(x,objLava.y);

draw_vertex(x+12,objLava.y);
draw_vertex(x-12,yy);
draw_vertex(x,objLava.y);

draw_vertex(x+12,objLava.y);
draw_vertex(x-12,yy);
draw_vertex(x,y);

draw_vertex(x+16,objLava.y);
draw_vertex(x+12,yy);
draw_vertex(x,objLava.y);
draw_primitive_end();
}
}
