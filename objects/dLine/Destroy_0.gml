// dLine and its parent both own helper endpoints. Cleanup is idempotent:
// collision code may have deleted any of them already.
if (iL != -1 && instance_exists(iL))
    with (iL) instance_destroy();
if (iR != -1 && instance_exists(iR))
    with (iR) instance_destroy();
if (i1 != -1 && instance_exists(i1))
    with (i1) instance_destroy();
if (i2 != -1 && instance_exists(i2))
    with (i2) instance_destroy();

action_inherited();
