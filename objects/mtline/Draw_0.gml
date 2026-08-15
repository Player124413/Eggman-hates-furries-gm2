var __b__;
__b__ = action_if(active);
if __b__
{
{
var xoff;
if (xdeep!=-1 && xdeep!=-2)
    xoff=1;
else
    xoff=0;

on=1;
if(xa<__view_get( e__VW.XView, 0 )-32 && xoff && xdeep<__view_get( e__VW.XView, 0 )-32)
    on=0;
else if(ya<__view_get( e__VW.YView, 0 )-32)
    on=0;
else if(xi>__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+32 && (!xoff || xdeep>__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )+32))
    on=0;
else if(yi>__view_get( e__VW.YView, 0 )+__view_get( e__VW.HView, 0 )+32)
    on=0;
__b__ = action_if(on);
if __b__
{
amount=ceil(d/16);
for(j=0; j<=amount; j+=1)
    {
    g=j/amount;
    h=1-j/amount;
    draw_sprite_ext(sprBlackRocks,j mod 6,x*g+x2*h,y*g+y2*h,1,1,(id-10000)*(j mod 7),c_white,1);
    }
    
if(xdeep==-2)
    {
    draw_set_color(c_black);
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex(x,y);
    draw_vertex(x2,y2);
    draw_vertex(max(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),x),y);
    draw_vertex(max(__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 ),x2),y2);
    
    draw_primitive_end();
    }
else if (xdeep!=-1)
    {
    draw_set_color(c_black);
    draw_primitive_begin(pr_trianglestrip);
    draw_vertex(x,y);
    draw_vertex(x2,y2);
    draw_vertex(xdeep,y);
    draw_vertex(xdeep,y2);
    
    draw_primitive_end();
    }
}
}
}
