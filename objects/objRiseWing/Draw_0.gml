d3d_set_culling(0);

d3d_transform_add_rotation_z(-90);
d3d_transform_add_rotation_y(-point_direction(0,z,point_distance(x,y,cam.x,cam.y),cam.z)+90);
d3d_transform_add_rotation_z(point_direction(x,y,cam.x,cam.y));
d3d_transform_add_translation(x,y,z);

xx=px;
yy=py;
g=0;
if (sign(hsc)==-1)
    g=360;
draw_sprite_ext(sprInWing,0,xx,yy,sign(hsc)*sc,sc,g+sign(hsc)*(d1)+ang,c_white,image_alpha);
xx+=sc*sign(hsc)*lengthdir_x(l1,d1+sign(hsc)*ang)+hsc*lengthdir_x(correction*sc,ang);
yy+=sc*lengthdir_y(l1,d1+sign(hsc)*ang)+hsc*lengthdir_y(correction*sc,ang);
draw_sprite_ext(sprMidWing,0,xx,yy,sign(hsc)*sc,sc,g+sign(hsc)*(d2)+ang,c_white,image_alpha);
xx+=sc*sign(hsc)*lengthdir_x(l2,d2+sign(hsc)*ang)+hsc*lengthdir_x(correction*sc,ang);
yy+=sc*lengthdir_y(l2,d2+sign(hsc)*ang)+hsc*lengthdir_y(correction*sc,ang);
for(i=0; i<3; i+=1)
    {
    draw_sprite_ext(sprOutWing,0,xx,yy,sign(hsc)*sc,sc,g+sign(hsc)*(d3+s3*i)+ang,c_white,image_alpha);
    nx=xx+sign(hsc)*sc*lengthdir_x(64,d3+s3*i+sign(hsc)*ang)+hsc*lengthdir_x(correction*sc,ang);
    ny=yy+sc*lengthdir_y(64,d3+s3*i+sign(hsc)*ang)+hsc*lengthdir_y(correction*sc,ang);
    draw_sprite_ext(sprOutWing2,0,nx,ny,sign(hsc)*sc,sc,g+sign(hsc)*(d3+s3*i-30+s3*2)+ang,c_white,image_alpha);
    }

d3d_transform_set_identity();

d3d_set_culling(1);
