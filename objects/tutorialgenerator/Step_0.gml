hue+=global.time;
if (hue>=256)
    hue-=256;
    
wiggle+=(2+sin(ws))*global.time;
if (wiggle>=360)
    wiggle-=360;
ws+=0.02*global.time;
if (ws>2*pi)
    ws-=2*pi;
var __b__;
__b__ = action_if(phase==0 || (phase==5 && trigger>0));
if __b__
{
with sonic
    {
    dir=point_direction(other.x,other.y,x,y);
    motion_add(dir,global.grav/global.meter*global.time);
    sonic.flyRight=dir+90;
    }
}
__b__ = action_if(phase==0 && instance_number(objring)==0);
if __b__
{
var dir;
phase=1;
sonic.flyRight=0;
// Explicitly return control after the opening ring/orbit section.
sonic.specialStopCase = 0;
sonic.physics = 1;
sonic.able = 1;
sonic.lockMovement = 0;
timer=0;
objDreamCircle.nodesChanged=1;
objDreamCircle.mogen=1;
with objDreamCircle
    {
    dir=0;
    for(j=0; dir<90; j+=1)
        {
        dir=j*360/nodes;
        if (dir<=45)
            ng[j+nodes*3/4]=radius/lengthdir_x(1,dir);
        else
            ng[j+nodes*3/4]=radius/lengthdir_x(1,90-dir);
        }
    }
xx=240;
yy=240-128;
with (objTuText)
    instance_destroy();

i=instance_create(0,0,objTuText);
i.txt="HOLD DOWN TO CROUCH#TAP SPACE TO CHARGE#RELEASE DOWN TO SPIN-DASH";
i.alarm[1]=0;
door=instance_create(xx+16,yy+64,objDreamDoor);


}
__b__ = action_if(phase==1);
if __b__
{
// Keep the tutorial interactive even if a previous scripted state left one
// of Sonic's control locks enabled.
if (instance_exists(sonic))
{
    sonic.able = 1;
    sonic.physics = 1;
    sonic.lockMovement = 0;
    sonic.specialStopCase = 0;
}
if(sonic.x>door.x)
    {
    xx+=32;
    trigger=0;
    phase=2;
    
    i=instance_create(xx,yy-128,line);
    i.x2=i.x;
    i.y2=yy;
    //D FLOOR
    i=instance_create(xx,yy-128,line);
    i.x2=xx+256;
    i.y2=i.y;
    
    i=instance_create(xx,yy+128,line);
    repeat(3)
        {
        instance_create(xx,yy,objDreamTile);
        instance_create(xx,yy-128,objDreamTile);
        xx+=128;
        }
    i.y2=i.y;
    i.x2=xx;
    i=instance_create(xx,yy+128,line);
    i.x2=i.x;
    i.y2=yy-256;
    //NOTICE THE CRAZY xx/yy SHIFTING.
    instance_create(xx-64,yy-64,objring);
    
    xx-=128;//RD CORNER
    
    i=instance_create(xx,yy-128,line);
    i.x2=i.x;
    i.y2=yy-256;
    i.depth-=1;//This is because this is a preferred direction to stand at
    
    yy-=256;
    
    instance_create(xx,yy,objDreamTile);
    
    //sonic.flyRight=90;
    door=instance_create(xx+64,yy+16,objDreamDoor);
    door.angle=90;
    
    with (objTuText)
    instance_destroy();
    i=instance_create(0,0,objTuText);
    i.txt="GET THE RING#JUMP NEAR THE WALL AND RUN UP THE WALL#JUMP OFF THE WALL";
    i.alarm[1]=0;
    
    with objDreamCircle
        instance_destroy();
    }
}
__b__ = action_if(phase==2 && instance_number(objring)==0);
if __b__
{
if (trigger==0)
    {sonic.flyRight=90;
    with (objTuText)
        instance_destroy();
    trigger=1;}
}
__b__ = action_if(phase==2);
if __b__
{
if(sonic.y<door.y)
    {
    trigger=0;
    phase=3;
    
    with line
        {if(object_index!=reportingline)
        instance_destroy();}
    with objDreamTile
        instance_destroy();
    with objDreamDoor
        {
        if(id!=other.door)
            instance_destroy();
        }
    
    i=instance_create(xx,yy,line);
    i.x2=xx-256;
    i.y2=i.y;
    i=instance_create(xx-256,yy,line);
    i.x2=i.x;
    i.y2=yy-256;
    i.depth-=1;//This is because this is a preferred direction to stand at
    
    i=instance_create(xx+128,yy,line);
    i.x2=i.x;
    i.y2=yy-128;
    i=instance_create(xx+128,yy-128,line);
    i.x2=xx-128;
    i.y2=i.y;
    i=instance_create(xx-128,yy-128,line);
    i.x2=i.x;
    i.y2=yy-256;
    
    yy-=128;
    instance_create(xx,yy,objDreamTile);
    xx-=128;
    instance_create(xx,yy,objDreamTile);
    xx-=128;
    instance_create(xx,yy,objDreamTile);
    yy-=128;
    instance_create(xx,yy,objDreamTile);
    
    sonic.flyRight=270;
    door=instance_create(xx+64,yy+16,objDreamDoor);
    door.angle=90;
    
    }
}
__b__ = action_if(phase==3);
if __b__
{
if(sonic.y<door.y)
    {
    
    phase=4;
    with line
        {if(object_index!=reportingline)
        instance_destroy();}
    with objDreamTile
        instance_destroy();
    with objDreamDoor
        {
        if(id!=other.door)
            instance_destroy();
        } 
    
    i=instance_create(xx,yy,line);
    i.x2=i.x;
    i.y2=yy-128;
    i=instance_create(xx,yy-128,line);
    i.x2=xx+256;
    i.y2=i.y;
    
    i=instance_create(xx+128,yy,line);
    i.x2=xx+256;
    i.y2=i.y;
    
    yy-=128;
    instance_create(xx,yy,objDreamTile);
    xx+=128;
    instance_create(xx,yy,objDreamTile);
    
    xx+=128;
    
    sonic.flyRight=180;
    door=instance_create(xx-16,yy+64,objDreamDoor);
    door.angle=0;
    
    }
}
__b__ = action_if(phase==4);
if __b__
{
var r;
if(sonic.x>door.x)
    {
    trigger=0;
    phase=5;
    with line
        {if(object_index!=reportingline)
        instance_destroy();}
    with objDreamTile
        instance_destroy();
    with objDreamDoor
        {
        if(id!=other.door)
            instance_destroy();
        }
    r=320;  
    i=instance_create(0,0,objTuText);
    i.txt="PRESS TAB AT ANY TIME TO TOGGLE CONTROL HELP";
    i=instance_create(xx+r,yy+r,objDreamCircle);
    event_user(0);
    x=i.x;
    y=i.y;
    i.steps=64;
    i.radius=r;
    i.nodesChanged=1;
    with objDreamCircle
        {
        goalOn=0;
        nodes=steps;
        for(n=0; n<nodes; n+=1)
            {
            dir=n*360/nodes;
            nr[n]=radius;
            }
        
        dir=0;
        for(j=0; dir<90; j+=1)
            {
            dir=j*360/nodes;
            if (dir<=45)
                nr[j+nodes*1/4]=radius/lengthdir_x(1,dir);
            else
                nr[j+nodes*1/4]=radius/lengthdir_x(1,90-dir);
            }
        }

    }
}
__b__ = action_if(phase==5);
if __b__
{
if ((sonic.x>objDreamCircle.x || sonic.y>objDreamCircle.y) && trigger==0)
    {
    trigger=1;
    timer=0;
    with objDreamDoor
        {
        instance_destroy();
        }
    sonic.flyRight=0;
    sonic.specialStopCase=1;
    with (objDreamCircle)
        {
        antiOut=1;
        goalOn=1;
        for(n=0; n<nodes; n+=1)
            {
            dir=n*360/nodes;
            ng[n]=radius;
            nodesChanged=1;
            }
        }
    }
if (trigger>0)
    {
    timer+=global.time;
    if (timer mod 60 == 0)
        {
        a=((timer/60)mod 4);
        a=floor((45+90*a)*objDreamCircle.nodes/360);
        if (a>=objDreamCircle.nodes)
            a-=objDreamCircle.nodes;
        objDreamCircle.ng[a-3]=304;
        objDreamCircle.ng[a-2]=280;
        objDreamCircle.ng[a-1]=224;
        objDreamCircle.ng[a]=96;
        objDreamCircle.ng[a+1]=224;
        objDreamCircle.ng[a+2]=280;
        objDreamCircle.ng[a+3]=304;
        
        a=2+((timer/60)mod 4);
        a=floor((45+90*a)*objDreamCircle.nodes/360);
        if (a>=objDreamCircle.nodes)
            a-=objDreamCircle.nodes;
        objDreamCircle.ng[a-3]=320;
        objDreamCircle.ng[a-2]=320;
        objDreamCircle.ng[a-1]=320;
        objDreamCircle.ng[a]=320;
        objDreamCircle.ng[a+1]=320;
        objDreamCircle.ng[a+2]=320;
        objDreamCircle.ng[a+3]=320;
        }
    }
if(instance_number(objring)==0)
    {
    with (objDreamCircle)
        {
        for(j=0; j<nodes; j+=1)
            ng[j]=320;
        }
    trigger=0;
    phase=6;
    timer=0;
    sonic.specialStopCase=0;
    sonic.flyRight=90;
    }
}
__b__ = action_if(phase==6);
if __b__
{
var dir;
timer+=global.time;

if (timer==30)
    {
    objDreamCircle.nodesChanged=1;
    objDreamCircle.mogen=2;
    sonic.specialStopCase=0;
    with objDreamCircle
        {
        antiOut=0;
        dir=0;
        for(j=0; dir<90; j+=1)
            {
            dir=j*360/nodes;
            if (dir<=45)
                ng[j+nodes*3/4]=radius/lengthdir_x(1,dir);
            else
                ng[j+nodes*3/4]=radius/lengthdir_x(1,90-dir);
            }
        }
    xx=x+320-128;
    yy=y+320;
    door=instance_create(xx+64,yy+16,objDreamDoor);
    door.angle=270;
    }
if (timer>30)
    {
    if(sonic.y>door.y)
        {
        sonic.flyRight=0;
        with objDreamCircle
            instance_destroy();
        with (objDreamDoor)
            {
            if(id!=other.door)
                instance_destroy();
            }
        phase=7;
        timer=0;
        sonic.specialStopCase=0;
        trigger=0;
        yym=yy;
        refY=yy;
        }
    }
}
__b__ = action_if(phase==7);
if __b__
{
global.mogen=0;
if(yym>__view_get( e__VW.YView, 0 )-160 && yym>=refY-1)
    {
    global.mogen+=10;
    i=instance_create(xx,yym,objDreamWiggle);
    if (lst!=-1)
        i.image_index=objDreamWiggle.image_index;
    lst=1;
    yym-=128;
    }
if(yym<__view_get( e__VW.YView, 0 )-320)
    {
    with (objDreamWiggle)
        {
        if (y2<__view_get( e__VW.YView, 0 )-128)
            instance_destroy();
        }
    yym+=128;
    }

if(__view_get( e__VW.YView, 0 )+720<yy)
    {
    with (objDreamWiggle)
        {
        if (y>__view_get( e__VW.YView, 0 )+480+128)
            instance_destroy();
        }
    yy-=128;
    }
while(__view_get( e__VW.YView, 0 )+544>yy)
    {
    global.mogen+=1;
    i=instance_create(xx,yy,objDreamWiggle);
    if (lst!=-1)
        i.image_index=objDreamWiggle.image_index;
    lst=1;

    yy+=128;
    }
global.time=0.5-sin(cs)/6;
sonic.image_blend=make_color_hsv(255-hue,255,max(0,255-(sonic.y-refY)/40));

cs+=0.03;
if (cs>2*pi)
    cs-=2*pi;
    
if((sonic.y-256-refY)/40>255)
    {
    with all
        {
        if (id!=other.id && object_index!=controlbg && object_index!=objectfg)
            instance_destroy();
        }
    timer=0;
    phase=8;
    global.time=0.5;
    trigger=0;
    controlbg.on=0;
    event_user(1);
    with objmogusbg
        kill=1;
    }
/*if(instance_exists(sonic))
    {
    if (sonic.x>xx+dreamXSkew(sonic.y)+64)
        sonic.hspeed+=global.time*global.grav/global.meter;
    else
        sonic.hspeed-=global.time*global.grav/global.meter;
    }*/
/* */
}
else
{
sonic.image_blend=make_color_hsv(255-hue,255,255);
/* */
}
__b__ = action_if(phase==8);
if __b__
{
timer+=global.time;
if (timer<60)
    {
    soundvolume(global.sndOoze4,1-power(timer/60,2));
    }

if (timer==60)
    {
    soundstop(global.sndOoze4);
    __view_set( e__VW.XView, 0, 0 );
    __view_set( e__VW.YView, 0, 0 );
    instance_create(0,0,objDreamTails);
    }
soundvolume(global.handle,1-power(timer/200,2));
if (timer==200)
    instance_destroy();//This will stop music.
/* */
}
__b__ = action_if(phase==-1);
if __b__
{
phase = 0;
/* */
}
__b__ = action_if(phase<=7);
if __b__
{
var a,b,c;
mogusTimer+=global.time;
if (mogusTimer>20)
    {
    c=floor(random(4));
    if (c==0)
        {
        a=random(640);
        b=-128;
        }
    if (c==1)
        {
        a=random(640);
        b=480+128;
        }
    if (c==2)
        {
        a=-128;
        b=random(480);
        }
    if (c==3)
        {
        a=640+128;
        b=random(480);
        }
    instance_create(a,b,objmogusbg);
    mogusTimer=0;
    }
/* */
}
/*  */
