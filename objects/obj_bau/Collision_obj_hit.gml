sprite_index = spr_bauaberto;
if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	if (global.abriubau == 0){
		screen_shake(5,5);
		if (!instance_exists(obj_maca)){
			instance_create_layer(obj_bau.x,obj_bau.y,"efeitos_visuais",obj_maca);
		}
	}
}