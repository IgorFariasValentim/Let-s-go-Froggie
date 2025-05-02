if x < obj_player.x image_xscale = -1 else if x > obj_player.x image_xscale = 1;
switch (state) {
    case "idle":
		cooldown--;
        if (distance_to_object(obj_player) < detect_radius && cooldown <= 0) {
            state = "warning";
            show_exclamation = true;
            alarm[0] = warning_duration * room_speed; // Converte segundos para frames
        }
    break;
	
	case "warning":
		path_end();
        // o alarme vai tocar
        break;
    
    case "dash":
        var dir = point_direction(x, y, target_x, target_y);
        x += lengthdir_x(dash_speed, dir);
        y += lengthdir_y(dash_speed, dir);
        
        if (point_distance(x, y, target_x, target_y) < dash_speed) {
            state = "return";
			show_exclamation = false;
        }
	break;
    
    case "return":
		cooldown = 120;
        var dir = point_direction(x, y, home_x, home_y);
        x += lengthdir_x(return_speed, dir);
        y += lengthdir_y(return_speed, dir);
        
        if (point_distance(x, y, home_x, home_y) < return_speed) {
            x = home_x;
            y = home_y;
			path_start(path_mosq,spd_path,path_action_continue,true);
            state = "idle";
        }
    break;
}