action_create_object(makestairs, 0, 0);
room_speed=60;

__background_set_colour( c_blue );
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
timer = 0;
light = 0;
