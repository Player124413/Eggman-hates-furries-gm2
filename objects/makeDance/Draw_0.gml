action_set_relative(1);
omg=1;
for(xx=x; xx<640; xx+=64)
    {
    if(omg)
        {
        for(yy=y+64;yy<y+224;yy+=32)
            {
            draw_background(bgTavern,xx,yy);
            }
        }
    omg=!omg;
    draw_background(bgTavernRoof,xx,y);
    draw_background(bgTavernFloor,xx,y+224);
    }

action_draw_background(bgTavernWindow, 192, 128, 0);
action_set_relative(0);
