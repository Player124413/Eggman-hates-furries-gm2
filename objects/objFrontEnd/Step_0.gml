endTimer+=1;
if (endTimer>=900)
{
    // End comes before Ultimate in the intended sequence.
    with all
    {
        if (object_index!=controlbg && object_index!=objFrontEnd)
            instance_destroy();
    }
    controlbg.lev=19;
    room_speed=60;
    instance_create(0,0,uctrl);
    instance_destroy();
}
