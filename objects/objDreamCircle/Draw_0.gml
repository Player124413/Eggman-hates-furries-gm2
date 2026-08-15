var __b__;
__b__ = action_if(nodes>0);
if __b__
{
var tx;
draw_primitive_begin_texture(pr_trianglefan,sprite_get_texture(sprite_index,image_index));
draw_vertex_texture_color(x,y,0,0,image_blend,image_alpha);
tx=0;
for(n=0; n<nodes; n+=1)
    {
    draw_vertex_texture_color(node[n].x,node[n].y,tx,1,image_blend,image_alpha);
    tx=!tx;
    }
draw_vertex_texture_color(node[0].x,node[0].y,tx,1,image_blend,image_alpha);
draw_primitive_end();
}
