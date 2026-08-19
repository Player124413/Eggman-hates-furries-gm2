for (var n = 0; n < min(nodes, array_length(node)); n += 1)
{
    var segment = node[n];
    if (instance_exists(segment))
    {
        with (segment)
            instance_destroy();
    }
}
