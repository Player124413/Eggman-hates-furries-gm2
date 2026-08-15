//CLOSE FINAL DOOR
i=instance_create(x,y-640,greatbrown);
i.x2=x-320;
i.y2=y+640;
i.c3=c_black;
i.c4=c_black;
i.depth=-1;
i=instance_create(x,y+640,greatbrown);
i.x2=x-320;
i.y2=y+1280;
i.c3=c_black;
i.c4=c_black;
i.depth=-1;

with all
    {
    if(object_index==cleanline || object_index==line)
         {if(x<=other.myDoor.x+16 && x2<=other.myDoor.x+16)
        instance_destroy();}
    else if(object_index!=controlbg && object_index!=objectfg && x<other.myDoor.x)
        instance_destroy();
    }
