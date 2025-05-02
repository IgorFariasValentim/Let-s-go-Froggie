pags = clamp(pags,0,2);

if pags >= 1 {
	if keyboard_check_pressed(ord("C")){
		selecao = !selecao;
		global.item_select = 0;
	}
}

if (keyboard_check_pressed(vk_up)){
	if (pags > 0 and selecao == false){
		pags--;
		yy = lerp(yy,115,0.1);
	}
}
if (keyboard_check_pressed(vk_down)){
	if (pags < 2 and selecao == false){
		pags++;
		yy = lerp(yy,115,0.1);
	}
}

if (keyboard_check_pressed(vk_enter)){
	y1 = 700;
}

if (yy < 700 and yy > 50) layer_enable_fx("transicao",true);

if (yy >= 690) {
	layer_enable_fx("transicao",false);
	if (room != rm_floresta && room != rm_fases) instance_destroy(obj_blur);
	instance_destroy();
}

if pags == 1 {
	if selecao == true {
		if keyboard_check_pressed(vk_up) {
			global.item_select -= 1;
			if global.item_select < 0 global.item_select = 0;
		}else if keyboard_check_pressed(vk_down) {
	        global.item_select += 1;
	        if global.item_select >= array_length(_inv) global.item_select = global.item_select - 1;
	    }
		
		if keyboard_check_pressed(ord("X")){
			modo = true;
			_inv[global.item_select]._funcao();
		}
		
	}else global.item_select = -1;
}