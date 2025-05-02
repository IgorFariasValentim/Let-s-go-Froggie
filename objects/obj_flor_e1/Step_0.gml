if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	if instance_exists(obj_player){
		//pra ver se tem muro na cara dele :( ou se ele ta perto do player :)
		if (distance_to_object(obj_player) <= 80){
			//se o player ta perto ele vai levar so um socão
			time--;
			if time > 0{
				sprite_index = spr_flor_e_levantando;
			}
			if (time <= 0 and image_index > image_number - 1){
				image_index = 0;
				sprite_index = spr_flor_e_ataque;
				time = 0;
			}
			if sprite_index == spr_flor_e_ataque{
				var dir	  = point_direction(x,y,obj_player.x,obj_player.y);
				var lengh = 2;
				hsp = lengthdir_x(lengh,dir);
			}
		}else{
			//se n ver o player ele vai parar né :)
			sprite_index = spr_flor_e1;
			hsp = 0;
		}
	}
	//olha pro lado e pro outro
	if (obj_player.x > x) image_xscale = -1; 
	if (obj_player.x < x) image_xscale = 1;

	if place_meeting(x+sign(hsp),y,obj_colider) or place_meeting(x+sign(hsp),y,obj_parede) or place_meeting(x+sign(hsp),y,obj_colider_e)
	{
		hsp = 0;
		sprite_index = spr_flor_e1;
	}
	else 
	{
		x += sign(hsp);
	}
}