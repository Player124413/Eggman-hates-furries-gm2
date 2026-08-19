function destroyRingCounter() {
    var ring_counter = instance_find(objRingCounter, 0);
    if (instance_exists(ring_counter))
    {
        ring_counter.kill = 1;
        with (ring_counter)
            instance_destroy();
    }
}
