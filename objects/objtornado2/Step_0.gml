action_set_relative(0);
var __b__;
__b__ = action_if(phase==0);
if __b__
{
if(follow)
    {sp=32;
    if (timer<200)
        dir=(dir*29+22.5)/30;
    else
        dir=(dir*29)/30;}
else
    {timer=0;
    sp=40;
    dir=(dir*29)/30;}

if (timer>300)
    {
    with (all)
        {
        if (id!=other.id && object_index!=objectfg && object_index!=controlbg)
            {instance_destroy();
            soundvolume(global.sndEngine,1);}
        }
    timer=0;
    phase=1;
    x=x mod 12800;
    __view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) mod 12800 );
    controlbg.lev=1;
    controlbg.phase=0;
    }
}
tailsBlink+=global.time;
if (tailsBlink>=2)
    tailsBlink=0;

x+=lengthdir_x(sp*global.time,dir);
y+=lengthdir_y(sp*global.time,dir);

if (instance_exists(sonic) && phase==0)
    {
    if(follow)
        {
        x=(x*3+sonic.x+20)/4;
        y=(y*3+goaly)/4
        }
        
    if (sonic.y>y-32 && follow)
        {
        with (sonic)
            {
            soundplay(global.sndLand1);
            other.myson=sstand;
            instance_destroy();
            }
        }
    }
else
    {
    if(!instance_exists(sonic))
        {__view_set( e__VW.XView, 0, (__view_get( e__VW.XView, 0 )*3+x-320)/4 );
        __view_set( e__VW.YView, 0, (__view_get( e__VW.YView, 0 )*3+y-240)/4 );}

    if (abs(shaking)>0)
        {__view_set( e__VW.XView, 0, __view_get( e__VW.XView, 0 ) + (shaking/2) );
        shaking=-sign(shaking)*(abs(shaking)-1);}
    }
__b__ = action_if(sprite_index==stornadobase);
if __b__
{
image_angle = dir;
}
{
action_set_relative(1);
timer += global.time;
action_set_relative(0);
}
__b__ = action_if(phase==1);
if __b__
{
if (x>6400 && (x/sp) mod 40 <32 && timer mod 2==0 && (y<-1487 || (y<0 && lengthdir_y(1,dir)<0.05)))
    {
    i=instance_create(__view_get( e__VW.XView, 0 )+1280,__view_get( e__VW.YView, 0 )+2560,objbullet);
    i.speed=640+random(128);
    i.direction=point_direction(i.x,i.y,x-380+(x/6) mod 600-8+random(16),y);
    i.hspeed+=32;
    i.image_angle=i.direction;
    }
    
if (x>7200 && (x/sp) mod 60 <32 && timer mod 2==0 && (y<-1487 || (y<0 && lengthdir_y(1,dir)<0.05)))
    {
    i=instance_create(__view_get( e__VW.XView, 0 )+960,__view_get( e__VW.YView, 0 )+2560,objbullet);
    i.speed=640+random(128);
    i.direction=point_direction(i.x,i.y,x+896-(x/8) mod 800-8+random(16),y);
    i.hspeed+=32;
    i.image_angle=i.direction;
    }
    
if(x>6400 && x<7200 && (x/sp) mod 40 <32 && (x/sp) mod 40 >11)
    {myson=sedge; sonimg+=global.time/2; if (sonimg>=3)sonimg=0;}
if(x>7200 && myson>-1)
    {myson=sduck;sonimg=1;}
    
if(x>6900&&x<7600)
    mytails=stornadoworries;
else
    {
    if(y<3000)
        mytails=stornado;
    }
    
if (x>8000 && x<12800 && crashing==0)
    {
    sp=(sp*29+32)/30;
    dir=(dir*29+35)/30;
    }
    
if (crashing>0)
    {
    crashing+=global.time;
    
    soundvelocity(global.sndEngine,0,min(100,crashing*2));
    
    repeat(1/global.time)
        {i=instance_create(x,y,objsmoke);
        i.hspeed=lengthdir_x(sp/1.05,dir+random(3));
        i.vspeed=lengthdir_y(sp/1.05,dir+random(3));}
    dir=(dir*99-90)/100;
    if (y<640)
        sp=(sp*29+18)/30;
    else
        sp=(sp*29+24)/30;
    if(timer mod 4 == 0 && y<3400)
        dir+=-2+random(4);
        
    if (dir<-80)
        {if(image_speed==1)instance_create(x,y,objsmexp);
        image_speed=0.2;
        soundstop(global.sndEngine);}
    
    if(y+lengthdir_y(global.time*sp,dir)>=3400-240 && y<3400-240)
        {
        mytails=stornadox;
        
        i=instance_create(x-640,3400,metaline);
        i.x2=x-64;
        i.y2=i.y;
        i.deep=960;
        
        i=instance_create(x+640,3400,metaline);
        i.x2=x+64;
        i.y2=i.y;
        i.deep=960;
        
        i=instance_create(x-64,3400,objspecialgitta);
        
        i=instance_create(x-64,3400,greatbrown);
        i.x2=x+64;
        i.y2=i.y+1024;
        i.c3=make_color_rgb(16,24,32);
        i.c4=c_black;
        }
        
        if (y+lengthdir_y(global.time*sp,dir)>=3400 && y<3400 && instance_exists(objspecialgitta))
            {
            
            sp=sp/2;
            shaking=30;
            soundstop(global.sndWind);
            soundloop(global.sndShaft);
            soundplay(global.sndExplosion);
            sprite_index=stornadobroke1;
            x=objspecialgitta.x+64;
            image_angle=270;
            dir=-90;
            timer=-400;
            
            i=instance_create(x+128,3400+1280,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i=instance_create(x+128,3400+1280+3200,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i=instance_create(x+128,3400+1280+6400,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i=instance_create(x+128,3400+1280+9600,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            
            //send to robot
            sendx=x;
            sendy=3400+1280+12800;
            
            i=instance_create(x-128,3400+1280,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
            i=instance_create(x-128,3400+1280+3200,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
            i=instance_create(x-128,3400+1280+6400,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
            i=instance_create(x-128,3400+1280+9600,metaside);
            i.x2=i.x;
            i.y2=i.y+3200;
            i.deep=-2560;
            
            with (objspecialgitta)
                {
                for(i=0; i<width; i+=12)
                    {
                    a=instance_create(x+i,y,objdebris);
                    a.sprite_index=sprite_index;
                    a.direction=180*(1-i/width);
                    a.speed=2;
                    a.vspeed+=other.sp/1.1;
                    a.depth=-11;
                    }
                //instance_create(x,y,objsmoker);//NOOOO
                //instance_create(x+width,y,objsmoker);
                instance_destroy();
                }
            with (greatbrown)
                {depth=11; c3=c_black;}
            }
            
        if(y>3400)
            {
            if (image_angle>233 && timer<0)
                image_angle-=global.time*3;
            else
                {
                if(timer<0)
                    {
                    timer=0;
                    soundplay(global.sndMetal1);
                    repeat(20)
                        {
                        i=instance_create(x+64,y-56,objspark);
                        i.direction=180-30-random(30);
                        i.vspeed+=sp*0.75;
                        }
                    }
                else
                    {
                    image_angle+=global.time;
                    if(image_angle>=320 && myson>-1)
                        myson=ssave;
                    if(image_angle>330 && mytails>-1)
                        mytails=stornadoworries;
                    if(image_angle>350)
                        {
                        if (mytails>-1)
                            {
                            mytails=-1;
                            i=instance_create(x+lengthdir_x(-30,image_angle)+lengthdir_x(-5,image_angle+90),y+lengthdir_y(-30,image_angle)+lengthdir_y(-5,image_angle+90),objtails1);
                            i.direction=160;
                            i.speed=9;
                            i.vspeed+=sp/2;
                            i.image_yscale=-1;
                            i.image_angle=160;
                            soundplay(global.sndJump);
                            }
                        }
                    if(image_angle>352)
                        {
                        if (myson>-1)
                            {
                            myson=-1;
                            i=instance_create(x+lengthdir_x(31,image_angle+90),y+lengthdir_y(31,image_angle+90),sonic);
                            i.able=0;
                            i.gnd=0;
                            i.direction=170;
                            i.speed=9;
                            i.vspeed+=sp/2;
                            soundplay(global.sndJump);
                            }
                        }
                    }
                
                
                }
            if (random(2)<global.time/5)
                instance_create(x-32+random(64),y-32+random(64),objsmexp);
            }
        if(y>4000 && controlbg.lev<2)
            {controlbg.lev=2;}
        
        if (y<__view_get( e__VW.YView, 0 )-128)//?
            {
            with (metaline)
                instance_destroy();
            with (greatbrown)
                instance_destroy();
            i=instance_create(x,y,robot);
            i.vspeed=sonic.speed+8;
            i.nnx=sendx;
            i.nny=sendy;
            instance_destroy();
            soundplay(global.sndBreakDown);
            for(a=0; a<8; a+=1)
                {
                i=instance_create(x-a*16-32+random(64),y,objdebris);
                i.sprite_index=stornadopieces;
                i.exploding=0;//1/30;
                i.hspeed=random(a/2);
                i.vspeed=sonic.vspeed+9+random(2);
                i.rotation=2+random(10);
                i.image_single=a;
                }
            }
        
        
    }
}
action_set_relative(0);
