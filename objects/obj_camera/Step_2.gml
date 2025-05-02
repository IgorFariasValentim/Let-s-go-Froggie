/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
camera_set_view_size(view_camera[VIEW],resolution_width,resolution_height)

if (instance_exists(global.view_target))
{
	var _xto = global.view_target.x - resolution_width / 2;
	var _yto = global.view_target.y - resolution_height / 2;
	
	_xto = clamp(_xto,0,room_width - resolution_width);
	_yto = clamp(_yto,0,room_height - resolution_height);
	
	if (shake_lengh != 0){
		_xto += random_range(-shake_lengh,shake_lengh);
		_yto += random_range(-shake_lengh,shake_lengh);
	}
	
	var _cx = camera_get_view_x(view_camera[VIEW]);
	var _cy = camera_get_view_y(view_camera[VIEW]);
	
	var _nx = lerp(_cx,_xto,VIEW_SPEED);
	var _ny = lerp(_cy,_yto,VIEW_SPEED);
	
	camera_set_view_pos(view_camera[VIEW],_nx,_ny+ 1);
}















