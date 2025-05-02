function player_state_free(){

//estado livre
global.estado = "livre";
	
#region Controles 
	//CONTROLES
	gamepad_set_axis_deadzone(global.gamepad,0.25);
	var _left			 = keyboard_check(vk_left) || gamepad_axis_value(global.gamepad,gp_axislh) < -0.25 or gamepad_button_check_pressed(global.gamepad,gp_padu);
	var _right			 = keyboard_check(vk_right) || gamepad_axis_value(global.gamepad,gp_axislh) > 0.25 or gamepad_button_check_pressed(global.gamepad,gp_padd);
	var _jump			 = keyboard_check(ord("C")) || gamepad_button_check_pressed(global.gamepad,gp_face1);
	var _dash			 = keyboard_check_pressed(ord("X")) || gamepad_button_check_pressed(global.gamepad,gp_shoulderrb);
	var _interact		 = keyboard_check_pressed(ord("E")) || gamepad_button_check_pressed(global.gamepad,gp_face2);
	var _atack			 = keyboard_check_pressed(ord("Z")) || gamepad_button_check_pressed(global.gamepad,gp_face3);
	var _enterinventario = keyboard_check_pressed(vk_enter) || gamepad_button_check_pressed(global.gamepad,gp_face4);
	var _solta_jump		 = keyboard_check_released(ord("C")) || gamepad_button_check_released(global.gamepad,gp_face1);

	var _move = _right - _left != 0;
	var _input_move = _right || _left;
	
	var _ground = place_meeting(x,y+1,obj_colider);
	var _landed = instance_place(x,y+vspd,obj_colider);
	var _wall = place_meeting(x-1,y,obj_colider) || place_meeting(x+1,y,obj_colider);
	var _dash_h = point_direction(0,0,sign(hspd),0);

	vspd += grav;
	vspd = clamp(vspd,vspd_min,vspd_max);
	
#endregion
	
#region atack

	if (!instance_exists(obj_inventario) && !instance_exists(obj_dialogo)){
		//ATAQUE
		if (!dash == false) {
			if (_atack){
				if !ataque {
					image_index = 0;
					ataque = true;
				}
				sprite_index = spr_playeratack;
				//isso reinicia para n ficar dando bugando a animacao
				if (!instance_exists(obj_hit)){
					instance_create_layer(obj_player.x + 25 * x_scale,obj_player.y - 20,"efeitos_visuais",obj_hit);
				}
			}
		}
		if (ataque == true && time_atack > 0){
			time_atack--;
		}
		if (ataque && time_atack <= 0){
			ataque = false;
		}
		if (ataque == false && time_atack <= 0) {
			instance_destroy(obj_hit);
			time_atack = 30;
		}
		
#endregion

#region movimentacao
		//CORRIDA E MOVIMENTAÇAO
		
		if (_move) {
			dir = point_direction(0,0,_right - _left,0);
			spd = approach(spd,spd_max,acc);
			dir_dash = _dash_h;
		}else if (hspd != 0){
			spd = approach(spd,0,dcc);
		}
		
		if (hspd < 1 && hspd > -1){
			if (!ataque) sprite_index = spr_playeridle;
		}
		
		if (_input_move) {
			if (!ataque){
				sprite_index = spr_playerwalk;
			}
		}
		
		//chacando se eu estou no chao e definindo a hspd 
		var _hspd = lerp(hspd,lengthdir_x(spd,dir),0.1);
		
		if (_ground){
			hspd = _hspd;
		}else{
			hspd = lerp(hspd,_hspd,1)
		}
		
		if hspd != 0 {
			x_scale = sign(hspd);
		}
	}
#endregion
	
#region pulo, coyote e wall jump

	var slt = true;
	
	// TIVER NO CHAO
	if (_ground){
		slt = true;
		jump_cont = jump_max;
		coyote_time = coyote_time_max;
	}
	else // SE NAO TIVER NO CHAO
	{
		slt = false;
	    coyote_time--;
		if (vspd < 0){
			if (!ataque){
				sprite_index = spr_playerjump;
			}
		}else if (vspd > 0){
		    if (!ataque){
				sprite_index = spr_playerfall;
			}
		}

		// Se ele soltar pula mais baixo
		if (_solta_jump && vspd < -vspd_max / 2){
			// O vspd vai ser igual ao vspd max negativo dividido por dois
			vspd = -vspd_max / 2;
		}
	}
	
	// JUMP
	if (_jump && coyote_time > 0 || _jump && jump_cont > 0){
		aterr = 1;
		jump_cont--;
		coyote_time = 0;
		vspd = 0;
		vspd -= jump_height;
	}
	
	//checando o wall jump
	var _wall_jump = keyboard_check_pressed(ord("C"));
	var coyote_wall = 0;
	var coyote_wallmax = 20;
	
	//parede direita
	var prdd = place_meeting(x+1,y,obj_colider);
	
	//parede esquerda
	var prde = place_meeting(x-1,y,obj_colider);
	
	if (_wall) {
		coyote_wall = coyote_wallmax;
	}else {
		if (coyote_wall > 0) coyote_wall--;
	}

	if (coyote_wall > 0 && !_ground){
		if (prdd) x_scale = 1;
		if (prde) x_scale = -1;
		if vspd > 1 {
			if (!ataque){
				sprite_index = spr_player_wall_jump;
			}
			vspd = 1;
			if (_wall_jump) {
				vspd -= 7;
				hspd -= 10 * x_scale;
			}
		}
	}
	
#region dash
	// DASH
	if (_dash && dash && !instance_exists(obj_inventario) && !instance_exists(obj_dialogo))
	{
		global.pode_dash = false;
		audio_play_sound(snd_dash,0,false);
		screen_shake(15,5);
		vspd = 0;
		hspd = 0;
		dash_time = 0;
		dash = false;
		alarm[0] = dash_delay;
	    state = player_state_dash;
	}
#endregion
	
#region jump effects
	if (!instance_exists(obj_inventario) && !instance_exists(obj_dialogo)){
		// PARTICULAS AO PULAR
		if (_ground){
			if (_jump && jump_cont <= 2 || _wall && _jump && jump_cont <= 1 || _wall && _jump && jump_cont <= 1)
			{
					part_type_sprite(global.particle1, spr_fumaca,1,1,0);
					part_type_size(global.particle1, 4, 1, 0.1, 0.1);
					part_type_scale(global.particle1, 0.3, 0.3);
					part_type_color1(global.particle1, c_white);
					part_type_alpha1(global.particle1, 1);
					part_type_speed(global.particle1, 1, 3, -0.50, 0);
					part_type_direction(global.particle1, 0, 230, 2, 20);
					part_type_blend(global.particle1, false);
					part_type_life(global.particle1, 20, 40);
	
					part_particles_create(global.p_system, obj_player.x, obj_player.y, global.particle1, 5);
			}
		}
	}
#endregion
	
#region dano
	var _colision_espinho_menorv = instance_place(x,y+vspd,obj_espinhomenor) or instance_place(x+hspd,y,obj_espinhomenor);
	var _colision_espinho_mediov = instance_place(x,y+vspd,obj_espinhomedio1) or instance_place(x+hspd,y,obj_espinhomedio1);
	var _colision_espinho_maiorv = instance_place(x,y+vspd,obj_espinhomaior1) or instance_place(x+hspd,y,obj_espinhomaior1);
	
	var _colide_teia = instance_place(x,y,obj_cuspe_teia);
	var colide_telefone = instance_place(x,y,obj_telefone);
	
	// DANO
	if (_colision_espinho_menorv || _colision_espinho_mediov || colide_telefone)
	{
		dano_time = 10;
		if alarm[4] <= 0
		{
			audio_play_sound(snd_dano,0,false);
			hspd = 0;
			vspd = 0;
			global.vida -= global.dano;
			state = player_state_danov;
			alarm[4] = 120;
		}
	}
	
	if (_colide_teia){
		veneno = true;
		dano_time = 10;
		if alarm[4] <= 0
		{
			audio_play_sound(snd_dano,0,false);
			hspd = 0;
			vspd = 0;
			state = player_state_danov;
			alarm[4] = 120;
		}
	}
	if (veneno) {
		time_veneno--;
		
		if time_veneno > 0{
			spd_max = 1.8;
			if !instance_exists(obj_efeito_lentidao) instance_create_layer(x,y,"efeitos_visuais",obj_efeito_lentidao);
		}else {
			if instance_exists(obj_efeito_lentidao) instance_destroy(obj_efeito_lentidao);
			veneno = false;
			time_veneno = 180;
			spd_max = 2.8;
		}
	}
	
	if (_colision_espinho_maiorv)
	{
		global.vida = 0;
	}
	
	var _colision_e = instance_place(x+hspd,y,obj_inimigos);
	
	if (_colision_e)
	{
		audio_play_sound(snd_dano_caracol,0,false);
		vspd = 0;
		hspd = 0;
		vspd -= 1;
		dano_time = 15;
		dir_dano = point_direction(_colision_e.x,_colision_e.y,x,y);
		dano_force = 6;
		global.vida -= global.dano;
		state = player_state_dano;
	}
	
	if dano_time > 0 {
		if image_alpha >= 1 image_alpha--;
		if image_alpha <= 0 image_alpha++;	
	}
#endregion

#region aterrisou
	if (!instance_exists(obj_inventario) and !instance_exists(obj_dialogo)){
		
		if (!place_meeting(x,y+1,obj_colider)) {
			aterrissou = 0;		
		}else if (_ground){
			
			if (aterrissou == 0)
			{
				part_type_sprite(global.particle1, spr_fumaca,1,1,0);
				part_type_size(global.particle1, 4, 1, 0.1, 0.1);
				part_type_scale(global.particle1, 0.3, 0.3);
				part_type_color1(global.particle1, c_white);
				part_type_alpha1(global.particle1, 1);
				part_type_speed(global.particle1, 1, 3, -0.50, 0);
				part_type_direction(global.particle1, 0, 230, 2, 20);
				part_type_blend(global.particle1, false);
				part_type_life(global.particle1, 20, 40);
	
				part_particles_create(global.p_system, obj_player.x, obj_player.y, global.particle1, 5);
			}
			aterrissou = 1;
		}
	}
#endregion

#region dialogo
	//DIALOGO
	if !instance_exists(obj_inventario){
		if distance_to_object(obj_par_npcs) <= 20
		{
		
			if _interact and global.dialogo == false
			{
				var _npc = instance_nearest(x,y,obj_par_npcs);
				var _dialogo = instance_create_layer(x,y,"dialogo",obj_dialogo);
				_dialogo.npc_nome = _npc.nome
			}
		}
		else
		{
			instance_destroy(obj_dialogo);
		}
	}
	
	var _quina = place_empty(x+10,y+32,obj_colider) or place_empty(x-10,y+32,obj_colider);
#endregion
	
#region detectou borda
	//BORDA SPRITE
	if _ground{
		if hspd == 0{
			if _quina{ 
				if (!ataque){ 
					if !_wall sprite_index = spr_playerborda;
				}
			}
		}
	}
#endregion
	
#region inventario

	//INVENTÁRIO
	if !instance_exists(obj_dialogo){
		if (_enterinventario){
			if (!instance_exists(obj_inventario)){
				instance_create_layer(x,y,"dialogo",obj_inventario);
			}
		}
	}
	
#endregion
	
#region inventario e dialogo existentes
	//INSTÂNCIAS EXISTENTES
	if (instance_exists(obj_inventario)){
		hspd = 0;
		vspd = 0;
		if (!ataque){
			sprite_index = spr_playeridle;
		}
	}
	if instance_exists(obj_dialogo){
		hspd = 0;
		vspd = 0;
		if (!ataque){
			sprite_index = spr_playeridle;
		}
	}
#endregion
	
#region morte ao cair
	//MORRER SE CAIR
	if (y > room_height + 10)
	{
		hspd = 0;
		vspd = 0;
		audio_stop_sound(snd_musicafase1);
		if !instance_exists(obj_transition_restart){
			instance_create_layer(x,y,"transicao",obj_transition_restart);
		}
		global.moedas = 0;
	}
#endregion
	
#region passar room
	//PASSAR DE FASE
	if (instance_place(x,y,obj_colidernextlvl))
	{
		if !instance_exists(obj_transition_next){
			instance_create_layer(x,y,"transicao",obj_transition_next);
		}
	}
#endregion
	
#region fim da vida
	//MORREU SE VIDA = 0
	if (global.vida <= 0)
	{
		audio_stop_sound(snd_musicafase1);
		screen_shake(30,5);
		image_index = 0;
		state = player_state_morte;
		alarm[3] = 50;
		hspd = 0;
		vspd = 3;
		global.moedas = 0;
	}
#endregion
}

function player_state_dash(){
	//estado de dash 
	global.estado = "morte";
	var _inst = instance_create_layer(x,y,layer,obj_rastrodash);
	_inst.sprite_index = sprite_index;
	hspd = lengthdir_x(dash_force,dir_dash);
	dash_time = approach(dash_time, dash_distance,1);
	if (dash_time >= dash_distance)
	{
		hspd = lerp(hspd,0,.5);
		global.pode_dash = true;
		state = player_state_free;
	}
}

function player_state_morte(){
	global.estado = "dano";
	sprite_index = spr_playermorre;
	if (image_index >= image_number - 1) image_speed = 0;
	if (!instance_exists(obj_soul)){
		instance_create_layer(obj_player.x,obj_player.y,layer,obj_soul);
	}
	if alarm[3] <= 0
	{
		if !instance_exists(obj_transition_restart){
			instance_create_layer(x,y,"transicao",obj_transition_restart);
		}
	}
}

function player_state_dano(){
	global.estado = "dano";
	sprite_index = spr_playerdano;
	screen_shake(20,10);
	hspd = lengthdir_x(dano_force,dir_dano);
	if (dano_time > 0){
		dano_time--;
		if (dano_time <= 0){
			state = player_state_free;
		}
	}
}

function player_state_danov(){
	global.estado = "dano";
	sprite_index = spr_playerdano;
	screen_shake(20,10);
	vspd = lengthdir_y(danov_force,danov_dir);
	if (dano_time > 0){
		dano_time--;
		if (dano_time <= 0){
			state = player_state_free;
		}
	}
}