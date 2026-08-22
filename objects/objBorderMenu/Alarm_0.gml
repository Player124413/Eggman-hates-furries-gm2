var __b__;
__b__ = action_if(menu_function==0);
if __b__
{
//music
items=objMenu.musics;
for(a=0; a<items; a+=1)
    {
    item[a]=objMenu.music_n[a];
    }
item[items]="back";
items+=1;
}
__b__ = action_if(menu_function==1);
if __b__
{
//sound
items=objMenu.nSounds;
for(a=0; a<items; a+=1)
    {
    item[a]=objMenu.nSound[a];
    }
item[items]="back";
items+=1;
}
__b__ = action_if(menu_function==2);
if __b__
{
a=0;  item[a]="Intro";
item_n[a]=-9001;
a+=1; item[a]="Dream";
item_n[a]=-10;
a+=1; item[a]="Cabin";
item_n[a]=-9;
a+=1; item[a]="Takeoff";
item_n[a]=-8;
a+=1; item[a]="Eggman";
item_n[a]=-7;

a+=1; item[a]="Panjan";
item_n[a]=-6;
a+=1; item[a]="Water";
item_n[a]=-5;
a+=1; item[a]="Climb";
item_n[a]=-4;
a+=1; item[a]="Drill";
item_n[a]=-3;
a+=1; item[a]="Grass";
item_n[a]=-2;

a+=1; item[a]="Flak";
item_n[a]=1;
a+=1; item[a]="Robot";
item_n[a]=2;
a+=1; item[a]="Doors";
item_n[a]=3;
a+=1; item[a]="Lost";
item_n[a]=4;
a+=1; item[a]="Hell";
item_n[a]=5;
a+=1; item[a]="ZigZag";
item_n[a]=6;
a+=1; item[a]="Doll";
item_n[a]=7;
a+=1; item[a]="Free";
item_n[a]=8;
a+=1; item[a]="Chopper";
item_n[a]=9;
a+=1; item[a]="Hangar";
item_n[a]=10;
a+=1; item[a]="Join me";
item_n[a]=11;
a+=1; item[a]="Egg";
item_n[a]=12;
a+=1; item[a]="Roll";
item_n[a]=13;
a+=1; item[a]="Emeralds";
item_n[a]=14;
a+=1; item[a]="Saved";
item_n[a]=15;
a+=1; item[a]="Attack";
item_n[a]=16;
a+=1; item[a]="Battle";
item_n[a]=17;
a+=1; item[a]="End";
item_n[a]=18;
a+=1; item[a]="Ultimate";
item_n[a]=19;
a+=1;
// All levels are available from the level select screen. Keep the full
// catalogue visible regardless of saved progress or completion state.
items=a;

item[items]="back";
items+=1;

event_user(3);
}
