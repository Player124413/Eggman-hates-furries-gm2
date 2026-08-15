draw_set_color(c_black);
draw_primitive_begin(pr_trianglelist);
draw_vertex(x,y);
draw_vertex(x2,y2);
draw_vertex(x3,y3);

if(shade)
    {draw_vertex_color(x,y-16,0,0.5);//-(drill.lastTri==id)/4);
    draw_vertex_color(x2,y2-16,0,0.5);//-(drill.lastTri==id)/4);
    draw_vertex_color(x3,y3-16,0,0.5);}//-(drill.lastTri==id)/4);
draw_primitive_end();
