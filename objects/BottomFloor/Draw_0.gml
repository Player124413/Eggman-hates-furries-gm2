action_color(0);
draw_primitive_begin(pr_trianglefan);
draw_vertex(x,y);
draw_vertex(x,y+240);
draw_vertex(x+240,y+240);

draw_primitive_end();
action_draw_rectangle(makestairs.xnull, y+16, makestairs.xnull+320, makestairs.ynull+240, 0);
