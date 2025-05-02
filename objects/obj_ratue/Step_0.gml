if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	if instance_exists(obj_player){
		
	dir = point_direction(0,0,sign(hsp),0);
	hsp = lengthdir_x(spd,dir);
	
	//pra nao passar direto
	var _quina = place_empty(x+10,y+32,obj_colider) or place_empty(x-10,y+32,obj_colider);
	var _ground = place_meeting(x,y+1,obj_colider);
	var _spike = place_meeting(x+sign(hsp),y,obj_armadilhas);
	var _colision = place_meeting(x,y,obj_colider_e);
	
	if _ground and _quina or _spike or _colision {
			hsp *= -1;
	}else{
		if hsp > 0 {
			image_xscale = -1;
		}else if hsp < 0 { 
			image_xscale = 1;
		}else{
			image_xscale = sign(hsp);
		}
		
	}

	if (distance_to_object(obj_player) <= 80){
		sprite_index = spr_ratoatack;
		if obj_player.x < x image_xscale = 1;
		if obj_player.x > x image_xscale = -1;
		hsp = 0;
	
		if (!instance_exists(obj_sal)){
			instance_create_layer(obj_ratue.x + 1 * image_xscale,obj_ratue.y + 4,"enemys",obj_sal);
			with(obj_sal){
				image_xscale *= other.image_xscale;
			}
		}
	}else{
		sprite_index = spr_ratoidle;
	}

	//dano
	if instance_place(x,y,obj_hit){
		hp -= 1;
		hsp = 0;
	}

	x += hsp;

	//MORTE
	}

	if (hp <= 0){
		part_type_sprite(global.particle1, spr_fumaca,1,1,0);
		part_type_size(global.particle1, 1, 8,.1,.1);
		part_type_color3(global.particle1,c_white,c_gray,c_dkgray);
		part_type_alpha1(global.particle1, 1);
		part_type_speed(global.particle1, 1, 6, -0.50, 0);
		part_type_direction(global.particle1, 0, 230, 2, 20);
		part_type_orientation(global.particle1,45,90,0,0,0);
		part_type_blend(global.particle1, false);
		part_type_life(global.particle1, 10, 40);

		part_particles_create(global.p_system, obj_caracol.x, obj_caracol.y, global.particle1, 35);
	
		instance_destroy();
	}
}
