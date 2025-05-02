if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	var _quina = place_empty(x+10,y+32 ,obj_colider) or place_empty(x-10,y+32,obj_colider);
	var _spike = place_meeting(x+sign(hsp),y,obj_armadilhas);
	var _colision = place_meeting(x+sign(hsp),y,obj_colider_e);

	if (_quina or _spike or _colision) {
	    if !mudou_dir { 
	        hsp *= -1;
	        image_xscale = -image_xscale;
	        mudou_dir = true; 
	    }
	} else {
	    mudou_dir = false; 
	}


	if distance_to_object(obj_player) <= 100 {
	    estado = "atacando";
	} else {
	    estado = "movendo";
	}

	if estado == "atacando" {
	
		direcao_anterior = image_xscale;
	
	    hsp = 0;
	    soltateia = true;

	    if x < obj_player.x {
	        image_xscale = 1;
	    } else {
	        image_xscale = -1;
	    }

	    if (!instance_exists(obj_cuspe_teia)) {
	        cooldownteia--;
			sprite_index = spr_aranha_idle;
	    }

	    if (soltateia && cooldownteia <= 0 && !instance_exists(obj_cuspe_teia)) {
	        if sprite_index != spr_aranha_atack sprite_index = spr_aranha_atack;
	        var _cuspeteia = instance_create_layer(x - 8 * image_xscale, y - 8, "enemys", obj_cuspe_teia); 
			_cuspeteia.hsp = hsp;
	        cooldownteia = 120;
	    }
	} else if estado == "movendo" {
	
	    sprite_index = spr_aranha_walk;
	    cooldownteia = 0;

		image_xscale = direcao_anterior;
	    hsp = spd * image_xscale;

	        // Inverte a direção caso encontre colisões
	    if _quina or _spike or _colision {
	        hsp *= -1;
	        image_xscale *= -1;
			direcao_anterior = image_xscale; // Atualiza a direção anterior
	    }


	    x += hsp;
	}
}

