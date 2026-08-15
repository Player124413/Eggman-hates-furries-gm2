d3d_set_projection_ortho(0,0,640,480,0);
d3d_set_culling(0);
d3d_set_hidden(0);

with cam
    {
    draw_overlay();
    }

d3d_set_hidden(1);
d3d_set_culling(1);
