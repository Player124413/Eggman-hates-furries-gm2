// Explicitly disable the atomic cutscene fog before drawing End.
d3d_set_fog(false,c_black,0,0);
// End scene: prepare the two-layer background and instantiate the original
// Sonic/Tails ending actors. Keep Ultimate (lev 19) separate from this scene.
__view_set(e__VW.XView, 0, 0);
__view_set(e__VW.YView, 0, 0);
for (var bg_slot=0; bg_slot<8; bg_slot+=1)
    __background_set(e__BG.Visible, bg_slot, 0);
__background_set_colour(c_black);
__background_set(e__BG.Visible, 0, 0);
__background_set(e__BG.Index, 0, bgsky);
__background_set(e__BG.X, 0, 0);
__background_set(e__BG.Y, 0, -64);
__background_set(e__BG.HTiled, 0, 1);
__background_set(e__BG.VTiled, 0, 0);
__background_set(e__BG.HSpeed, 0, 0);
__background_set(e__BG.VSpeed, 0, 0);
__background_set(e__BG.Alpha, 0, 0.5);
__background_set(e__BG.Visible, 1, 0);
__background_set(e__BG.Index, 1, bgBackEnd);
__background_set(e__BG.X, 1, 0);
__background_set(e__BG.Y, 1, 150);
__background_set(e__BG.HTiled, 1, 0);
__background_set(e__BG.VTiled, 1, 0);
__background_set(e__BG.HSpeed, 1, 0);
__background_set(e__BG.VSpeed, 1, 0);
__background_set(e__BG.Alpha, 1, 1);

// Draw the End backgrounds manually. Some converted projects treat legacy
// background assets as sprites, and layer indices can render as magenta.
depth=10000;
endTimer=0;
instance_create(224,360,objTailsEnd1);
instance_create(384,360,objSonicEnd1);
