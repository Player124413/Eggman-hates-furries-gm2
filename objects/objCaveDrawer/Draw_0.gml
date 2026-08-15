with objTri
    {
    draw_set_blend_mode(bm_add);
    draw_set_color(c_white);
    draw_primitive_begin_texture(pr_trianglelist,background_get_texture(bgDrilled));
    draw_vertex_texture(x,y,0,0)
    draw_vertex_texture(x2,y2,0,1)
    draw_vertex_texture(x3,y3,1,1)
    draw_primitive_end();
    draw_set_blend_mode(bm_normal);
    }
