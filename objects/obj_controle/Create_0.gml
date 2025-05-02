global.p_system = part_system_create_layer("efeitos_visuais", true);
global.particle4 = part_type_create();
global.vida_max = 4;
global.vida = 4;
global.dialogo = false;
global.gamepad = -1;

//audio_play_sound(snd_musicafase1,1,true);

//Inventário

global.lista_itens = {
	maca : new add_item(
		"Maçã", 
		"Isso é uma MAÇÃ pode matar sua fome, e recuperar um pouco da sua vida.",
		spr_iconeitens,
		0,
		function _maca(){
			if global.vida <= 3 {
				global.vida += 1;
			} else if global.vida == 3.5 {
				global.vida += 0.5
			}
			
			if global.vida < 4 array_delete(global.inv,global.item_select,1);
		}
	),

	pao : new add_item(
		"Pão",
		"Isso é um PÃO, ele pode servir de refeição e recuperar sua vida.",
		spr_iconeitens,
		1,
		function _pao(){
			if  global.vida <= 3.5 {
				
				global.vida += 0.5;
				array_delete(global.inv,global.item_select,1);
			}
		}
	)

}

global.inv = array_create(0);

inv_max = 8;















