if (keyboard_check_pressed(vk_up)) index--;
if (keyboard_check_pressed(vk_down)) index++;

if (keyboard_check_pressed(vk_enter)){
	if (index == 0){
		instance_create_layer(x,y,"transicao",obj_transition_next);
		global.destino = rm_floresta;
	}else if (index == 1){
		show_message("ainda não temos!");
	}else if (index == 2){
		game_end();
	}
}