if(instance_exists(objCpu))
    {    
    x2 =objCpu.x;
    y2 =objCpu.y-32;
    }
else
    depth=-10;
action_set_alarm(3+ceil(random(5)), 0);
