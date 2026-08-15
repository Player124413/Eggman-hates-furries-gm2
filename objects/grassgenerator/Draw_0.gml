var __b__;
__b__ = action_if(phase==5);
if __b__
{
var a,b;
a=(__view_get( e__VW.XView, 0 ) mod 64)/64;
b=(__view_get( e__VW.YView, 0 ) mod 64)/64;
gpu_set_texrepeat(1);
draw_set_color(col);
draw_primitive_begin_texture(pr_trianglestrip,background_get_texture(bgChequer));
draw_vertex_texture(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 ),a,b);
draw_vertex_texture(__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 ),a+10,b);
draw_vertex_texture(__view_get( e__VW.XView, 0 ),__view_get( e__VW.YView, 0 )+480,a,b+7.5);
draw_vertex_texture(__view_get( e__VW.XView, 0 )+640,__view_get( e__VW.YView, 0 )+480,a+10,b+7.5);
draw_primitive_end();
gpu_set_texrepeat(1);
}
