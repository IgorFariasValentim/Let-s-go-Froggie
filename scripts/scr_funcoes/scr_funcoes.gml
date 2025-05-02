//FUNCOES DO JOGO

function screen_shake(lengh,time){
	
	with(obj_camera){
		shake_lengh = lengh;
		shake_time = time;
		alarm[1] = shake_time;
	}
}
	
function add_item(name,desc,sprite,subimg,_function) constructor {
	_nome = name;
	_desc = desc;
	_sprite = sprite;
	_subimg = subimg;
	_funcao =  _function;
}
	
function move_system(_x,_y,dist, lengh){
	
	_x = lerp(0,dist,lengh);
	_y = lerp(0,dist,lengh);
	
	if _y >= dist{
		_y = lerp(_y,ystart,0.2);
	}
	if _x >= dist{
		_x = lerp(_x,xstart,0.2);
	}
}
	
function take_item(item){
	if array_length(global.inv) < obj_controle.inv_max {
		array_push(global.inv, item);
	}
}
	
function blur_effect(layer_name,intensity){
	var blur = instance_exists(obj_blur);
	var _fx_blur = fx_create("_filter_large_blur");
	layer_set_fx(layer_name,_fx_blur);
	fx_set_parameter(_fx_blur,"g_Radius",intensity);

	if (!blur){
		instance_create_layer(x,y,layer_name,obj_blur);
	}
}
	
function approach(val1,val2,amount){
if (val1 < val2)
{
	val1 += amount;
	if (val1 > val2)
	    return val2;
}
else
{
	val1 -= amount;
	if (val1 < val2)
	    return val2;
}
return val1;
}
	



