if(instance_exists(objQuitWarning))
    {
    if(instance_exists(introgenerator))
        game_end();
    else
        goToMenu();
    }
else
    {
    soundplay(global.sndType);
    i=instance_create(0,0,objQuitWarning);
    if(instance_exists(introgenerator))
        i.txt="Press Escape again to quit";
    }
