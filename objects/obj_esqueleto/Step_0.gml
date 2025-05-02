if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	if (instance_exists(obj_player)) {
	    if (distance_to_object(obj_player) <= 200) {
	        if (!instance_exists(obj_telefone)) {
	            cooldowntelefone--;
	        }

	        // Inicia a animação e joga o telefone
	        if (cooldowntelefone <= 0 && !instance_exists(obj_telefone)) {
	            if (sprite_index != spr_esqueleto_jogacell) {
	                sprite_index = spr_esqueleto_jogacell; 
	                image_index = 0; 
	                image_speed = 1.2; 
	            }

	            if (image_index >= image_number) {
	                var _telefone = instance_create_layer(x - 15, y - 15, "enemys", obj_telefone); 
	                cooldowntelefone = 120; 
	                sprite_index = spr_esqueleto; 
	            }
	        }
	    } else {
	        sprite_index = spr_esqueleto;
	        cooldowntelefone = 0;
	    }
	}
}