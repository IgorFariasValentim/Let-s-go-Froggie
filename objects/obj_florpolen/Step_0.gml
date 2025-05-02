if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	if instance_exists(obj_player){
		
		if instance_exists(obj_polen){
			soltapolen = false;
		
			if time_anim > 0 {
				sprite_index = spr_florsoltapolen;
				time_anim--;
			}
			else {
				sprite_index = spr_florpolen;
			}
		}else{
			time_anim = 25;
		}
	
		if (distance_to_object(obj_player) <= 80){
			soltapolen = true;
			if !instance_exists(obj_polen) cooldown--;
		
			if soltapolen == true and cooldown < 0{
				if (!instance_exists(obj_polen)){
					var _bolinha = instance_create_layer(x, y-5, "enemys", obj_polen);
					cooldown = 120;
				}
			}
		}
	}
}