action_set_relative(1);
var __b__;
__b__ = action_if(phase==0);
if __b__
{
timer+=global.time;

if (timer==230)
    {
    soundplay(global.speech0);
    }

if (count==0)
    {
    count+=1;
    event_user(7);

    i=instance_create(xx,yy,mtline);
    xx+=1280;
    yy-=1280;
    i.x2=xx;
    i.y2=yy;
    }
if (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )>xx-32)
    {
    in_clean();
    i=instance_create(xx,yy,mtline);
    xx+=320;
    yy-=280+(timer*7) mod 40 + 40*cos(timer);
    i.x2=xx;
    i.y2=yy;
    }
event_user(0);

if (timer>230+45*30)
    {
    event_user(1);
    }
}
__b__ = action_if(phase==1);
if __b__
{
timer+=global.time;

if (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )>xx-32)
    {
    if (count<12)
        {
        slope=50;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=214.81;
        yy-=256;
        i.x2=xx;
        i.y2=yy;
        }
    else if (count<22)
        {
        if (count==12)
            {
            tutorialText="Press CTRL KEY to boost,#DOWN ARROW to use handbrake";
            alarm[1]=7*60;
            }
        
        slope=45;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=320;
        yy-=280+(timer*7) mod 40 + 40*cos(timer);
        i.x2=xx;
        i.y2=yy;
        }
    else if count<30
        {
        if (count==22)
            {
            tutorialText="Press LEFT and RIGHT ARROWS to pitch";
            alarm[1]=7*60;
            }
        slope=26.57;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=320;
        yy+=-160+((timer*7) mod 20)-10 + 20*cos(timer);
        i.x2=xx;
        i.y2=yy;
        }
    else
        {
        slope=45;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=320;
        yy+=-320+((timer*7) mod 20)-10 + 20*cos(timer);
        i.x2=xx;
        i.y2=yy;
        if (bike.speed>29 && count>36)
            {
            phase=2;
            timer=0;
            count=-1;//Because it is +=1 down there vv
            }
        }
    count+=1;
    }
}
__b__ = action_if(phase==2);
if __b__
{
timer+=global.time;

if (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )>xx-32)
    {
    if (count==0)
        {
        slope=45;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=32;
        i.x2=xx;
        i.y2=yy;
        
        i=instance_create(xx,yy,mtline);
        
        with (mtline)
            xdeep=other.xx;
        xx+=640;
        yy+=1280;//Need event if you fall here.(fixed??)
        i.x2=xx;
        i.y2=yy;
        
        maxCam=yy-960;
        
        }
    else if (count==1)
        {
        slope=45;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=480;
        yy-=1280+640;//Still need event if you fall here.(fixed??)
        i.x2=xx;//Lock the screen to a maximum y position and die if you go below.
        i.y2=yy;//maxCam!
        }
    else if(count==2)
        {
        i=instance_create(xx,yy,mtline);
        xx+=128;
        i.x2=xx;
        i.y2=yy;
        slope=45;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=480;
        yy-=480;
        i.x2=xx;
        i.y2=yy;
        }
    else
        {
        phase=3;
        timer=0;
        count=-1;
        maxCam=-1;
        /*bike.able=0;
        bike.correction=1;*/
        }
    count+=1;
    }
/* */
}
__b__ = action_if(phase==3);
if __b__
{
timer+=global.time;

if (timer==10)
    {
    soundplay(global.speech1);
    }

if (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )>xx-32)
    {
    in_clean();
    i=instance_create(xx,yy,mtline);
    xx+=320;
    yy-=280+(timer*7) mod 40 + 40*cos(timer);
    i.x2=xx;
    i.y2=yy;
    }
//event_user(0);

if (timer>10+20*30)
    {
    global.introProg=2;
    timer=0;
    phase=4;
    bike.able=1;
    count=0;
    }
/* */
}
__b__ = action_if(phase==4);
if __b__
{
timer+=global.time;


if (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )>xx-32)
    {
    if (count==0)
        {
        slope=45;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=640;
        yy-=640;
        i.x2=xx;
        i.y2=yy;
        i=instance_create(xx,yy,mtline);
        xx+=640;
        yy-=640;
        i.x2=xx;
        i.y2=yy;
        }
    else if (count<3)
        {
        slope=60;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=1.5*241.81;
        yy-=1.5*256;
        i.x2=xx;
        i.y2=yy;
        }
    else if (count==3)
        {
        viper.phase=2;
        viper.xx=xx+1600;
        viper.yy=yy-1280;
        
        slope=22;
        //Ground section;
        in_clean();
        j=instance_create(xx,yy,mtline);
        with mtline
            xdeep=other.xx;
        xx+=256;
        yy+=256;
        j.x2=xx;
        j.y2=yy;
        i=instance_create(xx,yy,mtline);
        i.xdeep=j.x;
        xx+=256;
        yy+=64;
        i.x2=xx;
        i.y2=yy;
        
        i=instance_create(j.x,yy,objBkSquare)
        i.x2=i.x+2560;
        i.y2=i.y+480;
        
        i=instance_create(xx,yy,mtline);
        i.xdeep=-1;
        xx+=960;
        i.x2=xx;
        i.y2=yy;
        
        maxCam=yy-320;
        
        rxx=xx;
        ryy=yy;
        
        mountLoop();
        
        xx=rxx;
        yy=ryy;
        }
    else if (count==4)
        {
        slope=45;
        i=instance_create(xx,yy,mtline);
        xx+=128;
        yy-=64;
        i.x2=xx;
        i.y2=yy;
        i=instance_create(xx,yy,mtline);
        xx+=640;
        yy-=640;
        i.x2=xx;
        i.y2=yy;
        i=instance_create(xx,yy,mtline);
        xx+=640;
        yy-=640;
        i.x2=xx;
        i.y2=yy;
        }
    else
        {
        maxCam=-1;
        viper.phase=0;
        phase=5;
        timer=0;
        count=-1;
        //bike.able=0;
        //bike.correction=1;
        }
    count+=1;
    }
/* */
}
__b__ = action_if(phase==5);
if __b__
{
timer+=global.time;

if (timer==10)
    {
    soundplay(global.speech2);
    }

if (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )>xx-32)
    {
    in_clean();
    i=instance_create(xx,yy,mtline);
    xx+=320;
    yy-=280+(timer*7) mod 40 + 40*cos(timer);
    i.x2=xx;
    i.y2=yy;
    }
//event_user(0);

if (timer>10+26*30)
    {
    global.introProg=3;
    timer=0;
    phase=6;
    bike.able=1;
    count=0;
    }
/* */
}
__b__ = action_if(phase==6);
if __b__
{
var a;
timer+=global.time;

if (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )>xx-32 && __view_get( e__VW.YView, 0 )<yy+32)
    {
        if (count==0)
        {
        slope=45;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=640;
        yy-=640;
        i.x2=xx;
        i.y2=yy;
        i=instance_create(xx,yy,mtline);
        xx+=640;
        yy-=640;
        i.x2=xx;
        i.y2=yy;
        }
    else if (count==1)
        {
        slope=60;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=256*0.71;
        yy-=256;
        i.x2=xx;
        i.y2=yy;
        }
    else if (count==2)
        {
        slope=75;
        in_clean();
        i=instance_create(xx,yy,mtline);
        xx+=93;
        yy-=348;
        i.x2=xx;
        i.y2=yy;
        i=instance_create(xx,yy,mtline);
        xx+=48;
        yy-=348;
        i.x2=xx;
        i.y2=yy;
        i=instance_create(xx,yy,mtline);
        xx+=8;
        yy-=192;
        i.x2=xx;
        i.y2=yy;
        }
    else if (count==3)
        {
        viper.phase=2;
        viper.xx=xx-1600;
        viper.yy=yy-1600;
        slope=90;
        in_clean();
        i=instance_create(xx,yy,mtline);
        yy-=480;
        i.x2=xx;
        i.y2=yy;
        a=0; 
        while (a<45)
            {
            i=instance_create(xx-960+lengthdir_x(960,a),yy+lengthdir_y(960,a),mtline);
            a+=5;
            i.x2=xx-960+lengthdir_x(960,a);
            i.y2=yy+lengthdir_y(960,a);
            }
        xx=xx-960+lengthdir_x(960,a);
        yy=yy+lengthdir_y(960,a);
        
        rxx=xx;
        ryy=yy;
        
        i=instance_create(xx,yy,mtline);
        xx+=32;
        yy-=64;
        i.x2=xx;
        i.y2=yy;
        
        i=instance_create(xx,yy,mtline);
        xx-=160;
        yy-=160;
        i.x2=xx;
        i.y2=yy;
        
        i=instance_create(xx,yy,mtline);
        xx+=16;
        yy-=64;
        i.x2=xx;
        i.y2=yy;
        
        mxx=xx+32;
        myy=yy-32;
        
        i=instance_create(xx,yy,mtline);
        xx+=320;
        yy-=96;
        i.x2=xx;
        i.y2=yy;
        i=instance_create(xx,yy,mtline);
        xx+=640;
        yy-=480;
        i.x2=xx;
        i.y2=yy;
        
        phase=7;
        timer=0;
        count=-1;
        }
    count+=1;
    }

/* */
}
__b__ = action_if(phase==7);
if __b__
{
var a,dx,dy;
timer+=global.time;

maxCam=__view_get( e__VW.YView, 0 );

// The bike can be removed when resuming/skipping parts of the intro.
if (instance_exists(bike))
{
if (bike.y<ryy+960 && bike.correction==0 && bike.mySonic==1)
    {
    if (bike.able==1)
        bike.boostgauge=1;
    bike.able=0;
    bike.cb=1;
    bike.cy=-1;
    }

if (bike.x<rxx && bike.y<ryy && bike.correction==0 && bike.mySonic==1)
    {global.time=0.1;
    slope=-45;
    bike.able=0;
    bike.correction=1;
    
    bike.boostgauge=1;
    }
    
if (bike.correction==1 && bike.able==0 && cos(degtorad(bike.dir))>0 && global.time==0.1)
    {
    bike.cb=1;
    if(sin(degtorad(bike.dir))<-0.4)
        {
        if(bike.x<mxx-128)
            {
            bike.correction=0;
            bike.mySonic=0;
            i=instance_create(bike.x+8,bike.y-8,objIntroSonic);
            if bike.x>mxx-192
                i.hspeed=2;
            else if (bike.x<mxx-512)
                i.hspeed=8;
            else
                i.hspeed=4;
            dx=mxx-i.x;
            dy=myy-i.y;
            i.t=dx/i.hspeed;
            i.vspeed=dy/i.t-0.5*i.g*i.t;
            bike.hspeed -= i.hspeed;
            bike.vspeed -= i.vspeed;
    
            soundplay(global.sndJump);
            }
        else
            global.time=0.5;
        }
    }
}

/* */
}
__b__ = action_if(phase==8);
if __b__
{
timer+=global.time;

if (__view_get( e__VW.XView, 0 )+__view_get( e__VW.WView, 0 )>xx-32 && __view_get( e__VW.YView, 0 )<yy+32)
    {
    
        {
        
        in_clean();

        i=instance_create(xx,yy,mtline);
        xx+=320;
        yy-=320;
        i.x2=xx;
        i.y2=yy;
        if(count==4)
            {
            i=instance_create(xx,yy-32,objIntroEmerald);
            }
        if(count==10)
            {
            viper.phase=3;
            }
        }
    count+=1;
    }
/* */
}
// Surfaces can be discarded by the runtime (for example after display_reset).
if (!surface_exists(surf))
    surf = surface_create(640, 480);
surface_set_target(surf);

draw_clear(c_gray);
draw_set_blend_mode(bm_subtract);

if(instance_exists(bike))
    {
    lightcone(bike.x+lengthdir_x(22,bike.dir),bike.y+lengthdir_y(22,bike.dir),bike.dir-5,make_color_rgb(128,160,224),640,64);
    lightcone(bike.x+lengthdir_x(-32,bike.dir),bike.y+lengthdir_y(-32,bike.dir),bike.dir+185,make_color_rgb(255,32,32),320,48);
    
    if(bike.boosting)
        draw_sprite_ext(sprBoostLight,0,bike.x-__view_get( e__VW.XView, 0 ),bike.y-__view_get( e__VW.YView, 0 ),1.5,1.5,bike.dir,c_white,1);
    }
lightcone(viper.x+lengthdir_x(32,viper.lightDir),viper.y+lengthdir_y(32,viper.lightDir),viper.lightDir,make_color_rgb(255,255,255),720,80);
with objVipRocket
    {
    if (image_index>0 || bigBoom)
        draw_circle_color(x-__view_get( e__VW.XView, 0 ),y-__view_get( e__VW.YView, 0 ),16+bigBoom*32,c_white,c_black,0);
    }
with objIntroEmerald
    {
    draw_circle_color(x-__view_get( e__VW.XView, 0 ),y-__view_get( e__VW.YView, 0 ),96+random(32),c_white,c_black,0);
    }
with objbigexp
    {
    draw_circle_color(x-__view_get( e__VW.XView, 0 ),y-__view_get( e__VW.YView, 0 ),128*(1-power(image_index/image_number,2)),c_white,c_black,0);
    }
draw_set_blend_mode(bm_normal);

surface_reset_target();


/* */
action_font(speechFont, 1);
var xxx,yyy;
if (txtAlpha>0)
    {
    if(textTime!=0)//Unnecessary CHECK but wth
            textProg+=global.time/textTime;
    //Do only when text changes
    if(newText)
        {
        newText=false;
        if (!surface_exists(baseSurf))
            baseSurf = surface_create(320, 960);
        surface_set_target(baseSurf);
        draw_clear(c_black);
        draw_set_color(make_color_rgb(96+32*cos(timer/100),112+16*sin(timer/100),64));
        draw_set_blend_mode(bm_add);
        for(xxx=-1; xxx<=1; xxx+=1)
            draw_text_ext(160+xxx,0,string_hash_to_newline(txt),32,256);
        draw_set_blend_mode(bm_normal);
        // Every surface_set_target() must have its own matching reset before
        // another target is selected. Leaving baseSurf active corrupted the
        // surface stack and made the next room fail in presentation.Create.
        surface_reset_target();
        }
    yyy=496-textProg*480;
    draw_set_alpha(txtAlpha);
    if (!surface_exists(textSurf))
        textSurf = surface_create(320, 480);
    surface_set_target(textSurf);
    draw_clear(c_black);
    if(surface_exists(baseSurf))
        draw_surface(baseSurf,0,480-textProg*(440+string_height_ext(string_hash_to_newline(txt),32,256)));
    else
        surfaceError();
    
    draw_background_stretched(upperGrad,0,0,320,yyy);
    draw_background_stretched(lowerGrad,0,yyy,320,480-yyy);
    draw_set_alpha(1);
    surface_reset_target();
    }

/* */
uninterruptableTimer += global.time;
/* */
__b__ = action_if(SS_GetSoundPosition(global.handle)>SS_GetSoundLength(global.handle)*110/112);
if __b__
{
SS_SetSoundPosition(global.handle,SS_GetSoundLength(global.handle)*7.4/112);
/* */
}
__b__ = action_if(whiteOut);
if __b__
{
if(white<1)
    {
    // Do not start the legacy white-noise/siren layer during the intro.
    white+=global.time/60;
    if (white>=1)
        {white=1;
        intro_finish();
        }
        
    // The intro stays on its normal music and speech only.
    }


/* */
}
action_set_relative(0);
/*  */
