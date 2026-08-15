var __b__;
__b__ = action_if(y2>y && x<__view_get( e__VW.XView, 0 )+640 && x2>__view_get( e__VW.XView, 0 ));
if __b__
{
var xx,yy,rr,cnt,g,c,c1,c2;
xx=(x+x2)/2;
rr=x2-xx;
yy=y;
cnt=5;
draw_set_color(c_white);
t=sprite_get_texture(sprite_index,floor(image_index));
while (yy<y2)
    {
    draw_primitive_begin_texture(pr_trianglestrip,t);
    bl=0;
    if (yy+hh>y2)
        g=(y2-yy)/hh;
    else
        g=1;
    
    for (a=0; a<=cnt; a+=1)
        {f=128+127*sin(pi*a/cnt);
        c=make_color_rgb(f,f,f);
        c1=0.9;
        if (yy==y) c1=0;
        draw_vertex_texture_color(xx+rr*cos(pi*a/cnt),yy,bl,0,c,c1);
        draw_vertex_texture_color(xx+rr*cos(pi*a/cnt),yy+hh*g/2,bl,g/2,c,0.9);
        bl=1-bl;}
    
    draw_primitive_end();
    
        draw_primitive_begin_texture(pr_trianglestrip,t);
    bl=0;
    if (yy+hh>y2)
        g=(y2-yy)/hh;
    else
        g=1;
    
    for (a=0; a<=cnt; a+=1)
        {f=128+127*sin(pi*a/cnt);
        c=make_color_rgb(f,f,f);
        c2=0.9;
        if (yy+hh>=y2) c2=0;
        draw_vertex_texture_color(xx+rr*cos(pi*a/cnt),yy+hh*g/2,bl,g/2,c,0.9);
        draw_vertex_texture_color(xx+rr*cos(pi*a/cnt),yy+hh*g,bl,g,c,c2);
        bl=1-bl;}
    
    draw_primitive_end();
    
    
    yy+=hh;
    }

}
