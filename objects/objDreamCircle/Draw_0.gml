if (nodes > 0 && array_length(node) > 0)
{
    var valid_nodes = 0;
    var n;
    for (n = 0; n < min(nodes, array_length(node)); n += 1)
    {
        if (instance_exists(node[n]))
            valid_nodes += 1;
    }

    // A triangle fan needs at least two outer points. Generated line nodes can
    // be destroyed during tutorial phase transitions before this Draw event.
    if (valid_nodes >= 2)
    {
        var tx = 0;
        var first_node = noone;
        draw_primitive_begin_texture(pr_trianglefan, sprite_get_texture(sprite_index, image_index));
        draw_vertex_texture_color(x, y, 0, 0, image_blend, image_alpha);

        for (n = 0; n < min(nodes, array_length(node)); n += 1)
        {
            var segment = node[n];
            if (instance_exists(segment))
            {
                if (!instance_exists(first_node))
                    first_node = segment;
                draw_vertex_texture_color(segment.x, segment.y, tx, 1, image_blend, image_alpha);
                tx = !tx;
            }
        }

        if (instance_exists(first_node))
            draw_vertex_texture_color(first_node.x, first_node.y, tx, 1, image_blend, image_alpha);
        draw_primitive_end();
    }
}
