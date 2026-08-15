if(myImg!=-1)
    {
    background_delete(myImg);
    myImg=-1;
    }
geWhite=1;
if(choice!=items-1)
    myImg=background_add(working_directory+"/levelSelect/"+"scr_"+string(item_n[choice])+".png",0,0,1);
