ax=512*(__view_get( e__VW.XView, 0 ) div 512);
ax+=((__view_get( e__VW.XView, 0 )*0.9) mod 512)-512;
while (ax<__view_get( e__VW.XView, 0 )-512)
    ax+=512;
// Reset render state left by End before drawing Ultimate.
draw_set_blend_mode(bm_normal);
draw_set_color(c_white);
draw_set_alpha(1);
// Clear stale room graphics before drawing Ultimate's own sky.
draw_clear(c_black);
while (ax<__view_get( e__VW.XView, 0 )+640)
    {
    draw_sprite(bgsky,0,ax,-32);
    ax+=512;
    }
