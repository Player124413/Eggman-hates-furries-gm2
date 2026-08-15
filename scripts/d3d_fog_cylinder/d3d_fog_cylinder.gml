function d3d_fog_cylinder(argument0, argument1, argument2) {
	d3d_primitive_begin(pr_trianglestrip);
	for(i=0; i<=360; i+=360/argument2)
	    {
	    xx=lengthdir_x(argument0,i);
	    yy=lengthdir_y(argument0,i);
	    a=min(d3dist(xx,yy,0,cam.x,cam.y,cam.z),cam.fogdist)/cam.fogdist;
	    //a=power(a,1/3);
	    d3d_vertex_color(xx,yy,16,cam.fogcolor,a);
	    d3d_vertex_color(xx,yy,-16,cam.fogcolor,a);
	    }
	d3d_primitive_end();
	d3d_primitive_begin(pr_trianglestrip);
	for(i=0; i<=360; i+=360/argument2)
	    {
	    xx=lengthdir_x(argument0,i);
	    yy=lengthdir_y(argument0,i);
	    a=min(d3dist(xx,yy,0,cam.x,cam.y,cam.z),cam.fogdist)/cam.fogdist;
	    //a=power(a,1/3);
	    d3d_vertex_color(xx,yy,argument1,cam.fogcolor,0);
	    d3d_vertex_color(xx,yy,16,cam.fogcolor,a);
	    }
	d3d_primitive_end();



}
