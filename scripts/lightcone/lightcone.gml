function lightcone(argument0, argument1, argument2, argument3, argument4, argument5) {
	var h,v,h2,v2,xx,yy,t,hs,vs;

	t=background_get_texture(bgLightTexture);

	hs=argument4;
	vs=argument5;

	xx=argument0-__view_get( e__VW.XView, 0 );
	yy=argument1-__view_get( e__VW.YView, 0 );
	h=lengthdir_x(1,argument2);
	v=lengthdir_y(1,argument2);
	h2=lengthdir_x(1,argument2+90);
	v2=lengthdir_y(1,argument2+90);
	draw_set_color(argument3);
	draw_primitive_begin_texture(pr_trianglestrip,t);
	draw_vertex_texture(xx+vs*h2,yy+vs*v2,0,0);
	draw_vertex_texture(xx+hs*h+vs*h2,yy+hs*v+vs*v2,1,0);

	draw_vertex_texture(xx-vs*h2,yy-vs*v2,0,1);
	draw_vertex_texture(xx+hs*h-vs*h2,yy+hs*v-vs*v2,1,1);
	draw_primitive_end();



}
