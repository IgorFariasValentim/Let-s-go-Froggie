//Colisão
#region colisao
repeat(abs(hspd)) {
	if (global.estado != "dano" && global.estado != "morte" && global.estado != "atack"){
		if (place_meeting(x+sign(hspd),y,obj_colider)) {
			if (!place_meeting(x+sign(hspd),y-1,obj_colider)) {
				if (!place_meeting(x+sign(hspd),y-5,obj_colider)) {
					y--;
				}
			}
		}else{
			if (!place_meeting(x+sign(hspd),y+1,obj_colider)) {
				if (place_meeting(x+sign(hspd),y+2,obj_colider)) {
					y++;
					if (!ataque) sprite_index = spr_playerrampa;
				
					part_type_sprite(global.particle1, spr_fumaca,1,1,0);
					part_type_size(global.particle1, 2, 1, 0.1, 0.1);
					part_type_scale(global.particle1, 0.3, 0.3);
					part_type_color1(global.particle1, c_white);
					part_type_alpha1(global.particle1, 1);
					part_type_speed(global.particle1, 1, 3, -0.50, 0);
					part_type_direction(global.particle1, 0, 230, 2, 20);
					part_type_blend(global.particle1, false);
					part_type_life(global.particle1, 10, 15);
				
					part_particles_create(global.p_system, obj_player.x, obj_player.y, global.particle1, 1);
				}
			}
		}
	}
	
	if place_meeting(x+sign(hspd),y,obj_colider) or place_meeting(x+sign(hspd),y,obj_parede){
		hspd = 0;
		break;
	}else{
	    x += sign(hspd);
	}
}
repeat(abs(vspd)) {
	if place_meeting(x,y+sign(vspd),obj_colider) or place_meeting(x,y+sign(vspd),obj_parede) {
		vspd = 0;
		break;
	}else{
	    y += sign(vspd);
	}
}
#endregion















