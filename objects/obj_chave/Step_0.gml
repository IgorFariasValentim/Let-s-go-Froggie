//verifica se pode seguir o player 
if (seguir) {
	x = lerp(x,obj_player.x,.1);
	y = lerp(y,obj_player.y - 16,.1);
}

//Verificar se a chave estiver perto do cadeado
if (distance_to_object(obj_cadeado) <= 150) && !cair{
	seguir = false;
	x = lerp(x,obj_cadeado.x,.1);
	y = lerp(y,obj_cadeado.y,.1);
}else{
	alarm[0] = 120;
}
if (cair){
	y += 2;
	image_angle = 0;
	image_index = 0;
}

if (y > room_height){
	instance_destroy();
}