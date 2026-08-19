if (!instance_exists(p))
{
    instance_destroy();
    exit;
}

var s,c;
draw_set_blend_mode(bm_add);
c=make_color_rgb(255,64,0);
s=sin(blobbeh);
draw_circle_color(p.x,p.y,32*(3+s),c,c_black,0);
draw_primitive_begin(pr_trianglestrip);
draw_vertex_color(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),c,1);
draw_vertex_color(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+480,c,1);
draw_vertex_color(__view_get( e__VW.XView, 0 )+320-32*s,__view_get( e__VW.YView, 0 ),c_black,0);
draw_vertex_color(__view_get( e__VW.XView, 0 )+320-32*s,__view_get( e__VW.YView, 0 )+480,c_black,0);
draw_primitive_end();
draw_set_blend_mode(bm_normal);
blobbeh+=0.1*global.time;
