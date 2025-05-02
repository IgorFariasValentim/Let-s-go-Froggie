if !instance_exists(obj_inventario) and !instance_exists(obj_dialogo){
		
	hsp = lengthdir_x(spd,dir);

	if place_meeting(x,y,obj_colider) or place_meeting(x,y,obj_player){
		instance_destroy();
	}

	image_xscale = sign(hsp) * -1;

	x += hsp;
}
