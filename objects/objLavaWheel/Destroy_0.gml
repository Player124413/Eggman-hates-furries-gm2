var __b__;
__b__ = action_if(on);
if __b__
{
with i1
    instance_destroy();
for(a=0; a<plats; a+=1)
    {
    with (plat[a])
        instance_destroy();
    }
}
