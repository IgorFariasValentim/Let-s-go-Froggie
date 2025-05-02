if(global.pause){
	var c = c_white;
	draw_rectangle_color(window_get_width()/3,window_get_height() / 3,window_get_width() / 2 + 150,window_get_height() / 2+150,c,c,c,c,true)
	draw_set_color(c_black);
	draw_rectangle(window_get_width()/3,window_get_height() / 3,window_get_width() / 2 + 150,window_get_height() / 2+150, false);
	draw_set_color(-1);
}