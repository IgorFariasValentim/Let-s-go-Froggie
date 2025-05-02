home_x = x;
home_y = y;
state = "idle";
detect_radius = 90;
dash_speed = 12;
return_speed = 8;
dash_distance = 125;
target_x = 0;
target_y = 0;
cooldown = 0;
warning_duration = 0.5;
exclamation_sprite = spr_exc;
show_exclamation = false;

spd_path = 2;

path_start(path_mosq,spd_path,path_action_continue,true);