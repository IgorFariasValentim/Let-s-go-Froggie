if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	var _quina = place_empty(x+10,y+32,obj_colider) or place_empty(x-10,y+32,obj_colider);
	var _ground = place_meeting(x,y+1,obj_colider);
	var _spike = place_meeting(x+sign(hsp),y,obj_armadilhas);
	var _colision = place_meeting(x,y,obj_colider_e);

	if _ground and _quina or _spike or _colision
	{
	   hsp=-hsp;
	}

	if (hsp > 0) 
	{
	   image_xscale=1;
	}

	if (hsp < 0)
	{
	   image_xscale=-1;
	}
	if instance_place(x,y,obj_hit){
		hp -= 1;
		hsp = 0;
	}

	//MORRE
	if (hp <= 0){
		// Configuração da partícula para imitar explosões do Cave Story
	// Configuração da partícula com formas geométricas para imitar explosões do Cave Story
	part_type_sprite(global.particle1,spr_fumaca,0,0,0);  // Usando forma de quadrado para efeito pixelado
	part_type_size(global.particle1, 1, 1, 0.1, 0.2);  // Tamanho moderado, mantendo o estilo retrô
	part_type_color3(global.particle1, c_white, c_gray, c_orange);  // Cores brilhantes e vibrantes
	part_type_alpha3(global.particle1, 1, 0.8, 0);  // Desaparecimento rápido e gradual
	part_type_speed(global.particle1, 2, 6, -0.5, 0);  // Velocidade moderada para dispersão rápida
	part_type_direction(global.particle1, 0, 360, 0, 0);  // Emissão em todas as direções
	part_type_orientation(global.particle1, 0, 360, 0, 0, 1);  // Rotação completa para dinamismo
	part_type_blend(global.particle1, false);  // Blending desativado para manter o estilo pixelado
	part_type_life(global.particle1, 10, 20);  // Vida curta para uma explosão rápida

	// Criação das partículas para explosão estilo Cave Story
	part_particles_create(global.p_system, obj_caracol.x, obj_caracol.y, global.particle1, 25);




	
		instance_destroy();
	}

	x += hsp;
}