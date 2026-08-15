action_set_relative(1);
draw_set_color(c_black);
draw_rectangle(x-128-64-320,y-32-320,x+320+32,y+256+320,0);

omg=1;

xx=x-128-32;
for(yy=y+64;yy<y+224;yy+=32)
    {
    draw_background(bgTavern,xx,yy);
    if(yy>y+128)
        draw_background_stretched(bgTavern,xx+128,yy,32,32);
    }
draw_background(bgTavernRoof,xx,y);
draw_background(bgTavernRoof,xx+64,y);
draw_background(bgTavernFloor,xx,y+224);
draw_background(bgTavernFloor,xx+64,y+224);
draw_background_stretched(bgTavernFloor,xx+128,y+224,32,16);

for(xx=x; xx<640; xx+=64)
    {
    if(omg)
        {
        for(yy=y+64;yy<y+224;yy+=32)
            {
            if(xx+64>=640)
                draw_background_part(bgTavern,0,0,64,32,xx,yy);
            else
                draw_background(bgTavern,xx,yy);
            }
        }
    omg=!omg;
    draw_background(bgTavernRoof,xx,y);
    draw_background(bgTavernFloor,xx,y+224);
    }

draw_background_stretched(bgTavernFloor,xx,y+224,32,16);
draw_background_stretched(bgTavern,xx,y+224-32,32,32);
draw_background_stretched(bgTavern,xx,y+224-64,32,32);
action_draw_background(bgTavernWindow2, 192, 128, 0);
action_draw_background(bgTavernWindow2, -128-16, 128, 0);
action_set_relative(0);
