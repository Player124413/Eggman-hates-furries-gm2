var xx,yy;
xx=x-lengthdir_x(64,image_angle);
yy=y-lengthdir_y(64,image_angle);

ok=1;
if(point_distance(sonic.x,sonic.y,xx,yy)<32+sonic.radius && boost>=0 && damaged==0)
    {ok=0;
    if(dangerousBlades){
    sonic.damagex=xx+hspeed*global.time;
    sonic.damagey=yy+vspeed*global.time;
    sonic.damaged=1;
    }}

if(point_distance(sonic.x,sonic.y,psx1+hspeed*global.time,psy1+vspeed*global.time)<32 && ps && damaged==0)
    {ok=0;
    if(dangerousBlades){
    sonic.damagex=psx1+hspeed*global.time;
    sonic.damagey=psy1+vspeed*global.time;
    sonic.damaged=1;
    }}
if(point_distance(sonic.x,sonic.y,msx1+hspeed*global.time,msy1+vspeed*global.time)<32 && ms && damaged==0)
    {ok=0;
    if(dangerousBlades){
    sonic.damagex=msx1+hspeed*global.time;
    sonic.damagey=msy1+vspeed*global.time;
    sonic.damaged=1;
    }}
if(point_distance(sonic.x,sonic.y,phx1+hspeed*global.time,phy1+vspeed*global.time)<32 && ph && damaged==0)
    {ok=0;
    if(dangerousBlades){
    sonic.damagex=phx1+hspeed*global.time;
    sonic.damagey=phy1+vspeed*global.time;
    sonic.damaged=1;
    }}
if(point_distance(sonic.x,sonic.y,mhx1+hspeed*global.time,mhy1+vspeed*global.time)<32 && mh && damaged==0)
    {
    ok=0;
    if(dangerousBlades){
    sonic.damagex=mhx1+hspeed*global.time;
    sonic.damagey=mhy1+vspeed*global.time;
    sonic.damaged=1;
    }}
if(sonic.y>y+16 && ok)
    {
    if(spawnKillTimer>0)
        spawnKillTimer-=global.time;
    else if(damaged==0)
        dangerousBlades=1;
    }   
if(sonic.sprite_index==sjump && sonic.damaged!=1 && damaged==0)
    {
    if(point_distance(sonic.x,sonic.y,msx0+hspeed*global.time,msy0+vspeed*global.time)<32 && ms)
        {
        vspeed=sonic.vspeed-14;
        with (sonic)
            {i=instance_create(x,y,objmedexp);
            i.vspeed=vspeed/2;
            i.hspeed=hspeed/2;
            motion_add(point_direction(other.x,other.y,x,y),8);}
        
        f=image_angle-60;
        xx=x+lengthdir_x(base,f);
        yy=y+lengthdir_y(base,f);
        a=instance_create(xx,yy,objdebris);
        a.sprite_index=sproverarm;
        a.image_single=0;
        a.image_angle=ms1;
        a.rotation=-5+random(10);
        a.exploding=1/40;
        xx+=lengthdir_x(ext,ms1);
        yy+=lengthdir_y(ext,ms1);
        a=instance_create(xx,yy,objdebris);
        a.sprite_index=sprsawholder;
        a.image_angle=ms2;
        a.rotation=-5+random(10);
        a.exploding=1/40;
        xx+=lengthdir_x(arm,ms2);
        yy+=lengthdir_y(arm,ms2);
        a=instance_create(xx,yy,objdebris);
        a.sprite_index=sprsaw;
        a.exploding=1/40;
        
        destroyed=4;
        damaged=1;
        ms=0;
        exit;
        }
    if(point_distance(sonic.x,sonic.y,phx0+hspeed*global.time,phy0+vspeed*global.time)<32 && ph)
        {
        vspeed=sonic.vspeed-14;
        
        f=image_angle+120;
        xx=x+lengthdir_x(base,f);
        yy=y+lengthdir_y(base,f);
        a=instance_create(xx,yy,objdebris);
        a.sprite_index=sproverarm;
        a.image_single=0;
        a.image_angle=ph1;
        a.rotation=-5+random(10);
        a.exploding=1/40;
        xx+=lengthdir_x(ext,ph1);
        yy+=lengthdir_y(ext,ph1);
        a=instance_create(xx,yy,objdebris);
        a.sprite_index=sprsawholder;
        a.image_angle=ph2;
        a.rotation=-5+random(10);
        a.exploding=1/40;
        xx+=lengthdir_x(arm,ph2);
        yy+=lengthdir_y(arm,ph2);
        a=instance_create(xx,yy,objdebris);
        a.sprite_index=sprsaw;
        a.exploding=1/40;
        
        destroyed=5;
        damaged=1;
        ph=0;
        exit;
        }
    if(point_distance(sonic.x,sonic.y,mhx0+hspeed*global.time,mhy0+vspeed*global.time)<32 && mh)
        {
        vspeed=sonic.vspeed-14;
        
        f=image_angle-120;
        xx=x+lengthdir_x(base,f);
        yy=y+lengthdir_y(base,f);
        a=instance_create(xx,yy,objdebris);
        a.sprite_index=sproverarm;
        a.image_single=0;
        a.image_angle=ph1;
        a.rotation=-5+random(10);
        a.exploding=1/40;
        xx+=lengthdir_x(ext,ph1);
        yy+=lengthdir_y(ext,ph1);
        a=instance_create(xx,yy,objdebris);
        a.sprite_index=sprsawholder;
        a.image_angle=ph2;
        a.rotation=-5+random(10);
        a.exploding=1/40;
        xx+=lengthdir_x(arm,ph2);
        yy+=lengthdir_y(arm,ph2);
        a=instance_create(xx,yy,objdebris);
        a.sprite_index=sprsaw;
        a.exploding=1/40;
        
        destroyed=6;
        damaged=1;
        mh=0;
        exit;
        }
    }
