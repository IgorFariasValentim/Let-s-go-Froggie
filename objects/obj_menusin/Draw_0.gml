var _xw		   = (camera_get_view_width(view_camera[VIEW]) / 2) - 50;
var _yh		   = (camera_get_view_height(view_camera[VIEW]) / 2) + 60;
var _sprw_o    = sprite_get_width(spr_ops_menus);
var _sprh_o	   = sprite_get_height(spr_ops_menus);
var _ysair     = _yh + 160;
var _ycarregar = _yh + 90;
var _ymao	   = _yh;
var _mrgx	   = 0; 

_mrgx = lerp(0,_mrgx,0.2);

index = clamp(index,0,index_max);

draw_sprite_ext(spr_title,0,_xw,_yh - 200,3.5,3.5,0,c_white,1);

draw_sprite_ext(spr_ops_menus,0,_xw,_yh,3,3,0,c_white,1);
draw_sprite_ext(spr_ops_menus,1,_xw,_ycarregar,3,3,0,c_white,1);
draw_sprite_ext(spr_ops_menus,2,_xw,_ysair,3,3,0,c_white,1);

if (index == 0){
	sel = 0;
	draw_sprite_ext(spr_ops_menus,3,_xw + 200,_yh,3,3,0,c_white,1);
}else if (index == 1){
	sel = 1;
	draw_sprite_ext(spr_ops_menus,3,_xw + 200,_ycarregar,3,3,0,c_white,1);
}else if (index == 2){
	sel = 2;
	draw_sprite_ext(spr_ops_menus,3,_xw + 200,_ysair,3,3,0,c_white,1);
}




