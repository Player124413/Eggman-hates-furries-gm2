d3d_primitive_begin(pr_linelist);
p=1-prog;
d3d_vertex_color(x2*p+x*prog,y2*p+y*prog,z2*p+z*prog,col1,1);
d3d_vertex_color(x2,y2,z2,col2,1);
d3d_primitive_end();

