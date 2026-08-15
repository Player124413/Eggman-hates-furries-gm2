var xx,yy,sx;
draw_set_blend_mode(bm_add);
if (bgX>0)
    bgX-=64;
if (bgX<-64)
    bgX+=64;
if (bgY<-64)
    bgY+=64;
xx=bgX;
yy=bgY;

sx=xx;
while (yy<240)
{
while (xx<320)
{
draw_background(bgStairs,xnull+xx,ynull+yy);
xx+=64;
}
yy+=64;
xx=sx;
}
draw_set_blend_mode(bm_normal);

action_color(0);
draw_primitive_begin(pr_trianglefan);
draw_vertex(x,y);
draw_vertex(x,y+240);
draw_vertex(x+240,y+240);

draw_primitive_end();
action_draw_rectangle(xnull, y, x, ynull+240, 0);
