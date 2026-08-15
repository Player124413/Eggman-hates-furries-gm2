function destroy_outside() {
	//This applies only to rotBlock
	if (min(y1,y2)>__view_get( e__VW.YView, 0 )+721 || max(x2,x4)<__view_get( e__VW.XView, 0 )-32)//assuming rot<180
	    instance_destroy();


}
