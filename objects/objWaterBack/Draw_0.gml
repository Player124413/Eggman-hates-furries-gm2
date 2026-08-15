y=objWaterFront.y;
top=y;

bottom=top-(top-(__view_get( e__VW.YView, 0 )+240))/1.5;

left=__view_get( e__VW.XView, 0 )-(__view_get( e__VW.XView, 0 )*(1-1/1.5) mod 960)-960*(__view_get( e__VW.XView, 0 )<0);
draw_background_ext(bgOverWater,left,bottom-286,1,1,0,c_white,1);
draw_background_ext(bgOverWater,left+960,bottom-286,1,1,0,c_white,1);

gpu_set_texrepeat(1);
draw_set_color(c_white);    
for(c=nu-1; c>=0; c-=1)
    {
    a=c/nu;
    b=1-a;
    a2=a+1/nu;
    b2=b-1/nu;
    px[c]+=a*(__view_get( e__VW.XView, 0 )-lastVX)/1.5;    
    while (px[c]>__view_get( e__VW.XView, 0 )) px[c]-=128;
    while (px[c]<=__view_get( e__VW.XView, 0 )-128) px[c]+=128;
    
    if(c==nu)
        {
        draw_set_color(c_black);
        draw_rectangle(__view_get( e__VW.XView, 0 ),bottom+128,__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,0);
        draw_set_color(c_white);    
        draw_primitive_begin_texture(pr_trianglestrip,tex2);
        draw_vertex_texture(px[nu],bottom,0,0);
        draw_vertex_texture(px[nu]+768,bottom,12,0);
        draw_vertex_texture(px[nu],bottom+128,0,1);
        draw_vertex_texture(px[nu]+768,bottom+128,12,1);
        draw_primitive_end();
        }
    draw_set_alpha(0.5);
    draw_primitive_begin_texture(pr_trianglestrip,tex);
    draw_vertex_texture(px[c],top*b+bottom*a,0,b);
    draw_vertex_texture(px[c]+768,top*b+bottom*a,6,b);
    draw_vertex_texture(px[c],top*b2+bottom*a2,0,b2);
    draw_vertex_texture(px[c]+768,top*b2+bottom*a2,6,b2);
    draw_primitive_end();
    draw_set_alpha(1);
    }
gpu_set_texrepeat(0);
lastVX=__view_get( e__VW.XView, 0 );
