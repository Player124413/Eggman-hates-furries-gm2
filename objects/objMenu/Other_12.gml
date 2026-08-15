choice=-option;
if (choice<0) choice+=7;
var __b__;
__b__ = action_if(up==0 && able);
if __b__
{
{
__b__ = action_if(choice==0);
if __b__
{
i=instance_create(656,0,objBorderMenu);
i.menu_function=2;
able=0;
}
__b__ = action_if(choice==1);
if __b__
{
global.verticalSync=!global.verticalSync;
if(global.verticalSync)
    emerald_t[1]="Vsync: On";
else
    emerald_t[1]="Vsync: Off";
set_synchronization(global.verticalSync);
}
__b__ = action_if(choice==2);
if __b__
{
global.zeroRingMode=!global.zeroRingMode;
if(global.zeroRingMode)
    emerald_t[2]="Zero Ring Mode: On";
else
    emerald_t[2]="Zero Ring Mode: Off";
}
__b__ = action_if(choice==6);
if __b__
{
action_end_game();
}
__b__ = action_if(choice==3);
if __b__
{
i=instance_create(656,0,objBorderMenu);
i.menu_function=0;
able=0;
}
__b__ = action_if(choice==4);
if __b__
{
i=instance_create(656,0,objBorderMenu);
i.menu_function=1;
able=0;
}
__b__ = action_if(choice==5);
if __b__
{
with all
    instance_destroy();
audio_stop_sound(FoxFace);
instance_create(0,0,objMenuCreds);
}
}
}
