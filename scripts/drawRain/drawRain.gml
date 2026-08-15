function drawRain(argument0, argument1) {
	var px,py,a,b;

	px=-(__view_get( e__VW.XView, 0 )*argument1) mod (192*argument0);
	py=-(__view_get( e__VW.YView, 0 )*argument1) mod (192*argument0);

	px-=rainmove;
	py+=-(192*argument0)+((rainmove*2) mod (192*argument0));

	while (px<-(192*argument0)) px+=(192*argument0);
	while (px>0) px-=(192*argument0);
	while (py<-(192*argument0)) py+=(192*argument0);
	while (py>0) py-=(192*argument0);

	draw_set_blend_mode(bm_add);
	for(a=0; a<640+(192*argument0); a+=(192*argument0))
	    for(b=0; b<480+(192*argument0); b+=(192*argument0))
	        draw_background_ext(bgRain,__view_get( e__VW.XView, 0 )+px+a,__view_get( e__VW.YView, 0 )+py+b,argument0,argument0,0,c_white,1);
	draw_set_blend_mode(bm_normal);


}
