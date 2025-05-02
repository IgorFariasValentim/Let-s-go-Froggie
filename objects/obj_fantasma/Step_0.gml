if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	if instance_exists(obj_player) {
		    if distance_to_object(obj_player) <= 100 {
		        // fade-in
		        image_alpha = lerp(image_alpha, 0.7, 0.1);
		        visivel = true;
		        atacar = true;

		        dir = point_direction(x, y, obj_player.x, obj_player.y - 8);
		        hsp = lengthdir_x(spd, dir);
		        vsp = lengthdir_y(spd, dir);

		        if x < obj_player.x {
		            image_xscale = -1;
		        } else {
		            image_xscale = 1;
		        }

		        if image_xscale == obj_player.x_scale {
		            // bonzinho
		            if sprite_index != spr_fantasma {
		                sprite_index = spr_fantasma;
		                image_index = 0;
		                image_speed = 1;
		            }
					spd = 0.5;
		            hsp = 0; 
		            vsp = 0;
		        } else {
		            // maligno
					spd = lerp(spd,0.7,0.1);
		            if sprite_index != spr_fantasma_mal {
		                sprite_index = spr_fantasma_mal;
		                image_index = 0;
		                image_speed = 1;
		            }

		            if image_index >= sprite_get_number(sprite_index) - 1 {
		                image_speed = 0;
		            }
		        }

		        x += hsp;
		        y += vsp;
		    } else {
		        // fade-out
		        image_alpha = lerp(image_alpha, 0, 0.1);
		        visivel = false;
		        atacar = false;
		    }
	}
}
