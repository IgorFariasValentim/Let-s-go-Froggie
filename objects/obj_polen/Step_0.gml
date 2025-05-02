if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	direcao = point_direction(x, y, obj_player.x, obj_player.y - 8);
	pulinho = 0;

	if (distance_to_object(obj_player) < 30){
		velocidade = 0.85;
		y += lengthdir_y(velocidade, direcao);
	}

	if place_meeting(x,y,obj_colider) || place_meeting(x,y,obj_parede){
		part_type_color1(global.particle1, c_yellow);
		part_particles_create(global.p_system,x , y, global.particle1, 5);
	
		instance_destroy(); // Destruir a bolinha
	}

	x += lengthdir_x(velocidade, direcao);
	y += lengthdir_y(velocidade, direcao * random_range(-2,2));



	// Verificar colisão com o jogador
	if (place_meeting(x, y, obj_player)){
		with(obj_player){
			sprite_index = spr_playerdano;
		}
		part_type_color1(global.particle1, c_yellow);
		part_particles_create(global.p_system,x , y, global.particle1, 5);
		screen_shake(20,10);
	    global.vida -= 1.5; // Dano causado
	    instance_destroy(); // Destruir a bolinha
	}
}