ax=512*(__view_get( e__VW.XView, 0 ) div 512);
ax+=((__view_get( e__VW.XView, 0 )*0.9) mod 512)-512;
while (ax<__view_get( e__VW.XView, 0 )-512)
    ax+=512;
while (ax<__view_get( e__VW.XView, 0 )+640)
    {
    draw_background(bgsky,ax,-32);
    ax+=512;
    }
