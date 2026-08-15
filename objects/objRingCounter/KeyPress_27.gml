var __b__;
__b__ = action_if(!instance_exists(objMenu) && !instance_exists(objMenuCreds) && !instance_exists(presentation) && !instance_exists(objFrontEnd));
if __b__
{
{
__b__ = action_if(instance_exists(introgenerator) && global.introHasBeenCleared);
if __b__
{
intro_finish();
}
else
{
if(instance_exists(objQuitWarning))
    {
    if(instance_exists(introgenerator))
        game_end();
    else
        {
        if(instance_exists(cam))
            {
            d3d_set_culling(0);
            d3d_end();
            }
        goToMenu();
        }
    }
else
    {
    soundplay(global.sndType);
    i=instance_create(0,0,objQuitWarning);
    if(instance_exists(introgenerator))
        i.txt="Press Escape again to quit";
    }
}
}
}
