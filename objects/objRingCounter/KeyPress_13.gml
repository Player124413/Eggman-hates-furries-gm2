ok=0;
if (instance_exists(sonic))
    {
    if (sonic.able)
        ok=1;
    }
if (instance_exists(objSuperSonic))
    {
    if (objSuperSonic.able)
        ok=1;
    }
if (instance_exists(sonails))
    {
    if (sonails.able)
        ok=1;
    }
if (instance_exists(bike))
    {
    if (bike.able)
        ok=1;
    }
var __b__;
__b__ = action_if(ok);
if __b__
{
var a,k0,k1,k2,m,b,c;
a=1;
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0,0,640,480,0);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_font(tutorialFont);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(320,230,string_hash_to_newline("PAUSED"));
draw_set_font(assessmentfont);
draw_text(320,256,string_hash_to_newline("Press escape or enter to resume"));
draw_set_halign(fa_left);
draw_set_valign(fa_top);


//Pause/resume any and all music
k0=0;
k1=0;
k2=0;
m=0;
n=-1;

if(SS_IsHandleValid(global.handle))
    {
    if(SS_IsSoundPlaying(global.handle))
        {
        SS_PauseSound(global.handle);
        m=1;
        }
    }

if(instance_exists(introgenerator))
    {
    if(SS_IsSoundPlaying(global.speech0))
        {
        k0=1;
        SS_PauseSound(global.speech0);
        }
    }
if(instance_exists(introgenerator))
    {
    if(SS_IsSoundPlaying(global.speech1))
        {
        k1=1;
        SS_PauseSound(global.speech1);
        }
    }
if(instance_exists(introgenerator))
    {
    if(SS_IsSoundPlaying(global.speech2))
        {
        k2=1;
        SS_PauseSound(global.speech2);
        }
    }
// sound_background_tempo() only controlled the removed legacy MIDI
// subsystem. The modern audio engine is paused/muted below.
audio_master_gain(0);
//Pause loop incoming!
soundplay(global.sndPause);
b=0;
c=0;
while (a)
    {
    //workarounds for bug in check_direct:
    if(keyboard_check(vk_escape))
        {
        if(c)
            a=0;
        }
    else
        c=1;
    if(keyboard_check(vk_enter))
        {
        if(b)
            a=0;
        }
    else
        b=1;
    sleep(33);
    }
soundplay(global.sndType);
if(k0)
    SS_ResumeSound(global.speech0);
if(k1)
    SS_ResumeSound(global.speech1);
if(k2)
    SS_ResumeSound(global.speech2);
if(m)
    SS_ResumeSound(global.handle);
audio_master_gain(1);
io_clear();
}
