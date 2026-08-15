action_create_object(objSonicEnd1, 128, 432);
action_create_object(objTailsEnd1, 112, 288);
__view_set( e__VW.XView, 0, 0 );
__view_set( e__VW.YView, 0, 0 );
sx=304;
sy=416;
for(j=0; j<120; j+=1)
    {
    i=instance_create(sx,sy,objSmokeEnd);
    repeat(j)
        {
        with i
            {
            event_user(0);
            x+=hspeed;
            y+=vspeed;
            }
        }
    }
soundloop(global.sndWind);
soundvolume(global.sndWind,0.8);
global.handle=SS_LoadSound("Tails.ogg");
global.handle2=SS_LoadSound("LikeThis.ogg");
phase=0;
txt1=@"
You research us, only to cause our final bane#
Renounce my life I would, but it would be in vain#
#
I know it is aside with him that I belong
";
txt2=
@"
His hand finds mine when I am in my deepest pain#
He verily is the first link of  my memory chain#
 #
I only hope he never thinks he did me wrong
";
light = 0;
timer = 0;
yp1 = 480;
yp2 = 480;
c = 0;
phase = 0;
next = 0;
__background_set_colour( make_color_rgb(64,0,32) );

__background_set( e__BG.Index, 0, bgsky );
__background_set( e__BG.Visible, 0, 1 );
__background_set( e__BG.HTiled, 0, 1 );
__background_set( e__BG.VTiled, 0, 0 );
__background_set( e__BG.VSpeed, 0, 0 );
__background_set( e__BG.HSpeed, 0, 0 );
__background_set( e__BG.X, 0, 0 );
__background_set( e__BG.Y, 0, -64 );
__background_set( e__BG.Alpha, 0, 0.5 );

__background_set( e__BG.Index, 1, bgBackEnd );
__background_set( e__BG.Visible, 1, 1 );
__background_set( e__BG.HTiled, 1, 0 );
__background_set( e__BG.VTiled, 1, 0 );
__background_set( e__BG.VSpeed, 1, 0 );
__background_set( e__BG.HSpeed, 1, 0 );
__background_set( e__BG.X, 1, 0 );
__background_set( e__BG.Y, 1, 150 );

c=0;
a=0;

credWidth=320;
credSep=-1;
draw_set_font(creditFont);

creds[a]="";
f=file_text_open_read("Credits.txt");
s=file_text_read_string(f);
file_text_readln(f);
while (s!="$EOF" && !file_text_eof(f))
    {
    creds[a]+=s;
    s=file_text_read_string(f);
    file_text_readln(f);
    c+=1;
    if (c>8)
        {
        credH[a]=string_height_ext(string_hash_to_newline(creds[a]),credSep,credWidth);
        a+=1;
        creds[a]="";
        c=0;
        }
    else
        creds[a]+=" #";
    }
file_text_close(f);
credH[a]=string_height_ext(string_hash_to_newline(creds[a]),credSep,credWidth);
totalCreds=a;
credY=480;
credHeight=0;
for(a=0; a<totalCreds; a+=1)
    {
    credHeight+=credH[a];
    }
/*
credSurf=surface_create(credWidth,credHeight+256);
surface_set_target(credSurf);
draw_background(bgLogo,0,0);
draw_set_color(make_color_rgb(16,8,8));
draw_text_ext(2,256,creds,credSep,credWidth);
draw_set_color(make_color_rgb(32,16,16));
draw_text_ext(1,256,creds,credSep,credWidth);
draw_set_color(make_color_rgb(64,32,32));
draw_text_ext(0,256,creds,credSep,credWidth);
surface_reset_target();
*/
/* */
rainmove = 0;
/* */
/*  */
