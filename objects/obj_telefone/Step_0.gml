if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
	//caso nao use a sprite image_angle += 30;
	
	//verifica se colidiu com o player ou alguma outra coisa
	if (place_meeting(x+sign(hsp),y,obj_colider) || place_meeting(x,y+sign(vsp),obj_colider)) || place_meeting(x,y,obj_player){
		instance_create_layer(x,y,"Efeitos",obj_explosao);
		instance_destroy();
	}
	
	//define x e y para as variaveis de mevimentacao
	y+=vsp;
	x+=hsp;
}
