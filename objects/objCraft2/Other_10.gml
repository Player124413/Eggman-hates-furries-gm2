controlbg.on=1;
    i=instance_create(xx,yy-256,greattexture);
    i.t=background_get_texture(bgCavity1);
    i.hrepeat=9;
    i.x2=xx+1280;
    i.y2=i.y;
    
    i.x3=i.x;
    i.y3=yy;
    
    i.x4=i.x2;
    i.y4=i.y3;
    
makeCavityH(320,-64,1280);
makeCavityH(320,-256,1280);
makeCavityH(640,-640,1280);

i=instance_create(xx,yy,rockline);
xx+=256;
yy-=256;
i.x2=xx;
i.y2=yy;
i.ydeep=i.y+1280;
        
with rockline
    sprite_index=sblueground;

