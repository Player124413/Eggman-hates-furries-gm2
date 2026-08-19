action_create_object(makestairs, 0, 0);
room_speed = 60;

__background_set_colour(c_blue);
c = 0;
a = 0;
credWidth = 320;
credSep = -1;
draw_set_font(creditFont);
creds[0] = "";

if (file_exists("Credits.txt"))
{
    var f = file_text_open_read("Credits.txt");
    if (f >= 0)
    {
        while (!file_text_eof(f))
        {
            var s = file_text_read_string(f);
            file_text_readln(f);
            if (s == "$EOF")
                break;

            creds[a] += s;
            c += 1;
            if (c > 8)
            {
                credH[a] = string_height_ext(string_hash_to_newline(creds[a]), credSep, credWidth);
                a += 1;
                creds[a] = "";
                c = 0;
            }
            else
            {
                creds[a] += " #";
            }
        }
        file_text_close(f);
    }
}

// Keep the credits screen functional even if an old build omitted the datafile.
if (creds[0] == "")
{
    creds[0] = "EGGMAN HATES FURRIES# #A GAME BY ODDWARG# #SONIC THE HEDGEHOG AND RELATED CHARACTERS#SEGA# #THANK YOU FOR PLAYING";
    a = 0;
}

credH[a] = string_height_ext(string_hash_to_newline(creds[a]), credSep, credWidth);
totalCreds = a + 1;
credY = 480;
credHeight = 0;
for (a = 0; a < totalCreds; a += 1)
    credHeight += credH[a];

timer = 0;
light = 0;
