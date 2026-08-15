action_set_relative(1);
vspeed+=global.grav*global.meter*global.time;


ts=speed*sign(lengthdir_x(1,direction-point_direction(0,0,ux,uy)));
if(gnd>0)
    {
    angsp=-360*ts/(2*pi*radius);
    gnd-=1;
    }
fixSpeeds();
frictionize();
image_angle += global.time*angsp;
action_set_relative(0);
