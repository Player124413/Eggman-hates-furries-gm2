xx=x;
while (xx<=x2-64)
    {
    draw_background(bglavarock,xx,y-256);
    xx+=64;
    }
if (xx<x2)
    {
    draw_background_part(bglavarock,0,0,x2-xx,256,xx,y-256);
    }
