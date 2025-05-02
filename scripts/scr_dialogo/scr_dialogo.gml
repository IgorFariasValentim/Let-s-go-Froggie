// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_dialogo(){
	switch npc_nome
	{
		case "casarelo":
			ds_grid_add_text("Cara! Perdi minhas chaves e não acho em lugar nenhum.",noone,0,"Casarelo");
			ds_grid_add_text("Eu sou tão lesado!",noone,0,"Casarelo");
		break;
		
		case "Garoto e garota": 
			ds_grid_add_text("Um dia eu juro que vou te levar até a lua.",noone,0,"Garoto");
			ds_grid_add_text("Seu bobão, nenhum sapo chegou até a lua!",noone,0,"Garota");
		break;
		
		case "Sapo triste":
			ds_grid_add_text("A vida nas cavernas tem sido difícil, muitas pessoas estão saindo daqui.",noone,0,"Sapo triste");
		break;
		
		case "Vovó":
			ds_grid_add_text("Froggie, meu remédio acabou, seja um bom netinho e vá lá na farmácia do Antoninho e compre meu remédio.", noone,0,"Vovó Froggie");
			ds_grid_add_text("Toma o dinheiro, e compra um faz-me-rir pra você.",noone,0,"Vovó Froggie");
			ds_grid_add_text("Pode deixar vózinha!",noone,0,"Froggie");
		break;
		
		case "Vôzin":
			ds_grid_add_text("Epa garoto! como está sua vó?",noone,0,"Papa Froggle");
			ds_grid_add_text("Ainda brava com você.",noone,0,"Froggie");
			ds_grid_add_text("Ah...uma pena... bem ouvi dizer que sua vó não está muito bem esses dias irei ver se ela está bem, ok?", noone,0,"Papa Froggle");
			ds_grid_add_text("Obrigado Papa!",noone,0,"Froggie");
			ds_grid_add_text("Aliás, pega esse treco ai no baú antes que eu jogue no lixo.",noone,0,"Papa Froggle");
		break;
		
		case "nerd":
			ds_grid_add_text("Olha garoto, tem muitos monstros perigosos por perto e espinhos mortais.", noone,0,"Garoto");
			ds_grid_add_text("Uma dica...Olha por onde anda.",noone,0,"Garoto");
			ds_grid_add_text("Tá bom então!",noone,0,"Froggie");
		break;
		
		case "garota":
			ds_grid_add_text("Que lugar adorável.", noone,0,"Menina");
			ds_grid_add_text("Amo vir para cá para ver as estrelas.",noone,0,"Menina");
			ds_grid_add_text("Você gosta também?",noone,0,"Menina");
		break;
		
		case "sapocharlisson":
			ds_grid_add_text("Gosto de vir para cá para ver a fonte.", noone,0,"Sapocharlison");
		break;
		
		case "froglette":
			ds_grid_add_text("Oi froggie! Que estranho ver você por aqui! Quer brincar? Tô tão entediada.", noone,0,"Froglette");
			ds_grid_add_text("Desculpa...mas eu tenho que ir comprar o remédio da minha vó, talvez mais tarde!",noone,0,"Froggie");
		break;
		
		case "sapopintado":
			ds_grid_add_text("Aqui é um lugar tão calmo, sempre venho aqui pra tomar um sorvete escutar o canto dos passarinhos.", noone,0,"Sapo pintado");
		break;
		
		case "sapinho":
			ds_grid_add_text("EU AMO VIR AO PARQUE!!!",noone,0,"Sapinho");
		break;
		
		case "empresario":
			ds_grid_add_text("Não ligue para mim sapinho, estou esperando uma pessoa especial.",noone,0,"Sapo formal");
		break;
		
		case "emo":
			ds_grid_add_text("Meu avô deixou minha irmâ no comando depois de descobrir que eu comia os produtos... Velho chato...",noone,0,"Sapo formal");
		break;
	}
}

function ds_grid_add_row(){
	
	
	var _grid = argument[0];
	ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid) + 1);
	return(ds_grid_height(_grid) - 1);
}

function ds_grid_add_text(){
	
	
	var _grid = global.texto_grid
	var _y = ds_grid_add_row(_grid);
	
	_grid[# 0, _y] = argument[0];
	_grid[# 1, _y] = argument[1];
	_grid[# 2, _y] = argument[2];
	_grid[# 3, _y] = argument[3];
}