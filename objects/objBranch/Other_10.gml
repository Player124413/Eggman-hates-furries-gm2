if (!instance_exists(sp))
{
    instance_destroy();
    exit;
}

if (y2>=sp.y2)
    {
    endus=0;
    y2=sp.y2;
    with (objBranch)
        lol=1;
    g=id;
    while (g != sp && instance_exists(g))
        {
        g.super = 1;
        g = g.p;
        }
    }


